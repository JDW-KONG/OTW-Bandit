#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit20"
NEXT_LEVEL="bandit21"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="echo 'GbKksEFF4yrVs6il55v6gwY5aVje5f0j' | nc -l -s localhost -p 31234 > /tmp/books & sleep 2;./suconnect 31234 > /dev/null;cat /tmp/books"

# function declarations - start

solveBandit20 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} | tail -n 1 | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit20

