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
	echo "Usage: $(basename "$0") [ --dry-run --install ]"
	echo "	--install for installing brew packages"
}

is_dry_run=false
dry_run=
install=false
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
		--install)
			install=true
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

# Install brew
if test ! $(which brew); then
    title "Installing Homebrew..."
    $dry_run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if test ! $(which brew); then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

if [ $install == true ] ; then
	. "$source_dir/setup/brew.sh"

	echo "For the system Java wrappers to find this JDK, symlink it with"
	sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

	title "Install Rust"
	if [ $is_dry_run == false ] ; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	fi
fi

title "Install Oh My Zsh"
if [ $is_dry_run == false ] ; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

title "Install powerlevel10k theme"
if [ $is_dry_run == false ] ; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
fi

title "Install TPM"
if [ $is_dry_run == false ] ; then
	git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo
echo "${green}All done!${normal}"
