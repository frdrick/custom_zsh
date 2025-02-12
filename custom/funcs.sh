#!/bin/zsh
# 'l' by default with my setup does the same as this
# lse () {
#     ls -aGclh
# }
# list recent downloads
ld() {
    if [ $1 ]; then
        echo "$1 Recent Downloads"
        ls -th ~/Downloads/ | head -n "$1"
    else 
        echo "Recent Downloads"
        ls -th ~/Downloads/ | head
    fi
}
# Store the saved directory path, note we don't use spaces around the = when shell scripting.
MARCO=~/.marco_polo_path

# save current directory to MARCO
marco() {
    pwd > "$MARCO"
    echo "Saved current directory: $(pwd)"
}

# go to saved directory
polo() {
    if [ -f "$MARCO" ]; then
        # <"$MARCO_FILE" is shorthand for reading the contents of $MARCO. This is known as a command substitution.
        target_dir=$(<"$MARCO")
        if [ -d "$target_dir" ]; then
            cd "$target_dir" || echo "Failed to navigate to $target_dir"
        else
            echo "Saved directory no longer exists: $target_dir"
        fi
    else
        echo "No directory saved. Use 'marco' to save one first."
    fi
}

# test file
# retry() {
#     runs_before_fail=0
#     exit_code=0
#     while [[ $exit_code ]]; do
#         ((runs_before_fail += 1 ))
#         source $1
#         ((exit_code = $?))
#     done
#     echo "Failed after $runs_before_fail successful runs"
# }
