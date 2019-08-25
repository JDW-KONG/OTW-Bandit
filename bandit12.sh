#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit12"
NEXT_LEVEL="bandit13"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="xxd -r data.txt | gzip -d | bzip2 -d | gzip -d | tar -xvO 2>/dev/null | tar -xvO 2>/dev/null | bzip2 -d | tar -xvO 2>/dev/null | gzip -d | cut -d ' ' -f 4"

# function declarations - start

solveBandit12 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit12
