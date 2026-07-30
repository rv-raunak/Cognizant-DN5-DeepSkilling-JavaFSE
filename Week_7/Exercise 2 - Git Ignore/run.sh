#!/bin/sh
set -e

DEMO_DIR="GitIgnoreDemo"

rm -rf "$DEMO_DIR"
mkdir "$DEMO_DIR"
cd "$DEMO_DIR"

echo "=== Initializing repository: $DEMO_DIR ==="
git init -b master
git config user.name "GitDemo User"
git config user.email "gitdemo.user@example.com"

echo "=== Creating a README so the repo has a first commit ==="
echo "GitIgnore demo repository" >> README.md
git add README.md
git commit -m "Initial commit"

echo "=== Creating files and folders that should be ignored ==="
echo "log entry" >> app.log
mkdir log
echo "log entry in folder" >> log/debug.log

echo "=== Status before .gitignore (log file and folder show as untracked) ==="
git status

echo "=== Creating .gitignore to exclude .log files and the log folder ==="
echo "*.log" >> .gitignore
echo "log/" >> .gitignore

echo "=== Status after .gitignore (log file and folder no longer listed) ==="
git status

echo "=== Committing .gitignore ==="
git add .gitignore
git commit -m "Add .gitignore to exclude log files and log folder"

echo "=== Final status: working tree clean ==="
git status

echo "=== Exercise 2 complete ==="
