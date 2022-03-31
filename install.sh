#!/bin/bash

# Define output colors
bold=$(tput bold)
green=$(tput setaf 2)
brown=$(tput setaf 3)
normal=$(tput sgr0)

title() {
  echo
  echo "${bold}==> $1${normal}"
  echo
}

dry() {
  echo "${brown}$@${normal}" | indent
}

indent() {
  sed 's/^/  /'
}

function usage {
	echo "Usage: $(basename "$0") [ --dry-run ]"
}

is_dry_run=false
dry_run=
target_dir="$HOME"
while (($#)); do
	case "$1" in
		--dry-run)
			is_dry_run=true;
			dry_run=dry;
			;;
		--help)
			usage;
			exit 0;
			;;
		*)
			[ "$1" = '--' ] && shift
			if (($#)); then
				# There are unexpected arguments.
				usage
				exit 1
			fi
	esac
	shift
done


$is_dry_run && $dry_run "Dry run mode. Not actually executing anything."

source_dir="$(cd "$(dirname "$0")" > /dev/null; pwd)"
dots_dir="$source_dir/dots"

# Ask for the administrator password upfront
if [ $is_dry_run == false ] ; then
    echo 'Asking for administrator password upfront\n' && sudo -v
fi

. "$source_dir/setup/brew.sh"

# Install symlinks
for file in "$dots_dir"/*; do
	fileName="$(basename "$file" suffix)"
	$dry_run ln -s "$file" "$target_dir/.$fileName"
done

echo
echo "${green}All done!${normal}"