# ✅ Week 4: Git and GitHub Challenge – Solution

## 🧠 Task 1: Fork and Clone the Repository

```bash
# Forked via GitHub web interface

# Clone the forked repository
git clone https://github.com/adityagaikwad888/90DaysOfDevOps.git

# Navigate into the cloned directory
cd 90DaysOfDevOps/2025/git/01_Git_and_Github_Basics
```

# Create a challenge directory

mkdir week-4-challenge
cd week-4-challenge

# Initialize a new Git repository

git init

# Create a file and add initial content

# Stage and commit the file

git add info.txt
git commit -m "Initial commit: Add info.txt with introductory content"

# Add or set remote with PAT

git remote add origin https://github.com/adityagaikwad888/90DaysOfDevOps.git

# Push to GitHub

git push -u origin my-work

# Pull to verify remote connection

git pull origin my-work

# Check commit history

git log

# Create new branch

git branch feature-update

# Switch to new branch

git checkout feature-update

# Make changes to info.txt (manually or via terminal)

echo "I love working on real-world Git workflows!" >> info.txt

# Stage and commit changes

git add info.txt
git commit -m "Feature update: Enhance info.txt with additional details"

# Push branch to GitHub

git push origin feature-update

# 📘 Task 6: Why Branching Strategies Matter

## 📌 Importance of Branching Strategies in Collaborative Development

Branching strategies are essential for organizing collaborative software development. Here’s why they matter:

- ✅ **Isolating Features and Fixes**  
  Developers can work on individual features or bug fixes without affecting the main codebase. This avoids conflicts and keeps production stable.

- ✅ **Parallel Development**  
  Multiple team members can work on different tasks simultaneously, using separate branches.

- ✅ **Reducing Merge Conflicts**  
  By keeping changes isolated and updated frequently with the main branch, the chances of conflicts reduce significantly.

- ✅ **Smooth Code Reviews and CI/CD**  
  Pull requests from feature branches allow code reviews before merging. Integration tests can also be triggered automatically.

- ✅ **Clean History and Rollbacks**  
  Feature branches can be easily rolled back or removed without polluting the main history.

## 🧪 Common Branching Models

- **Git Flow**: Uses `main`, `develop`, `feature/*`, `release/*`, and `hotfix/*`.
- **GitHub Flow**: Simple strategy for fast delivery; uses `main` and feature branches with PRs.
- **Trunk-based Development**: Encourages short-lived branches merged frequently into the main branch.

---
