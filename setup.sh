#! /bin/bash
# This is a setup script to make all the symlinks and directories and
# install some necessary package.
DIR="$( cd "$(dirname "$0")" && pwd)"

mail_setup()
{
	ln -sf $DIR/mutt $HOME/.mutt
	ln -sf $DIR/muttrc $HOME/.muttrc
	ln -sf $DIR/getmail $HOME/.getmail
	ln -sf $DIR/procmailrc $HOME/.procmailrc
	ln -sf $DIR/msmtprc $HOME/.msmtprc

	mkdir -p $HOME/.mail
}

ln -sf $DIR/vimrc $HOME/.vimrc
ln -sf $DIR/bashrc $HOME/.bashrc

mail_setup
