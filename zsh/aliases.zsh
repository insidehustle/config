#!/bin/zsh
encode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64
    else
        printf '%s' $1 | base64
    fi
}

decode64() {
    if [[ $# -eq 0 ]]; then
        cat | base64 --decode
    else
        printf '%s' $1 | base64 --decode
    fi
}
alias e64=encode64
alias d64=decode64
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform


# BEGIN SNIPPET: Magento Cloud CLI configuration
# HOME=${HOME:-'/Users/luke.caradine'}
# export PATH="$HOME/"'.magento-cloud/bin':"$PATH"
# if [ -f "$HOME/"'.magento-cloud/shell-config.rc' ]; then . "$HOME/"'.magento-cloud/shell-config.rc'; fi # END SNIPPET

# # BEGIN SNIPPET: Platform.sh CLI configuration
# HOME=${HOME:-'/Users/luke.caradine'}
# export PATH="$HOME/"'.platformsh/bin':"$PATH"
# if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

generatecsr() {
# Common Name: The FQDN (fully-qualified domain name) you want to secure with the certificate such as www.google.com, secure.website.org, *.domain.net, etc.
# Organization: The full legal name of your organization including the corporate identifier.
# Organization Unit (OU): Your department such as ‘Information Technology’ or ‘Website Security.’
# City or Locality: The locality or city where your organization is legally incorporated. Do not abbreviate.
# State or Province: The state or province where your organization is legally incorporated. Do not abbreviate.
# Country: The official two-letter country code (i.e. US, CH) where your organization is legally incorporated.
   openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr
}
alias gencsr=generatecsr
#. $(pack completion --shell zsh)
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias b="prettybat"
alias rgf="rg --files | fzf"
alias lukecdev="ssh-add -d ~/.ssh/id_rsa_git;ssh-add --apple-use-keychain ~/.ssh/lukecdev && \
git config --global user.email 'luke.c.dev@gmail.com'"
alias workgit="ssh-add -d ~/.ssh/lukecdev;ssh-add --apple-use-keychain ~/.ssh/id_rsa_git && \
git config --global user.email 'luke.caradine@pon.com'"
alias upgrade="brew upgrade && npm update -g && gcloud components update"
alias nv="nvim ."
alias lv="lvim ."
# alias datagrip=~/.jetbrainscmds/datagrip
alias e="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=2"
alias e1="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=1"
alias e2="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=2"
alias e3="exa -lTx --git-ignore --icons --git --time=modified --time-style=default -h --octal-permissions -L=3"
alias ea="exa -lTx --icons --git --time=modified --time-style=default -h --octal-permissions"
