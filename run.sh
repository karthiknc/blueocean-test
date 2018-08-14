#!/bin/bash

# suppress command output unless there is a failure
function quiet() {
	if [[ $- =~ x ]]; then set +x; XTRACE=1; fi
	if [[ $- =~ e ]]; then set +e; ERREXIT=1; fi
	tmp=$(mktemp) || return # this will be the temp file w/ the output
	echo -ne "quiet running: ${@} "
	ts_elapsed=0
	ts_start=$(date +%s)
	"${@}" > "${tmp}" 2>&1 &
	cmd_pid=$!
	while [ 1 ]; do
		if [ `uname` == 'Linux' ]; then
			ps -q ${cmd_pid} > /dev/null 2>&1
			running=${?}
		else
			ps -ef ${cmd_pid} > /dev/null 2>&1
			running=${?}
		fi
		if [ "${running}" -eq 0 ]; then
			echo -ne '.'
			sleep 2
			continue
		fi
	break
	done
	wait ${cmd_pid}
	ret=${?}
	ts_end=$(date +%s)
	let "ts_elapsed = ${ts_end} - ${ts_start}"
	if [ "${ret}" -eq 0 ]; then
		echo -ne " finished with code ${ret} in ${ts_elapsed} secs, last lines were:\n"
		tail -n 4 "${tmp}"
	else
		cat "${tmp}"
	fi
	rm -f "${tmp}"
	if [ "${ERREXIT}" ]; then unset ERREXIT; set -e; fi
	if [ "${XTRACE}" ]; then unset XTRACE; set -x; fi
	return "${ret}" # return the exit status of the command
}

quiet python ./pipeline.py
