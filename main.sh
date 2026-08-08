#!/usr/bin/env bash

source ./helpers/addhost.sh
source ./helpers/verify_bin_avail.sh

main() {
	# TODO: melhore a mensagem de erro
	check_binaries || {
		echo "algum binário indisponível"
		exit 1
	}

	# TODO: variável serve de lembrete para funcionalidade futura
	# local file_hosts='/etc/hosts'

	local ip="$1"
	local domain=$(get_host "$ip")
	local addr="$ip $domain"

	# TODO: inserir direto no /etc/hosts
	echo -n "$addr"
}

main "$@"
