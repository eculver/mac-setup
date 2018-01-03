#!/bin/bash
#
# setup.sh is intended to take a new Mac and install all
# desired apps, configuration, dotfiles, etc, so that you
# can go from 0 to working development environment in as
# little time as possible.

# These apps don't exist as homebrew casks so they will be downloaded from an "App registry" that I maintain at pkgs.distributed.io/apps
APPS=(
    Butler
    ClipMenu
    iStats
    Alfred
    PathFinder
)

# These have to be installed with a special fu of some variety
TOOLS=(
    XCode
    Homebrew
    GVM
)

CONFIG=(
    eculver/dotfiles
    snippets.xml
    Configration.butleritems
    Fonts
)

POST_INSTALL=( vim-vundle )

set_shell_to_zsh() {
    // link .zshrc
    // link .zshrc.d
    // restore .zsh_history
    // install .oh-my-zsh
    // change shell to /bin/zsh
}

install_xcode() {
    xcode-select --install
}

install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_homebrews() {
    brew bundle --file="$DIR/Brewfile"
}

main() {
    // shell setup
    // install xcode + developer tools
    // install homebrew + bundle

    // install dotfiles



    echo "APPS: ${APPS[@]}"
    echo "TOOLS: ${TOOLS[@]}"
    echo "CONFIG: ${CONFIG[@]}"
    echo "POST_INSTALL: ${POST_INSTALL[@]}"
}

main "$@"
