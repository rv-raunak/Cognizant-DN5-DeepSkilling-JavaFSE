#!/bin/sh
set -e

DEMO_DIR="GitConflictDemo"
BRANCH="GitWork"

rm -rf "$DEMO_DIR"
mkdir "$DEMO_DIR"
cd "$DEMO_DIR"

echo "=== Initializing repository: $DEMO_DIR ==="
git init -b master
git config user.name "GitDemo User"
git config user.email "gitdemo.user@example.com"

echo "=== Creating initial commit on master ==="
echo "Root commit" >> README.md
git add README.md
git commit -m "Initial commit on master"

echo "=== Verifying master is clean ==="
git status

echo "=== Creating branch: $BRANCH ==="
git checkout -b "$BRANCH"

echo "=== Adding hello.xml on the branch ==="
printf '<hello>\n  <message>Hello from GitWork branch</message>\n</hello>\n' >> hello.xml
git add hello.xml
git commit -m "Add hello.xml on $BRANCH"

echo "=== Updating hello.xml content on the branch ==="
printf '<hello>\n  <message>Hello from GitWork branch</message>\n  <note>Updated on branch</note>\n</hello>\n' > hello.xml
git status

echo "=== Committing the branch update ==="
git add hello.xml
git commit -m "Update hello.xml on $BRANCH"

echo "=== Switching to master ==="
git checkout master

echo "=== Adding a conflicting hello.xml directly on master ==="
printf '<hello>\n  <message>Hello from master branch</message>\n</hello>\n' >> hello.xml
git add hello.xml
git commit -m "Add hello.xml on master with different content"

echo "=== Log across all branches before merge ==="
git log --oneline --graph --decorate --all

echo "=== Command-line diff of hello.xml between master and $BRANCH ==="
git diff master "$BRANCH" -- hello.xml || true

echo "=== Merging $BRANCH into master (expected to conflict) ==="
if git merge "$BRANCH" -m "Merge $BRANCH into master"; then
  echo "No conflict occurred"
else
  echo "=== Conflict detected, git status shows both modified ==="
  git status

  echo "=== Resolving the conflict by combining both versions ==="
  printf '<hello>\n  <message>Hello from master branch</message>\n  <message>Hello from GitWork branch</message>\n  <note>Updated on branch</note>\n</hello>\n' > hello.xml

  git add hello.xml
  git commit -m "Resolve merge conflict in hello.xml"
fi

echo "=== Adding merge tool backup file patterns to .gitignore ==="
echo "*.orig" >> .gitignore
echo "*.bak" >> .gitignore
git add .gitignore
git commit -m "Ignore merge tool backup files"

echo "=== Listing all branches ==="
git branch

echo "=== Deleting the merged branch ==="
git branch -d "$BRANCH"

echo "=== Final log ==="
git log --oneline --graph --decorate

echo "=== Exercise 4 complete ==="
