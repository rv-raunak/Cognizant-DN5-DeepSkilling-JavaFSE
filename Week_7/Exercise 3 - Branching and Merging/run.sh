#!/bin/sh
set -e

DEMO_DIR="GitBranchDemo"
BRANCH="GitNewBranch"

rm -rf "$DEMO_DIR"
mkdir "$DEMO_DIR"
cd "$DEMO_DIR"

echo "=== Initializing repository: $DEMO_DIR ==="
git init -b master
git config user.name "GitDemo User"
git config user.email "gitdemo.user@example.com"

echo "=== Creating initial commit on master ==="
echo "Trunk content" >> trunk.txt
git add trunk.txt
git commit -m "Initial commit on master"

echo "=== Creating branch: $BRANCH ==="
git branch "$BRANCH"

echo "=== Listing all local branches (the '*' marks the current branch) ==="
git branch

echo "=== Switching to $BRANCH ==="
git checkout "$BRANCH"

echo "=== Adding a file with content on the branch ==="
echo "New feature content" >> feature.txt
git add feature.txt
git commit -m "Add feature.txt on $BRANCH"

echo "=== Status on branch after commit ==="
git status

echo "=== Switching back to master ==="
git checkout master

echo "=== Command-line diff between master and $BRANCH ==="
git diff master "$BRANCH"

echo "=== Merging $BRANCH into master ==="
git merge "$BRANCH" -m "Merge $BRANCH into master"

echo "=== Log after merge ==="
git log --oneline --graph --decorate --all

echo "=== Deleting the merged branch ==="
git branch -d "$BRANCH"

echo "=== Status after deleting branch ==="
git status
git branch

echo "=== Exercise 3 complete ==="
