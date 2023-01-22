#!/usr/bin/false
# ~/.zshrc
#
# Copyright (c) 2023 Chorismate <me@chorismate.dev>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

echo -n "Running lines configured by compinstall..."
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/tsgoddessa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
echo " Done."

echo -n "Running lines configured by zsh-newuser-install..."
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd beep nomatch notify
unsetopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
echo " Done."

# Autoload stuff
autoload -U colors && colors

# Set env variables
echo -n "Setting environment variables..."
shouldclear=0
  # The Prompt Customizer
  precmd() {
    preexit=$?
    PS1='\ '`
      if [[ $preexit -ne 0 ]]; then
	echo -n "%{$fg[red]%}$preexit%{$reset_color%} \\ "
      fi
    `"%{$fg[magenta]%}%D %{$fg[blue]%}%* \\ %B%{$fg[cyan]%}%n%b%{$reset_color%}@%{$fg[green]%}%B%m%b %{$fg[red]%}%/%{$reset_color%}
 \\ "`
      if [[ $preexit -ne 0 ]]; then
        echo -n "%{$fg[red]%}"
      else
        echo -n "%{$fg[blue]%}"
      fi
      echo -n '%(!.Λ.λ)'"%{$reset_color%}"
     `' '
  }
if [[ $pathset -ne 1 ]]; then
	PATH=$PATH":$HOME/bin:$HOME/.cargo/bin"
	pathset=1
fi
# Text editor
  export EDITOR=/usr/bin/vim
  editor=/usr/bin/vim
  SUDO_EDITOR=/usr/bin/vim
cd ~
echo " Done."

# Aliases
echo -n "Creating aliases..."
  # ls stuff
  alias l=ls\ -FGTali

  # rm stuff
  alias del=rm\ -rv
  alias safedel=rm\ -rvi
  alias cld='rm -rv {.,}*'

echo " Done."

# Functions
echo -n "Defining functions..."
  # things you want to list the contents of a directory after doing
  c() {
    cd $1
    l
  }
  cl() {
    cd $1
    l
  }
  ldel() {
    rm -rv $1
    l
  }
  mcl() {
    mkdir -p $1
    cd $1
    l
  }

  # Clearing screen
  secureclear() {
    secureclear_counter=0
    until [ secureclear_counter -eq 15000 ]; do
      echo
    done
    unset secureclear_counter
  }
echo " Done."

if [ $shouldclear -eq 1 ]; then
  echo " Clearing screen in 2.5 seconds. Press Ctrl+C to abort clear."
  secureclear
else
  echo " Did not need to clear."
fi
unset shouldclear

# Startup commands
echo "> l"
l

echo "<<< All done! >>>"


