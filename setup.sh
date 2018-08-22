#!/bin/bash
#
# setup.sh is intended to take a new Mac and install all
# desired apps, configuration, dotfiles, etc, so that you
# can go from 0 to working development environment in as
# little time as possible.

# These apps don't exist as homebrew casks so they will be downloaded from an
# "App registry" that I maintain at pkgs.distributed.io/apps
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

# These can be installed with `go get -u`
GOBINS=(
    github.com/sourcegraph/go-langserver
    github.com/derekparker/delve/cmd/dlv
)

CONFIG=(
    eculver/dotfiles
    snippets.xml
    Configration.butleritems
    Fonts
)

PREFS=(
    # Mouse: gestures
    # Keyboard: repeat, modifiers
    # Battery: percent
    # Dock: smaller, auto-hide, cleaned
    # Clock: date, 24-hour
)

POST_INSTALL=( vim-vundle )

set_shell_to_zsh() {
    echo "link .zshrc"
    echo "link .zshrc.d"
    echo "restore .zsh_history"
    echo "install .oh-my-zsh"
    echo "change shell to /bin/zsh"
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

install_gobins() {
    for b in "${GOBINS[@]}"; do
        go get -u "$b"
    done
}

main() {
    #  shell setup
    #  install xcode + developer tools
    #  install homebrew + bundles
    #  install gobins
    #  install config
    install_gobins


    echo "APPS: ${APPS[*]}"
    echo "TOOLS: ${TOOLS[*]}"
    echo "CONFIG: ${CONFIG[*]}"
    echo "POST_INSTALL: ${POST_INSTALL[*]}"
}

main "$@"
