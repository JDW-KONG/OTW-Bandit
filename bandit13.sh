#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit13"
NEXT_LEVEL="bandit14"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="cat sshkey.private"

# function declarations - start

solveBandit13 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} > sshkey.private;chmod 600 sshkey.private;ssh -i sshkey.private bandit14@bandit.labs.overthewire.org -p 2220 'cat /etc/bandit_pass/bandit14' | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit13
