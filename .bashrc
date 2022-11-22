#Jesús Daniel Díaz Barriga Cruz
# ~/.bashrc
#
pfetch
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Stuff from somewhere
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#my alias
alias r=/run/media/daniel/SD/scripts/r.sh
alias u='sudo dnf update -y && flatpak update -y'
alias o=/run/media/daniel/SD/scripts/ondemand.sh
alias p=/run/media/daniel/SD/scripts/powersave.sh
alias a12=/run/media/daniel/SD/scripts/android12.sh
alias g=gnome-text-editor
alias rt=/run/media/daniel/SD/scripts/rotate.sh
alias myip="curl http://ipecho.net/plain; echo"
alias recomp='make clean && make'
alias keys='echo "*Shell key bindings and shortcuts*

Ctrl + L --> Erase everything
Ctrl + A --> Back to beginning of line
Ctrl + E --> End of line
Alt + B  --> Go back by word
Alt + F  --> Go forward by word
Ctrl + U --> Erase everything before cursor
Ctrl + K --> Erase everything after cursor
Ctrl + W --> Erase word before cursor
Alt + D  --> Erase word after cursor
Ctrl + Y --> Undo
Alt + .  --> Last argument
Ctrl + P --> Previous command
Ctrl + N --> Next command
Ctrl + D --> Exit shell
 !!      --> Last command
!!:s/old/new/ --> Substitution of something in the last command
!-(1,2,3...)  --> Commands ago
    !*   --> Argument of last command
 !-x*    --> Argument of commands ago" '
alias governor='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias tablet='sudo systemctl stop iio-sensor-proxy'

#Archive extraction
#From DT (Distro Tube)
#ex <file>
ex ()
{
	if [ -f "$1" ] ; then
	  case $1 in
		*.tar.bz2)	tar xjf $1		;;
		*.tar.gz)	tar xzf $1		;;
		*.bz2)		bunzip $1		;;
		*.rar)		unrar x $1		;;
		*.gz)		gunzip $1		;;
		*.tar)		tar xf $1		;;
		*.tbz2)		tar xjf $1		;;
		*.tgz)		tar xzf $1		;;
		*.zip)		unzip $1		;;
		*.Z)		uncompress $1	;;
		*.7z)		7z x $1			;;
		*.deb)		ar x $1			;;
		*.tar.xz)	tar xf $1		;;
		*.tar.zst)	unzstd $1		;;
		*)			echo "'$1' cannot be extracted via ex()" ;;
	  esac
	else
		echo "'$1' is not a valid file"
	fi }
	


#Display ISO version and distribution information in short
alias version="sed -n 1p /etc/os-release && sed -n 11p /etc/os-release && sed -n 12p /etc/os-release"

#DNF Shortcuts
alias install="sudo dnf install"
alias finstall="flatpak install"
alias update="sudo dnf update -y && flatpak update -y"
alias update-distro="sudo dnf system-upgrade"
alias search="dnf search"
alias clean="sudo dnf clean all"
alias remove="sudo dnf remove"
alias autoremove="sudo dnf autoremove && flatpak uninstall --unused"
#alias bye="sudo /usr/local/sbin/bye.sh"
alias bye="sudo dnf update -y && shutdown"
#alias stopiio="sudo /usr/local/sbin/iio.sh"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# https://bbs.archlinux.org/viewtopic.php?pid=1068202#p1068202
#number with m like 35m are the colors to change from
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
	PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;35m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
