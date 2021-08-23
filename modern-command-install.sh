#!/usr/bin/env bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

install_using_cargo() {
    echo -e "Checking ${red}\"$1\" ${reset}$2...\n"

    if ! type "$1" &> /dev/null; then
      echo "Installing ${red}\"$1\" ${reset}$2"
      cargo install $1
    fi
}

echo -e "Checking ${red}rust ${green}tool chain${reset}...\n"

## check rust toolchain
CARGO="cargo"

if ! type "${CARGO}" &> /dev/null; then
  # install foobar here
  echo -e "${red}${CARGO} not found.${reset} you need to install ${green}rust toolchain${reset}.\n"
  echo -e "Running below command as root\n"
  echo "${green}curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh${reset}"
  exit 1;
fi

## install exa
install_using_cargo "exa" "modern replacement for ls"

## install bat
install_using_cargo "bat" "modern replacement for cat"

## install delta
install_using_cargo "git-delta" "modern replacement for more/less"