#!/bin/bash
set -e
cd ~
git clone \
  https://github.com/presci/debian-development.git
ln -s /root/debian-development/emacs-setup .emacs.d

EMACS_PATH=/root/.emacs.d/lib
cd ~/.emacs.d && mkdir lib && cd lib
git clone https://github.com/presci/haskell-mode.git
cd haskell-mode && make EMACS=/usr/bin/emacs

exec "$@"
