#ls aliases
alias ls='ls --group-directories-first --color=auto'
alias la='ls -la'
alias lf='ls -p | grep -v /'	# lists everything excluding diretories.  i.e files, links, ...
alias lh='ls -lh'
alias ll='ls -l'
alias l.='ls -a'
alias lr='ls -ltR'
alias lt='ls -ltr'
alias ldir='ls -ld */'		# List only directories.
alias hdir='ls -lad .*/'	# List only hidden directories.
#Logs and related
alias log='clear;sudo tail -f /var/log/syslog'
alias qlog='clear;sudo tail -f /var/log/named/named-query.log'
alias klog='clear;tail -f ${HOME}/.kodi/temp/kodi.log'
alias bstats='sudo less /var/cache/bind/named.stats'
alias dmesg='dmesg --color=auto'
#Kills, terminates, restarts.
alias kall='pkill -9 -u bjohnston&'
alias pconk='pkill -1 conky'
alias pbp='pkill -1 pianobear'
alias pevo='pkill -QUIT evolution'
#Commands.
alias pubip4='dig +short myip.opendns.com @resolver1.opendns.com'
alias pubip6='dig TXT +short o-o.myaddr.1.google.com @ns1.google.com'
alias luv="echo -n '+' > /home/bjohnston/.config/pianobar/pianobar-pipe"
alias inc="echo -n 'n' > /home/bjohnston/.config/pianobar/pianobar-pipe"
alias stp="echo -n 'q' > /home/bjohnston/.config/pianobar/pianobar-pipe"
#Find dupes first by filename then by md5sum : ORIGINAL.  
#alias dupes='find -not -empty -type f -printf "%s" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate'
#alias adback='adb backup -f SM_G530T-`date +'%m-%d-%y.%H:%M:%S'`.ab -apk -obb -all -system'
alias dupes='find . ! -empty -type f -printf "%s" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate'
alias list='sudo apt list --installed'
alias backup='mv $1 $1-.`date +'%m-%d-%y.%H:%M:%S'`'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias lo='exit'
alias h='history'
