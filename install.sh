#!/bin/bash

if [ ! -f ./install.sh ]; then
	echo "You need to execute this script from the root of your dotfiles"
	exit 1
fi

# Define output colors
bold=$(tput bold)
green=$(tput setaf 2)
normal=$(tput sgr0)

title() {
	echo
	echo "${bold}==> $1${normal}"
	echo
}

indent() {
	sed 's/^/  /'
}

function usage {
	echo "Usage: $(basename "$0") [ --dry-run --install ]"
	echo "	--dry-run for simulating the installation"
	echo "	--install for installing brew packages"
}

while (($#)); do
	case "$1" in
	--help)
		usage
		exit 0
		;;
	*)
		[ "$1" = '--' ] && shift
		if (($#)); then
			# There are unexpected arguments.
			usage
			exit 1
		fi
		;;
	esac
	shift
done

# Ask for the administrator password upfront
echo 'Asking for administrator password upfront' && sudo -v

if test ! "$(which composer)"; then
	title "Install Composer"

	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"

	sudo mv composer.phar /usr/local/bin/composer

	sh "./setup/composer.sh"
fi

echo
echo "${green}All done!${normal}"
