#!/bin/sh
set -e

REMOTE_DIR="GitCleanupDemo-remote.git"
SEED_DIR="GitCleanupDemo-seed"
DEMO_DIR="GitCleanupDemo"

rm -rf "$REMOTE_DIR" "$SEED_DIR" "$DEMO_DIR"

echo "=== Setting up a local bare repository as a stand-in remote ==="
git init --bare "$REMOTE_DIR"

echo "=== Seeding the remote with prior shared history ==="
git clone "$REMOTE_DIR" "$SEED_DIR"
cd "$SEED_DIR"
git config user.name "GitDemo User"
git config user.email "gitdemo.user@example.com"
echo "Root commit" >> README.md
git add README.md
git commit -m "Initial commit on master"
git push origin master
cd ..
rm -rf "$SEED_DIR"

echo "=== Cloning the remote to simulate the machine used for Git-T03-HOL_002 ==="
git clone "$REMOTE_DIR" "$DEMO_DIR"
cd "$DEMO_DIR"
git config user.name "GitDemo User"
git config user.email "gitdemo.user@example.com"

echo "=== Creating the pending local commits carried over from Git-T03-HOL_002 ==="
printf '<hello>\n  <message>Resolved after conflict merge</message>\n</hello>\n' >> hello.xml
git add hello.xml
git commit -m "Resolve merge conflict in hello.xml"

echo "*.orig" >> .gitignore
echo "*.bak" >> .gitignore
git add .gitignore
git commit -m "Ignore merge tool backup files"

echo "=== Verifying master is in a clean state ==="
git status

echo "=== Listing all available branches ==="
git branch -a

echo "=== Pulling the remote repository into master ==="
git pull origin master

echo "=== Pushing the pending changes to the remote repository ==="
git push origin master

echo "=== Verifying the changes are reflected in the remote repository ==="
git --git-dir="../$REMOTE_DIR" log --oneline --graph --decorate

echo "=== Exercise 5 complete ==="
