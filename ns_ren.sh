if [[ $1 == "" || $2 == "" || $3 == "" ]]; then
	if [[ $1 != "-h" ]]; then
		echo "Please provide all arguments."
	fi

	echo "Search recursively for php files and replace the string as supplied

Arguments:
./ns_ren.sh \$dir \$search \$replace

-------------------------------------------------------------------------

Information:
-----------
\$dir 	   	dirname to search inside.
\$search   	string to search for.
\$replace  	string to replace with.
"
else
	for f in `find $1/* -name '*.php'`; do
		printf $f
		while IFS= read -r line;do
			echo "${line/$2/$3}" >> $f.tmp
		done < $f

		echo "}" >> $f.tmp
		mv $f{.tmp,}

		GREEN='\033[0;32m'
		NC='\033[0m' # No Color
		printf "${GREEN} completed ${NC}\n\r"
	done
fi