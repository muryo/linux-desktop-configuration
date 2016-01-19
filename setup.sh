#! /bin/bash
# This is a setup script to make all the symlinks and directories and
# install some necessary package.
DIR="$( cd "$(dirname "$0")" && pwd)"

mail_setup()
{
	ln -sv $DIR/mutt $HOME/.mutt
	ln -sv $DIR/muttrc $HOME/.muttrc
	ln -sv $DIR/getmail $HOME/.getmail
	ln -sv $DIR/procmailrc $HOME/.procmailrc
	ln -sv $DIR/msmtprc $HOME/.msmtprc

	mkdir -p $HOME/.mail
}

ln -sv $DIR/vimrc $HOME/.vimrc
ln -sv $DIR/bashrc $HOME/.bashrc

mail_setup
