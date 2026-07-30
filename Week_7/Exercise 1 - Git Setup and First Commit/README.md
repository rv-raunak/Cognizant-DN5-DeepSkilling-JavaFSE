`run.sh` automates the scriptable parts of this HOL: checking the Git client version, setting a local repo identity, `git init`, creating `welcome.txt`, staging, committing, and a push/pull cycle.

Two parts of the original HOL are machine/account-specific and are not scripted:

- Integrating `notepad++.exe` as the Git default editor (`git config -e`) — this depends on where Notepad++ is installed on your machine and your OS PATH settings.
- The remote repository — the HOL asks you to sign up on GitLab and create a "GitDemo" project there. `run.sh` instead creates a local bare repository (`GitDemo-remote.git`) next to `GitDemo` and uses that as `origin`, so the push/pull steps run end to end without needing real GitLab credentials. To use an actual GitLab remote instead, replace the `git remote add origin ../GitDemo-remote.git` line with your GitLab project's URL.

