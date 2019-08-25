#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit15"
NEXT_LEVEL="bandit16"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="echo 'BfMYroe26WYalil77FoDi9qh59eK5xNr' | openssl s_client -connect 127.0.0.1:30001 -ign_eof 2>/dev/null | tail -n 3 | sed -n 1p"

# function declarations - start

solveBandit15 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit15
