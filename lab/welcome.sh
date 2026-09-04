#!/bin/bash

CURRENT_USER="$(whoami)"

echo "============================================================"
echo "              ROCKY LINUX STUDENT PRACTICE LAB"
echo "============================================================"
echo
echo "Welcome!"
echo
echo "Current user:"
echo "  $CURRENT_USER"
echo
echo "Practice lab:"
echo "  /home/labuser/linux-practice"
echo
echo "------------------------------------------------------------"
echo "                    START YOUR PRACTICE"
echo "------------------------------------------------------------"
echo
echo "The README.md file is your complete hands-on practice guide."
echo "It contains 100+ Linux commands and exercises."
echo
echo "Follow the commands in README.md section by section."
echo

if [[ "$CURRENT_USER" == "root" ]]; then
    echo "Recommended:"
    echo "  su - labuser"
    echo "  lab-start"
    echo
    echo "Or manually:"
    echo "  cd ~/linux-practice"
    echo "  less README.md"
else
    echo "Start here:"
    echo "  lab-start"
    echo
    echo "Or manually:"
    echo "  cd ~/linux-practice"
    echo "  less README.md"
fi
echo
echo "Inside README.md:"
echo "  Read a section"
echo "  Run the commands"
echo "  Observe the output"
echo "  Continue to the next section"
echo
echo "Press q to exit the README viewer."
echo
echo "Helpful commands:"
echo "  lab-start   - Open split-screen practice mode"
echo "  lab-help    - Quick Linux command reference"
echo "  lab-reset   - Restore the practice lab"
echo
echo "============================================================"
echo "          READ -> RUN -> OBSERVE -> PRACTICE"
echo "============================================================"
