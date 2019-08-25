#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit7"
NEXT_LEVEL="bandit8"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="cat data.txt | grep millionth | cut -f 2"

# function declarations - start

solveBandit7 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit7
