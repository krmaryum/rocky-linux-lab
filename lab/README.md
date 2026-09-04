# Linux Practice Lab 🚀

A complete hands-on Linux practice environment for beginners and intermediate learners.

This project automatically creates files, directories, logs, scripts, CSV data, and practice resources to help you learn and practice **100+ Linux commands**.

---

# 📌 Features

✅ Creates a complete Linux practice environment  
✅ Generates sample files and directories  
✅ Creates CSV and log files  
✅ Includes shell scripting examples  
✅ Permission practice setup  
✅ Compression practice data  
✅ Great for beginners learning Linux commands

---

# 📂 Project Structure

```bash
linux-practice/
│
├── files/
├── logs/
├── scripts/
├── backup/
├── data/
├── users/
├── temp/
├── projects/
└── compress_me/
```

---

# ⚙️ Requirements

- Docker installed and running
- Terminal / command-line access

---

# 🚀 Docker Classroom Setup

This practice lab is already included inside the Docker image.
You do not need to clone the repository or run the setup script manually.

## 1️⃣ Pull the Image

```bash
docker pull krmaryum/rocky-linux-lab:4.2
```

## 2️⃣ Start the Lab

```bash
docker run -it --name rocky-linux-lab --hostname rocky-lab krmaryum/rocky-linux-lab:4.2
```

## 3️⃣ Practice as labuser

```bash
su - labuser
```

## 4️⃣ Start Split-Screen Practice Mode

```bash
lab-start
```

`lab-start` opens the practice environment in two panes:

```text
┌──────────────────────────────┬──────────────────────────────┐
│ PRACTICE GUIDE               │ PRACTICE TERMINAL            │
│                              │                              │
│ README.md                    │ [labuser@rocky-lab]$         │
│                              │                              │
│ Read the commands here       │ Run the commands here        │
│ while you practice.          │ and observe the output.      │
└──────────────────────────────┴──────────────────────────────┘
```

The left pane keeps the Linux practice guide visible while the right pane is used for running commands.

## Manual Practice Mode

If you do not want to use split-screen mode:

```bash
cd ~/linux-practice
less README.md
```

Press `q` to exit the README viewer.

## Helpful Lab Commands

```bash
lab-start
lab-help
lab-reset
```

- `lab-start` — opens the split-screen practice environment.
- `lab-help` — displays a quick Linux command reference.
- `lab-reset` — restores the practice environment to its original state.

---

# ⚠️ Docker Lab Notes

This is a Docker-based Rocky Linux practice environment, not a full virtual machine.

## Root and labuser

- The container starts as `root`.
- Use `su - labuser` for normal-user practice.
- `labuser` belongs to the `wheel` group.
- `lab-reset` is the only passwordless sudo command configured for `labuser`.

For administrative labs, you can work directly as `root`.

If you want to practice normal sudo password authentication, first set a password as root:

```bash
passwd labuser
su - labuser
sudo whoami
```

## Cron

`crontab` is installed for scheduling practice.

Because this is a container, `systemd` is not the normal init system.
Do not expect `systemctl start crond` to behave like a full Rocky Linux VM.

To start the cron daemon for practice, run as root:

```bash
crond
```

Then a user can edit their crontab with:

```bash
crontab -e
```

## Container Limitation

This lab is excellent for Linux commands, files, users, permissions, processes,
networking tools, text processing, scripting, compression, and troubleshooting.

For full systemd, SELinux, firewalld, kernel, boot, or LVM administration,
use a Rocky Linux VM instead.

---

# 📁 What This Script Creates

## Files

- employees.txt
- fruits.txt
- story.txt
- numbers.txt
- secure.txt
- bigfile.img

## CSV Files

- students.csv

## Logs

- system.log

## Scripts

- hello.sh

## Directories

- backup/
- projects/
- temp/
- compress_me/

---

# 🧪 Linux Commands You Can Practice

## Navigation Commands

```bash
pwd
whoami
date
ls
ls -ltr
clear
cd files
cd ..
```

## File Management (Creation & Deletion)

```bash
touch files/test.txt

rm files/test.txt

mkdir testdir

rmdir testdir
```

## Copy / Move / Rename
```bash
cp files/story.txt backup/

mv files/story.txt files/newstory.txt

mv files/newstory.txt files/story.txt
```

## File Viewing

```bash
cat files/story.txt

less files/story.txt

more files/story.txt

head -3 files/story.txt

tail -2 files/story.txt
```

## Search Commands

```bash
grep "Linux" files/story.txt

egrep "ERROR|WARNING" logs/system.log

find ~/linux-practice -name "*.txt"
```

## Sorting & Unique

```bash
sort files/fruits.txt

sort files/fruits.txt | uniq
```

## Count Lines

```bash
wc -l files/fruits.txt
```

## Shuffle

```bash
shuf files/fruits.txt
```

## Split File

```bash
split -l 5 files/numbers.txt split_
```

## Compare Files

```bash
cp files/story.txt files/story2.txt

cmp files/story.txt files/story2.txt

diff files/story.txt files/story2.txt
```

## Copy / Move / Rename

```bash
cp files/story.txt backup/

mv files/story.txt files/newstory.txt

mv files/newstory.txt files/story.txt
```

## Find Files

```bash
find ~/linux-practice -name "*.txt"
```

## AWK Practice
Print second column:
```bash
awk -F "," '{print $2}' data/students.csv
```

## CUT Practice

```bash
cut -c1-5 files/story.txt
```

## SED Practice
Print line 2:
```bash
sed -n '2p' files/story.txt
```
Replace word:
```bash
sed 's/Linux/UNIX/g' files/story.txt
```

## TR Practice
Uppercase:
```bash
tr '[:lower:]' '[:upper:]' < files/story.txt
```

## FOLD Practice
```bash
echo "ABCDEFGHIJK" | fold -w1
```

## Compression Practice
```bash
gzip
gzip files/story.txt

gunzip files/story.txt.gz
```

## tar
```bash
tar -czf backup.tar.gz compress_me/

tar -xzf backup.tar.gz
```

## zip
```bash
zip files.zip files/fruits.txt files/story.txt

unzip -l files.zip
```

## Process Practice
Run process in background:
```bash
sleep 300 &
```
Check jobs:
```bash
jobs
```
Foreground / Background:
```bash
bg

fg
```

## Kill process:
```bash
ps -ef | grep sleep

pkill sleep
```

## System Information
```bash
hostname

uname -a

lscpu

free -h

df -h

du -sh ~/linux-practice
```

## Networking Practice
```bash
ping google.com

curl http://numbersapi.com/random

wget https://example.com
```

## Environment Variables
```bash
export MYNAME="Khalid"

echo $MYNAME

printenv
```

## Alias Practice
```bash
alias ll='ls -ltr'

ll
```

## Scheduling Practice
```bash
crontab -e
```
Example cron:
```text
* * * * * echo "Hello" >> ~/linux-practice/logs/cron.log
```

## User Management
```bash
sudo useradd testuser

sudo passwd testuser

id testuser

sudo userdel testuser
```

## Permissions
```bash
chmod 755 files/story.txt

chown $USER files/story.txt

chgrp $USER files/story.txt
```

---

# 🎯 Learning Goals

This project helps you learn:

- Linux terminal basics
- File operations
- Directory management
- Text processing
- Shell scripting
- Permissions
- Compression tools
- Networking basics
- Process management

---

# 📚 Recommended Practice Order

Practice in this order:

1. Navigation Commands
2. File Management
3. Text Processing
4. Search Commands
5. Compression
6. Permissions
7. Process Management
8. Networking
9. Automation
10. User Management

---

# 🐧 Happy Learning Linux!

Practice daily and experiment with commands to become comfortable with Linux administration and shell scripting.
