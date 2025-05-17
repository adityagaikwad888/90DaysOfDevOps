# 🚀 Week 1 of My 90 Days of DevOps Journey

Welcome to Week 1 of my #90DaysOfDevOps!  
In this week, I focused on understanding **Networking Fundamentals** — a core skill for every DevOps engineer.

---

## 📚 Topics Covered

1. OSI Model
2. TCP/IP Model
3. Important Protocols
4. Linux-Based Networking Commands

---

## 1️⃣ Understanding the OSI Model 🧱

The **OSI Model** (Open Systems Interconnection) is a 7-layer conceptual framework to describe how data travels from one device to another.

### 🧩 OSI Model Layers (Top to Bottom)

| Layer | Name         | Role                                       | DevOps Analogy                                                    |
| ----- | ------------ | ------------------------------------------ | ----------------------------------------------------------------- |
| 7     | Application  | User-facing services (HTTP, FTP, DNS)      | Browser requesting a website, Jenkins triggering a GitHub webhook |
| 6     | Presentation | Data formatting, encryption                | SSL/TLS encrypting HTTPS requests                                 |
| 5     | Session      | Manages connections (start, maintain, end) | SSH session from your terminal to server                          |
| 4     | Transport    | Reliable or fast delivery (TCP/UDP)        | Ensuring Docker image uploads fully                               |
| 3     | Network      | Routing and IP addressing                  | EC2 instances communicating across regions                        |
| 2     | Data Link    | MAC addressing, switching                  | Ethernet, VLANs, MAC filtering in VPC                             |
| 1     | Physical     | Hardware, cables, signals                  | NIC cards, Ethernet cables, Wi-Fi adapters                        |

### 💡 Real-Life Analogy: Sending a Letter

- Application: Writing the letter
- Presentation: Encrypting it
- Session: Letting the receiver know
- Transport: Choosing delivery type (courier vs mail)
- Network: Routing the letter
- Data Link: Sorting and packaging
- Physical: Delivery truck and roads

---

## 2️⃣ The TCP/IP Model — Backbone of the Internet 🌐

The **TCP/IP model** is practical, real-world, and only 4 layers:

### 🔍 TCP/IP Model Breakdown

| Layer               | Function                                     | DevOps Example                               |
| ------------------- | -------------------------------------------- | -------------------------------------------- |
| Application         | HTTP, FTP, DNS, SSH                          | `curl`, `scp`, accessing APIs or SSH servers |
| Transport           | TCP (reliable), UDP (fast, connectionless)   | Git operations, CI/CD notifications          |
| Internet            | IP addressing and routing                    | EC2 IPs, Kubernetes service communication    |
| Network Access/Link | Physical transmission (Ethernet, Wi-Fi, MAC) | Docker bridge networks, virtual NICs         |

### 🔄 Data Flow Example

1. Open browser → request `https://devops-blog.io`
2. DNS resolves domain → IP
3. TCP connection opens on port 443
4. Data sent via IP packet → Ethernet → Router

---

## 3️⃣ Protocols & Ports Every DevOps Must Know 🔌

### 🧠 Application Layer

| Protocol | Port(s)      | Purpose             | Use Case Example                         |
| -------- | ------------ | ------------------- | ---------------------------------------- |
| HTTP     | 80           | Web traffic         | Frontend hosting                         |
| HTTPS    | 443          | Secure web traffic  | APIs, webhooks                           |
| SSH      | 22           | Secure shell access | Remote login to servers                  |
| FTP/SFTP | 21/22        | File transfers      | Jenkins backup scripts                   |
| DNS      | 53           | Domain resolution   | Pulling images or connecting to services |
| SMTP     | 25, 465, 587 | Sending email       | Alert systems, monitoring                |
| NTP      | 123 (UDP)    | Time sync           | Server and log consistency               |
| SNMP     | 161/162      | Network monitoring  | Metrics from routers/switches            |

### 🚚 Transport Layer

- **TCP**: Reliable (Git, SSH, HTTPS)
- **UDP**: Fast but unreliable (DNS, NTP)

### 🌍 Internet Layer

- **IP**: Routing packets across networks
- **ICMP**: Ping, traceroute, node health checks

### 🧷 Network Access Layer

- **ARP**: Resolves IP to MAC address
- **Ethernet/Wi-Fi**: Physical data transmission

---

## 4️⃣ Essential Linux Networking Commands 🧪

| Command          | Purpose                     | Example                             |
| ---------------- | --------------------------- | ----------------------------------- |
| `ping`           | Check if host is reachable  | `ping google.com`                   |
| `traceroute`     | Trace packet route          | `traceroute github.com`             |
| `curl`           | HTTP requests               | `curl -I https://api.example.com`   |
| `netstat / ss`   | View active connections     | `ss -tuln`                          |
| `dig / nslookup` | DNS resolution              | `dig github.com`                    |
| `ip`             | Interface and routing info  | `ip a`, `ip route`                  |
| `tcpdump`        | Capture network packets     | `sudo tcpdump -i eth0 port 443`     |
| `nmap`           | Port scanning               | `nmap -sT 192.168.1.1`              |
| `hostname`       | View/set system hostname    | `hostnamectl set-hostname dev-node` |
| `lsof -i`        | Check ports in use          | `sudo lsof -i :3000`                |
| `ethtool`        | NIC details                 | `ethtool eth0`                      |
| `watch`          | Monitor command output live | `watch -n 1 ip a`                   |

---

## 🔚 Summary

This week gave me a strong foundation in networking — from theory to hands-on Linux tools. I now better understand how systems communicate and how to debug network issues like a DevOps engineer.

---

**📝 Blog Post:** [Read full blog here](https://networking-fundamentals-devops-week1.hashnode.dev/networking-fundamentals-for-devops)  
**📅 Week 1 of #90DaysOfDevOps**  
**💻 Follow my journey as I build skills in DevOps, CI/CD, Cloud & Automation.**

---

> ✅ Happy Learning! Let’s keep going strong into Week 2!  
> ✨ Connect on [LinkedIn](https://www.linkedin.com/) | 🌐 Follow on [Hashnode](https://hashnode.com/)
