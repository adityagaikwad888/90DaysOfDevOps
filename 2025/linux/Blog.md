# 🚀 Week 2: Linux System Administration & Automation | #90DaysOfDevOps

Hello everyone! 👋

Welcome to **Week 2** of my **#90DaysOfDevOps** journey. This week, I dove deep into the world of **Linux System Administration and Automation** — the foundation of every DevOps engineer’s toolkit.

From managing users and file permissions to log analysis and volume mounting, I got my hands dirty with some powerful command-line tools that shape the real world of systems engineering. Let me walk you through everything I explored this week. 🔧🐧

---

## 🔧 Project Overview: Linux Server Monitoring & Automation

### 🧠 Context:

> "Imagine you're managing a Linux-based production server. You need to ensure that users, logs, and processes are secure and monitored — and that automation is in place for backups and maintenance."

### 🎯 Objective:

- Practice Linux CLI essentials
- Manage real-world server resources (users, files, logs, storage, processes)
- Automate tasks using shell scripting & cron

---

## 🛠️ Tasks Breakdown

---

### ✅ 1️⃣ User & Group Management

User access control is the first layer of server security.

#### 🔹 Commands Used:

```bash
# Create group and user
sudo groupadd devops_team
sudo useradd -m -G devops_team devops_user
sudo passwd devops_user

# Add sudo privileges
sudo usermod -aG sudo devops_user

# Restrict SSH login
sudo nano /etc/ssh/sshd_config
# Add:
DenyUsers test_user temp_user

sudo systemctl restart sshd
```

🔐 _Granting controlled access ensures only authorized team members can use critical commands or connect via SSH._

---

### ✅ 2️⃣ File & Directory Permissions

Linux's permission model is elegant and powerful.

#### 🔹 Example:

```bash
mkdir /devops_workspace
touch /devops_workspace/project_notes.txt

# Set owner: read/write, group: read-only, others: no access
chmod 740 /devops_workspace/project_notes.txt
ls -l /devops_workspace/project_notes.txt
```

🛡️ `740` = `rwx` for owner, `r--` for group, `---` for others.

---

### ✅ 3️⃣ Log File Analysis using AWK, Grep, Sed

Logs are the lifeline of monitoring and debugging.

#### 🔹 Dataset:

[Linux_2k.log (LogHub GitHub)](https://github.com/cyberdefenders/loghub)

#### 🔹 Key Commands:

```bash
# Download logs
wget https://raw.githubusercontent.com/cyberdefenders/loghub/main/Linux/Linux_2k.log

# Find all errors
grep -i "error" Linux_2k.log

# Extract timestamps
awk '{print $1, $2, $3}' Linux_2k.log | head

# Replace IP addresses with [REDACTED]
sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[REDACTED]/g' Linux_2k.log > secure_log.log

# Most frequent entries
sort Linux_2k.log | uniq -c | sort -nr | head -10
```

🔍 _Perfect exercise for building log pipelines and security anonymization._

---

### ✅ 4️⃣ Volume Management & Disk Usage (Real-World Setup)

Many DevOps tasks involve managing disks on cloud servers (e.g., AWS EC2). Here's how I attached, formatted, and mounted a new raw disk **without partitioning**.

#### 🔹 Step-by-Step:

```bash
# 1. Check attached disks
lsblk

# 2. Format the new raw disk directly
sudo mkfs.ext4 /dev/sdb

# 3. Create a mount point
sudo mkdir -p /mnt/devops_data

# 4. Mount the disk
sudo mount /dev/sdb /mnt/devops_data

# 5. Verify
df -h | grep devops_data
```

#### ✅ Make the Mount Persistent:

```bash
# Get UUID
sudo blkid /dev/sdb

# Edit fstab
sudo nano /etc/fstab

# Add entry (example UUID)
UUID=abc123-xyz  /mnt/devops_data  ext4  defaults,nofail  0  2
```

🧠 _This approach is clean, fast, and ideal when you don’t need to partition disks manually — very common in containerized and VM environments._

---

### ✅ 5️⃣ Process Management & Monitoring

Whether monitoring live traffic or background scripts, process control is vital.

```bash
# Start background process
ping google.com > ping_test.log &

# Monitor it
ps aux | grep ping
top

# Kill the process
kill PID
```

📈 _Commands like `top`, `htop`, and `ps` are the DevOps equivalents of a heart monitor._

---

### ✅ 6️⃣ Automate Backups with Shell Script + Cron

#### 📝 Script: `backup.sh`

```bash
#!/bin/bash
DATE=$(date +%F)
SOURCE="/devops_workspace"
DEST="/backups"
FILENAME="backup_$DATE.tar.gz"

mkdir -p $DEST
tar -czf $DEST/$FILENAME $SOURCE
echo -e "\e[32m✅ Backup complete: $DEST/$FILENAME\e[0m"
```

#### 🔹 Usage:

```bash
chmod +x backup.sh
./backup.sh
```

#### 🔄 Schedule with Cron:

```bash
crontab -e
# Add this line to run daily at 2 AM
0 2 * * * /path/to/backup.sh
```

💾 _Backups are your safety net. Automate them and sleep better._

---

## 🚀 Bonus Tasks (Highly Recommended)

🔸 **Top 5 Common Log Messages**

```bash
awk '{print $0}' Linux_2k.log | sort | uniq -c | sort -nr | head -5
```

🔸 **List files modified in last 7 days**

```bash
find / -type f -mtime -7 2>/dev/null
```

🔸 **Extract only ERROR and WARNING logs**

```bash
grep -E "ERROR|WARNING" Linux_2k.log > alert_logs.txt
```

---

## 💡 Key Takeaways

- ✅ Mastering Linux isn’t optional in DevOps — it’s foundational.
- ✅ Real-world tasks like volume mounting, log analysis, and scripting help develop production-ready skills.
- ✅ Automation with shell scripts and cron is critical for scaling operations.
- ✅ Logs and users are often the first things checked during incidents — know how to handle them!

---
