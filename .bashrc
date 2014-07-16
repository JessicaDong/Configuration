#
# Define default prompt to <username>@<hostname>:<path><"($|#) ">
# and print '#' for user "root" and '$' for normal users.
#

typeset +x PS1="\u@\h:\w\\$ "

if [ -f /etc/bash/bash_completion ]; then
    . /etc/bash/bash_completion
fi


if [ -f /gl/Mark/Mark.ksh ]; then
    . /gl/Mark/Mark.ksh
fi

if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi
