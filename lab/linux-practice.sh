#!/bin/bash

# ============================================================
# Linux Practice Lab Setup Script
# ============================================================
# This script creates a hands-on Linux practice environment
# with files, folders, logs, CSV data, scripts, permissions,
# and compression practice data.
# ============================================================

set -euo pipefail

LAB_DIR="/home/labuser/linux-practice"
README_SOURCE="/usr/local/share/rocky-linux-lab/README.md"

RESET_MODE="${RESET_MODE:-0}"

if [[ "$RESET_MODE" == "1" ]]; then
    echo "Resetting existing practice environment..."

    if [[ -d "$LAB_DIR" ]]; then
        find "$LAB_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +
    fi
fi

# ============================================================
# 1. Create Practice Environment
# ============================================================

echo "Creating practice environment..."
mkdir -p "$LAB_DIR"/{files,logs,scripts,backup,data,users,temp}
echo "Practice environment created at: ${LAB_DIR}"

if [[ -f "$README_SOURCE" ]]; then
    cp "$README_SOURCE" "$LAB_DIR/README.md"
    echo "Practice guide installed: README.md"
fi

# ============================================================
# 2. Create Sample Text Files
# ============================================================

echo "Creating sample text files..."

# employees.txt
cat > ${LAB_DIR}/files/employees.txt <<EOF_EMPLOYEES
1,John,IT,5000
2,Alice,HR,4500
3,Bob,Finance,6000
4,David,IT,5500
5,Emma,Sales,4000
6,John,IT,5000
EOF_EMPLOYEES

echo "Created: employees.txt"

# fruits.txt
cat > ${LAB_DIR}/files/fruits.txt <<EOF_FRUITS
apple
banana
orange
mango
banana
apple
grapes
kiwi
EOF_FRUITS

echo "Created: fruits.txt"

# story.txt
cat > ${LAB_DIR}/files/story.txt <<EOF_STORY
Linux is powerful.
Linux is secure.
Linux is fast.
Practice makes perfect.
Commands are important.
Automation saves time.
EOF_STORY

echo "Created: story.txt"

# numbers.txt
seq 1 20 > ${LAB_DIR}/files/numbers.txt
echo "Created: numbers.txt"

# ============================================================
# 3. Create CSV Practice File
# ============================================================

echo "Creating CSV file..."

cat > ${LAB_DIR}/data/students.csv <<EOF_STUDENTS
ID,Name,Marks,City
1,Aman,85,Delhi
2,Rahul,78,Mumbai
3,Priya,92,Pune
4,Neha,88,Chennai
5,Karan,67,Delhi
EOF_STUDENTS

echo "Created: students.csv"

# ============================================================
# 4. Create Log Practice File
# ============================================================

echo "Creating log file..."

cat > ${LAB_DIR}/logs/system.log <<EOF_LOG
INFO Server started
ERROR Database failed
INFO User login successful
WARNING Disk space low
ERROR Network timeout
EOF_LOG

echo "Created: system.log"

# ============================================================
# 5. Create Empty Files for Wildcard Practice
# ============================================================

echo "Creating empty files..."
touch ${LAB_DIR}/files/file{1..5}.txt
echo "Created: file1.txt to file5.txt"

# ============================================================
# 6. Create Additional Directories
# ============================================================

echo "Creating additional directories..."
mkdir -p "$LAB_DIR"/projects
mkdir -p "$LAB_DIR"/backup/archive
mkdir -p "$LAB_DIR"/temp/testing
echo "Created: projects, backup/archive, temp/testing"

# ============================================================
# 7. Create Large File for truncate Practice
# ============================================================

echo "Creating large file..."
truncate -s 50M ${LAB_DIR}/files/bigfile.img
echo "Created: bigfile.img"

# ============================================================
# 8. Create Shell Script Practice File
# ============================================================

echo "Creating hello.sh script..."

cat > ${LAB_DIR}/scripts/hello.sh <<EOF_HELLO
#!/bin/bash

echo "Hello Linux"
date
whoami
EOF_HELLO

chmod +x ${LAB_DIR}/scripts/hello.sh
echo "Created and made executable: hello.sh"

# ============================================================
# 9. Create Permission Practice File
# ============================================================

echo "Creating permission practice file..."
touch ${LAB_DIR}/files/secure.txt
chmod 600 ${LAB_DIR}/files/secure.txt
echo "Created: secure.txt with 600 permission"
ls -ltr ${LAB_DIR}/files/secure.txt

# ============================================================
# 10. Create Compression Practice Data
# ============================================================

echo "Creating compression practice data..."
mkdir -p "$LAB_DIR"/compress_me
touch ${LAB_DIR}/compress_me/a.txt \
      ${LAB_DIR}/compress_me/b.txt \
      ${LAB_DIR}/compress_me/c.txt
echo "Created: compress_me directory with a.txt, b.txt, c.txt"

# ============================================================
# 11. Final Message
# ============================================================

echo ""
echo "Linux practice lab setup completed successfully!"
echo "Go to your lab folder with: cd ${LAB_DIR}"
echo "Run sample script with: ./scripts/hello.sh"
