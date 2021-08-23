#!/usr/bin/env bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

## Param1: package name in crates.io(Ex: git-delta)
## Param2: desc
## Param3: command name(Ex: delta)
install_using_cargo() {
    if [ -z "$3" ];then
      cmd_name=$1;
    else
      cmd_name=$3;
    fi;

    echo -e "Checking ${red}\"${cmd_name}\" ${reset}$2...\n"

    if ! type "${cmd_name}" &> /dev/null; then
      echo "Installing ${red}\"${cmd_name}\" ${reset}$2"
      cargo install $1
    fi
}

## Param1: name
## Param2: desc
## Param3: git URL
install_using_golang() {
    echo -e "Checking ${red}\"$1\" ${reset}$2...\n"

    if ! type "$1" &> /dev/null; then
      echo "Installing ${red}\"$1\" ${reset}$2";
      if [ ! -d "$1" ]; then
        git clone $3;
      fi
      cd $1;
      go install $1;
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
install_using_cargo "git-delta" "modern replacement for more/less" "delta"

## install dust
install_using_cargo "du-dust" "Like du but more intuitive." "dust"

## install df
install_using_golang "duf" "Disk Usage/Free Utility" "https://github.com/muesli/duf.git"

## install fd
install_using_cargo "fd-find" "A better way to find entries in file system" "fd"

## install ripgrep
install_using_cargo "ripgrep" "modern replacement for grep/egrep"

## install mcfly
install_using_cargo "mcfly" "fly through your shell history"

## install broot
install_using_cargo "broot" "A better way to navigate directories"

## install sd
install_using_cargo "sd" "sd is an intuitive find & replace CLI."

## install bottom
install_using_cargo "bottom" "A cross-platform graphical process/system monitor"

## glances - cross-platform monitoring tool
if ! type "glances" &> /dev/null; then
  echo "Installing ${red}\"glances\" ${reset}";
  pip install --user glances
fi

## gtop - System monitoring dashboard for terminal.
if ! type "gtop" &> /dev/null; then
  echo "Installing ${red}\"gtop\" ${reset}";
  npm install gtop -g
fi

## install hyperfine
install_using_cargo "hyperfine" "A command-line benchmarking tool."

## install procs
install_using_cargo "procs" "procs is a replacement for ps written in Rust."

## install gping
install_using_cargo "gping" "Ping, but with a graph."

## install dog
## install_using_cargo "dog" "dog is a command-line DNS client."

## install xh
install_using_cargo "xh" "xh is a friendly and fast tool for sending HTTP requests."

##
install_using_golang "cheat" "cheat allows you to create and view interactive cheatsheets on the command-line." "github.com/cheat/cheat/cmd/cheat"

## install zoxide
install_using_cargo "zoxide" "zoxide is a blazing fast replacement for your cd command, inspired by z and z.lua"