source ./helpers/checkip.sh

get_host() {
	local ip="$1"

	# TODO: insira uma msg de erro
	checkip "$ip" || return 1

	local response=$(curl -s -o /dev/null -I "$ip" -w '%header{Location}')
	response=$(echo "$response" | grep -Po '(?<=http(s|):\/\/)([a-z]+|\.)+')

	echo -n "$response"

	return 0
}

# TODO: add_subdomain()
# 
# inserir subdomínio no ip já existente, por exemplo:
# add_subdomain $ip $subdomain
