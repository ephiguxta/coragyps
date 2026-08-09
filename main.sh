#!/usr/bin/env bash

source ./helpers/addhost.sh
source ./helpers/verify_bin_avail.sh

main() {
	# TODO: melhore a mensagem de erro
	check_binaries || {
		echo "algum binário indisponível"
		exit 1
	}

	local addr=""
	local -i rustscan_task=1

	local file_hosts='/etc/hosts'

	local ip="$1"
	local domain=$(get_domain "$ip")

	if [ -z $domain ]; then
		#TODO: caso não tenha necessidade de adicionar o domínio, execute o rustscan
		echo "TODO"
	else
		addr="$ip $domain"
		#FIXME: teste isso na prática antes de atualizar a funcionalidade no readme
		echo -n "$addr" | sudo tee -a "$file_hosts"
	fi

}

main "$@"
