# Shell
alias serve='python -m SimpleHTTPServer'
alias ports='lsof -Pan -i tcp -i udp'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsal='ls -la'

# Backup
alias backup='cd ~; sh ~/backup.sh'

# Docker
#alias d='eval "$(docker-machine env dev)"; docker '
#alias dc='eval "$(docker-machine env dev)"; docker-compose '
#alias dm='docker-machine '

# Dinghy
alias d='eval "$(dinghy shellinit)"; docker '
alias dc='eval "$(dinghy shellinit)"; docker-compose '
alias dm='docker-machine '
