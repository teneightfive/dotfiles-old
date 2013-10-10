if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

santanderMergePreview() {
    git co preview-master;
    git pull;
    git mm $1;
    git push;
    git co $1;
    git push;
}

santanderMergeGerrit() {
    git co $1;
    git pull;
    git co gerrit-master;
    git pull;
    git m $1 --squash;
    git c;
    git push gerrit HEAD:refs/for/master;
    git co $1;
}

santanderBranchLive() {
    git co live-master;
    git pull;
    git cob $1;
    git pushu preview $1;
}

# Aliases
alias la='ls -la'
alias g=git
alias gut=git
alias got=git
alias gti=git
alias vi=vim
alias svi='sudo vi'
alias mpreview=santanderMergePreview
alias mgerrit=santanderMergeGerrit
alias blive=santanderBranchLive