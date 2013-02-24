# ------------------------------------------------------------------#
#          FILE: mbriggs.zsh-theme                                  #
#            BY: Alexandre Courbot (gnurou@gmail.com                #
#      BASED ON: mbriggs by Matt Briggs (matt@mattbriggs.net)       #
# ------------------------------------------------------------------#

SCM_THEME_PROMPT_DIRTY=" ${bold_red}⚡${reset_color}"
SCM_THEME_PROMPT_AHEAD=" ${bold_red}!${reset_color}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${reset_color}"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""
GIT_SHA_PREFIX=" ${yellow}"
GIT_SHA_SUFFIX="${reset_color}"

function git_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$GIT_SHA_PREFIX$SHA$GIT_SHA_SUFFIX"
}

function prompt() {
    local return_status=""
    local user_host="${purple}\h${reset_color}"
    local current_path="\w"
    local git_branch="$(git_short_sha)${bold_yellow}$(scm_prompt_info)${normal}"
    local open='('
    local close=')'
    local prompt_char=' \$ '

    PS1="\n${user_host} ${open}${bold_green}${current_path}${reset_color}${git_branch}${close}${return_status}\n${bold_white}${prompt_char}${normal}"
}

PROMPT_COMMAND=prompt
