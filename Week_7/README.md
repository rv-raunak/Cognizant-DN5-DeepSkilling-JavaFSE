# Week 7 — Git

## What We Learnt
- The core local workflow: `git init`, staging, committing, and checking repository state with `git status`
- Configuring repository-level identity and excluding unwanted files/folders with `.gitignore`
- Branching: creating a branch, committing on it in isolation, and merging it back (including the fast-forward case)
- What actually causes a merge conflict, how Git marks it, and how to resolve it by hand and commit the result
- Working with a remote repository: pulling before pushing, and confirming changes land on the remote

Five hands-on exercises covering the core Git workflow, each a runnable `run.sh` script rather than an application:

| # | Exercise | What it covers |
|---|----------|-----------------|
| 1 | Git Setup and First Commit | `git init`, local identity config, staging, first commit, push/pull to a remote |
| 2 | Git Ignore | Excluding `.log` files and a `log/` folder via `.gitignore` |
| 3 | Branching and Merging | Creating a branch, committing on it, diffing, fast-forward merge, deleting the branch |
| 4 | Merge Conflict Resolution | Diverging the same file on two branches, triggering a real conflict, resolving it, committing |
| 5 | Cleanup and Push to Remote | Verifying a clean state, pulling, then pushing pending commits |

## How they were built
Each script reproduces the HOL's exact command sequence end to end against a real local Git repository it creates and tears down on every run — no manual steps required to see the outcome. Two things the original HOL calls for couldn't be scripted directly and are substituted:
- **A real GitLab remote** — Exercises 1 and 5 use a local bare repository (`git init --bare`) as a stand-in `origin` instead, so push/pull work without needing GitLab credentials.
- **The P4Merge GUI tool** — Exercises 3 and 4 use command-line `git diff` and a scripted conflict resolution instead of the visual 3-way merge tool.

Each affected exercise folder has its own `README.md` explaining the substitution and how to swap in the real GitLab URL or P4Merge if you want to do those parts for real. All 5 scripts were actually run to confirm they complete successfully.

## Running the exercises
Run each script from Git Bash (not PowerShell — these are POSIX shell scripts):

```bash
cd "Week 7/Exercise 1 - Git Setup and First Commit"
sh run.sh
```

Repeat for Exercises 2–5, `cd`-ing back to `Week 7` between each.
