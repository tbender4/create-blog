#!/bin/bash
shopt -s expand_aliases		#I have vim=nvim in my bash_profile
source ~/.bash_profile		

bold=$(tput bold)		#Allows bold output
normal=$(tput sgr0)

if [ -z "$EDITOR" ]		#Handles default editor problems
then
	if [ ! -z $(which vim) ]	#if vim exists
	then
		defaultEditor=vim
	else
		defaultEditor=vi
	fi
	warning="${bold}WARNING: ${normal}Default text editor has not been set.\nDefaulting to ${bold}$defaultEditor${normal}. Continue? (Y/n): "
	read -p "`echo -e $warning`" confirm	#echo -e allows escaping in warning message
	case "$confirm" in
		"") export EDITOR="$defaultEditor";;
		[yY] | [yY][Ee][Ss]) export EDITOR="$defaultEditor";;
		*) echo 'Set editor with: export EDITOR='editor'' && exit 1;;
	esac

fi


read -e -p "Title: " title
if [ -z "$title" ]
then
	echo "No title entered"
	exit 1
fi

#Goals: 1. Convert to lowercase. 2. replace spaces to dashes

titleNoSpaces="${title// /-}"
titleConversion=$(echo $titleNoSpaces | tr '[:upper:]' '[:lower:]')
echo $titleConversion

#titleConversion="${titleNoSpaces,,}"
#the Macs at Queens College are outdated and have Bash 3.2. Using tr instead

today=`date '+%Y-%m-%d'`
filename="$today"-"$titleConversion"
mkdir ../assets/images/$filename

if [ -e "$filename.md" ]
then
	echo -e "This post already exists.\nEdit post with: $EDITOR $filename.md"
	exit 1
fi


cat <<EOF > $filename.md
---
layout: post
title: "$title"
categories: []
tags: []
fullview: true
comments: true

---

post goes here
[comment]: <> (![image]({{ "assets/images/$filename/imagename.png" | absolute_url }}) )

EOF

$EDITOR "$filename.md"



#Sources:
#https://askubuntu.com/questions/615178/getting-the-default-text-editor-used-in-system
#https://stackoverflow.com/questions/18544359/how-to-read-user-input-into-a-variable-in-bash
#http://tldp.org/LDP/abs/html/comparison-ops.html
#https://stackoverflow.com/questions/1706431/the-easiest-way-to-replace-white-spaces-with-underscores-in-bash
#https://stackoverflow.com/questions/11159043/bash-tr-command
#https://unix.stackexchange.com/questions/151068/how-to-handle-backspace-while-reading
#https://stackoverflow.com/questions/2924697/how-does-one-output-bold-text-in-bash
#https://stackoverflow.com/questions/81520/how-to-suppress-terminated-message-after-killing-in-bash/81672
#https://stackoverflow.com/questions/4296108/how-do-i-add-a-line-break-for-read-command/4296147#4296147
