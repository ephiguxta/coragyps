valid_binaries=(
	rustscan
)

fill_path_list() {
	paths="${PATH//:/\\n}"
	paths=($(echo -e "$paths"))
}

check_binaries() {
	local -i bin_count=0
	local paths=()
	fill_path_list

	for bin in ${valid_binaries[*]}; do
		for index in $(seq 0 ${#paths}); do
			path="${paths[$index]}"

			# transformando '~' em '/home/<user>'
			local full_path="${path/\~/\/home\/$(whoami)}/${bin}"

			test -z "$path" && continue
			test -e $full_path && bin_count=$(( bin_count + 1 ))
		done
	done

	test $bin_count -eq ${#valid_binaries[@]} && return 0 || return 1
}
