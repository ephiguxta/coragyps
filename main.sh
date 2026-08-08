#!/usr/bin/env bash

source ./helpers/addhost.sh

main() {
	# local file_hosts='/etc/hosts'

	local ip="$1"
	local domain=$(get_host "$ip")
	local addr="$ip $domain"

	# TODO: inserir direto no /etc/hosts
	echo -n "$addr"
}

main "$@"
