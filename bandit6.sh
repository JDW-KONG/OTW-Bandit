#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit6"
NEXT_LEVEL="bandit7"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="find / 2>/dev/null -type f -size 33c -group bandit6 -user bandit7 | xargs cat"

# function declarations - start

solveBandit6 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit6
