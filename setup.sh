#!/bin/bash
#
# setup.sh is intended to take a new Mac and install all
# desired apps, configuration, dotfiles, etc, so that you
# can go from 0 to working development environment in as
# little time as possible.

# These apps don't exist as homebrew casks so they will be downloaded from an
# "App registry" that I maintain at pkgs.distributed.io/apps
APPS=(
    iStats
    Alfred
    Backblaze
    RescueTime
)



# These can be installed with `go get -u`
GOBINS=(
    github.com/sourcegraph/go-langserver
    github.com/derekparker/delve/cmd/dlv
)

# Global python packages to be installed with `pip3 install ...`
PYPIPS=(
    neovim
)

CONFIG=(
    eculver/dotfiles
    snippets.xml
    Configration.butleritems
    Fonts
)

# MacOS `defaults`
PREFS=(
    # Mouse: gestures
    # Keyboard: repeat, modifiers
    # Battery: percent
    # Dock: smaller, auto-hide, cleaned
    # Clock: date, 24-hour
)

set_shell_to_zsh() {
    echo "link .zshrc"
    echo "link .zshrc.d"
    echo "restore .zsh_history"
    echo "install .oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "install plugins"
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

    #  mkdir ~/.rubies -- add to dotfiles
    #  ruby-install $RUBY_VERSION  -- get latest ruby version?
    #  tmux plugins
    #  import gpg key?
    #  gpg --list-secret-keys --keyid-format LONG
    #  git config --global user.signingkey $KEY

    echo "APPS: ${APPS[*]}"
    echo "TOOLS: ${TOOLS[*]}"
    echo "CONFIG: ${CONFIG[*]}"
}

main "$@"
