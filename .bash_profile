# .bash_profile

alias dev='cd ~/Documents/dev/'
alias twiss='node ~/Documents/dev/018-twitch-status/mylist.js'
alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias todo='cat ~/Documents/goals-of-the-week/README.md'
alias resume='screen -R'
alias tree='tree -I "node_modules"'

take(){ mkdir "$1" && cd "$1" ;}
twitch() { livestreamer -v --player /Applications/mpv.app/Contents/MacOS/mpv twitch.tv/"$1" "$2" --twitch-oauth-token= ;}
twee(){ node ~/Documents/dev/020-latest-tweets/small.js "$1" ;}
gaf() { node ~/Documents/dev/022-belong/gaf.short.js ;}
gafo() { node ~/Documents/dev/022-belong/gafo.short.js ;}
killscreens () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

-(){ cd - ;}
function ht { history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head ;}


# Include Z, yo
# . ~/.z.sh


PS1="\[\e[37;44m\] \[\e[m\]\[\e[37;44m\]\w\[\e[m\]\[\e[37;44m\] \[\e[m\] "


# ADD A RANDOM EMOJI TO THE CML
emojis=(🐶 🦁 🐱 🐭 🐹 🐰 🐸 🐯 🐨 🐻 🐷 🐮 🐵 🐼 🐙)
emoji='`echo ${emojis[$RANDOM % 15]}`'
PS1+="$emoji  \[\e[0m\]"


#PS1+="\033[32m\]\$(parse_git_branch) \[\033[00m\]"
export PS1


welcome() {
    #echo -ne; date +"%l:%M %p %A";
    [ $[ $RANDOM % 25 ] == 0 ] && fortune | cowsay && echo "";
    #[ $[ $RANDOM % 25 ] == 0 ] && gaf ;
    #[ $[ $RANDOM % 25 ] == 0 ] && gafo ;
}
welcome;


#OH-MY-GIT config
#source /Users/christophe/.oh-my-git/prompt.sh
omg_is_a_git_repo_symbol='🐸'
omg_has_untracked_files_symbol='💧'
omg_has_adds_symbol='➕'
omg_has_deletions_symbol='➖'
omg_has_cached_deletions_symbol='❌'
omg_has_modifications_symbol='✏️'
omg_has_cached_modifications_symbol='📝'
omg_ready_to_commit_symbol='➡️'
omg_is_on_a_tag_symbol='🏷'
omg_needs_to_merge_symbol='ᄉ'
omg_detached_symbol='💔'
omg_can_fast_forward_symbol='⏩'
omg_has_diverged_symbol=''
omg_not_tracked_branch_symbol='🖥'
omg_rebase_tracking_branch_symbol='🔧'
omg_merge_tracking_branch_symbol='🌱 '
omg_should_push_symbol='⏫'
omg_has_stashes_symbol='🌟'
