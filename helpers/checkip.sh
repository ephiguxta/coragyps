checkip() {
	local ip="$1"

	grep -qE '^([0-9]{,3}\.){3}[0-9]{,3}$' <<< "$ip" && return 0 || return 1
}
