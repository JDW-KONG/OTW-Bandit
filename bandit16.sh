#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit16"
NEXT_LEVEL="bandit17"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="echo '`cat ${PW_FILE}`' | openssl s_client -connect 127.0.0.1:31790 -ign_eof 2>/dev/null | grep -i 'BEGIN RSA PRIVATE KEY' -A 26"
COMMAND2="ssh -i sshkey2.private ${NEXT_LEVEL}@${HOST} -p ${PORT} 'cat /etc/bandit_pass/bandit17'"

# function declarations - start

solveBandit16 () {
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} ${COMMAND} > sshkey2.private && chmod 600 sshkey2.private;${COMMAND2} | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit16
