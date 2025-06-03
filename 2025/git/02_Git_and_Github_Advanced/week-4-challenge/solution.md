# Git & GitHub Advanced Challenge - Week 4

## Task 1: Working with Pull Requests (PRs)

### ✅ Steps to Create a Pull Request

1. **Fork & Clone**

   ```bash
   git clone <your-forked-repo-url>
   cd <repo-name>
   ```

2. **Create Feature Branch & Make Changes**

   ```bash
   git checkout -b feature-branch
   echo "New Feature" >> feature.txt
   git add .
   git commit -m "Added a new feature"
   git push origin feature-branch
   ```

3. **Create PR on GitHub**

   - Navigate to the original repo.
   - Click "Compare & Pull Request".
   - Add a descriptive title and message.
   - Assign reviewers and submit.

### ✅ Best Practices for PR Description

- Clear title and summary.
- Explain the motivation for the change.
- List changes made.
- Include screenshots or references if applicable.
- Mention related issue numbers (e.g., Fixes #42).

---

## Task 2: Undoing Changes – Reset & Revert

### 🔁 Differences Between `reset` and `revert`

| Git Command | Description                            | Effect on History | Use Case                       |
| ----------- | -------------------------------------- | ----------------- | ------------------------------ |
| `reset`     | Moves HEAD to earlier commit           | Rewrites history  | Local undo/fix                 |
| `revert`    | Creates new commit that undoes another | Preserves history | Undo in shared/public branches |

### 📌 When to Use:

- Use `reset` for local, safe cleanup.
- Use `revert` for collaborative environments to avoid breaking history.

---

## Task 3: Stashing - Save Work Without Committing

### 📦 When to Use `git stash`

- When you need to switch branches or pull without committing half-done work.
- Temporarily park your changes.

### 🔄 `git stash apply` vs `git stash pop`

| Command           | Description                                             |
| ----------------- | ------------------------------------------------------- |
| `git stash apply` | Re-applies the stash but **keeps it** in stash list     |
| `git stash pop`   | Re-applies the stash and **removes** it from stash list |

---

## Task 4: Cherry-Picking - Selectively Apply Commits

### 🍒 How Cherry-Picking Is Used

- Apply a **specific commit** (e.g., a hotfix) from one branch into another without merging the entire branch.
- Example: apply only a bug fix from `feature-x` into `main`.

### ⚠ Risks of Cherry-Picking

- May cause merge conflicts.
- Can duplicate commits if used carelessly.
- Creates a new commit (not a perfect replica).

---

## Task 5: Rebasing - Keeping a Clean Commit History

### 🔄 Difference Between Merge & Rebase

| Feature  | `git merge`               | `git rebase`            |
| -------- | ------------------------- | ----------------------- |
| History  | Keeps all commits         | Creates linear history  |
| Commits  | Extra merge commit        | No merge commit         |
| Use Case | Preserve complete history | Clean, readable history |

### ⭐ Best Practices

- Use `rebase` before merging feature branches.
- Never rebase commits that have been pushed to a shared repo.

---

## Task 6: Branching Strategies – Complete Solution with Workflow Architectures

### 🔍 Why Branching Strategies Matter

A branching strategy defines how your team collaborates using Git. It impacts:

- Speed of delivery
- Code quality
- Conflict resolution
- CI/CD efficiency

Let’s examine **the top 4 industry-standard branching strategies**, their **architectural diagrams**, and **DevOps relevance**.

### 1. **Mainline Strategy (Trunk-Based Development)**

> Frequent commits to a single `main` branch or short-lived branches, integrated via CI.

#### 📌 Key Traits:

- No long-lived branches
- CI/CD pipelines validate each commit
- Encourages pair programming and tight feedback loops

#### 🏗️ Architecture:

```
main
 └───●──●──●──●──●──●
         ↑
       (Feature)
```

#### ✅ Pros:

- Simplifies history
- Promotes fast iterations
- High automation compatibility

#### ⚠ Cons:

- Requires strong CI gates
- Not ideal without test automation

#### 🧪 Best For:

Fast-moving teams doing Continuous Delivery and Test-Driven Development (TDD)

---

### 2. **Feature Branch Strategy (aka GitHub Flow)**

> Isolated development of features in dedicated branches, merged into `main` via PRs.

#### 🏗️ Architecture:

```
main
 └───●────●────●────●────●
           \       \
        feature1   feature2
           ●         ●
           └──PR─────┘
```

#### ✅ Pros:

- Isolated work environments
- Supports PR-based collaboration
- Easy to revert/rebase per feature

#### ⚠ Cons:

- Merge conflicts if not rebased frequently
- Delays if PRs pile up

#### 🧪 Best For:

Agile teams, CI pipelines, moderate codebase complexity

---

### 3. **Git Flow Strategy**

> A well-structured model with multiple branches: `main`, `develop`, `feature/*`, `release/*`, and `hotfix/*`.

#### 🏗️ Architecture:

```
main ────────●──────────────●───────●
              \             ↑
             hotfix        /
              ●───────────┘
                ↑
           release
                ↑
         develop ─────●────●────●
                    /      \
              feature1    feature2
```

#### ✅ Pros:

- Supports structured release cycles
- Ideal for parallel development
- Hotfix branches allow rapid production fixes

#### ⚠ Cons:

- Overhead in managing branches
- Slower velocity
- Hard to adopt without Git discipline

#### 🧪 Best For:

Large-scale enterprise projects, multiple release versions, tight QA cycles

---

### 4. **Forking Workflow**

> Developers fork the repo and submit changes via Pull Requests to the upstream project.

#### 🏗️ Architecture:

```
Original Repo:  upstream/main
                    ●──●──●──●

Contributor Fork: origin/main
                    └──●──●
                        ↑
                    feature work
```

#### ✅ Pros:

- Maintains core repo security
- External contributors can freely experiment

#### ⚠ Cons:

- Not practical for tight team collaboration
- Difficult to test in an integrated environment

#### 🧪 Best For:

Public open-source projects on GitHub/GitLab

---

### 🎯 Comparison Table

| Strategy           | Suitable For             | CI/CD Ready  | Complexity | Use Case                             |
| ------------------ | ------------------------ | ------------ | ---------- | ------------------------------------ |
| **Mainline**       | High-speed DevOps teams  | ✅ Yes       | 🔹 Low     | Continuous Deployment, Microservices |
| **Feature Branch** | Small to mid-size teams  | ✅ Yes       | 🔸 Medium  | PR workflows, Sprint Planning        |
| **Git Flow**       | Large enterprises        | ⚠ Manual     | 🔺 High    | Release cycles, Legacy systems       |
| **Forking**        | Open-source contributors | ❌ Not Ideal | 🔹 Low     | Community involvement                |

---

### 🧠 Final Recommendation for DevOps

For fast, automated, and scalable pipelines in a DevOps setup:

- ✅ **Best Fit:** **Mainline (Trunk-Based)** or **Feature Branch Strategy**
- ⚠ **Avoid:** Git Flow in CI/CD unless project demands structured release environments
- 💬 **Use Forking** only when security and contributor separation are priorities

---
