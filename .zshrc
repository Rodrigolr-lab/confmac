# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VIM_HOME=/:sr/local/Cellar/vim/8.2.2100/
export PATH=$PATH

source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias "n"="nvim"
alias "v"="vim"
alias "nz"="nvim ~/.zshrc"
alias "vz"="vim ~/.zshrc"
alias "tl"="tmux ls"
# alias "ta"="tmux attach"

function ta(){
	res=( $( tmux ls ))
	echo "$res"
	if [[ $# == 1 ]]; then
		tmux attach
	else
		select session in $res; do
			tmux attach -t $session
			break
		done
	fi
}

function tn(){
		
		tmux new -s $1 -n $2
	
}

function so(){
	source ~/.zshrc
	echo "sourcing new file"
}

function nt(){
	res=( $(ls | grep -E "^$1[a-zA-Z0-9_]*\.tex$") )
	if [[ ${#res} == 1 ]]; then
		echo "$res"
		nvim "$res"
	else
		PS3="File: "
		select file in $res; do
			nvim $file
			break
		done
	fi
}

function c(){
	res=( $(ls | grep -e "^$1[a-zA-Z0-9_]*\.c$") )
	if [[ ${#res} == 1 ]]; then
		cc $res -o "${res%c}out"
		./"${res%c}out"
	else
		select file in $res; do
			cc $file -o "${file%c}out"
			./"${file%c}out"
			break
		done
	fi
}

function vt(){
	res=( $(ls | grep -E "^$1[a-zA-Z0-9_]*\.tex$") )
	if [[ ${#res} == 1 ]]; then
		echo "$res"
		vim "$res"
	else
		PS3="File: "
		select file in $res; do
		    vim $file
			break
		done
	fi
}
