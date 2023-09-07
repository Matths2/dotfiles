#!/bin/zsh
# shellcheck disable=SC2207

# Doesn't let you press Ctrl-C
function ctrl_c() {
	echo -e "\renter nil to drop to exit"
}

trap ctrl_c SIGINT

no_of_terminals=$(/opt/homebrew/bin/tmux list-sessions | wc -l)
IFS=$'\n'
output=($(/opt/homebrew/bin/tmux list-sessions))
output_names=($(/opt/homebrew/bin/tmux list-sessions -F\#S))
k=1
echo "Choose the terminal to attach: "
for i in "${output[@]}"; do
	echo "$k - $i"
	((k++))
done
echo
echo "Create a new session by entering a name for it"
read -r input
if [[ $input == "" ]]; then
	/opt/homebrew/bin/tmux new-session
elif [[ $input == 'nil' ]]; then
	exit 1
elif [[ $input =~ ^[0-9]+$ ]] && [[ $input -le $no_of_terminals ]]; then
    terminal_name="${output_names[input]}"
	/opt/homebrew/bin/tmux attach -t "$terminal_name"
else
	/opt/homebrew/bin/tmux new-session -s "$input"
fi
ext 0
