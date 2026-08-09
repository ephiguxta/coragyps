source ./helpers/checkip.sh

get_url() {
	local ip="$1"
	local url=$(grep -Po '(?<=http(s|):\/\/)([a-z]+|\.)+' <<< "$ip")

	echo -n "$url"
}

get_domain() {
	local ip="$1"

	# TODO: insira uma msg de erro
	checkip "$ip" || return 1

	local response=$(curl -s -o /dev/null -I "$ip" -w '%header{Location}')
	test -z $response && return 1

	response=$(get_url $ip)

	echo -n "$response"

	return 0
}

# TODO: add_subdomain()
# 
# inserir subdomínio no ip já existente, por exemplo:
# add_subdomain $ip $subdomain
