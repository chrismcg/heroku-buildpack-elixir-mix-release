# Outputs section heading
#
# Usage:
#
#     output_section "Application tasks"
#
function output_section() {
    local indentation="----->"
    echo "${indentation} $1"
}

function export_env_vars() {
    whitelist_regex=${2:-''}
    blacklist_regex=${3:-'^(PATH|GIT_DIR|CPATH|CPPATH|LD_PRELOAD|LIBRARY_PATH)$'}
    if [ -d "$env_path" ]; then
        output_section "Will export the following config vars:"
        for e in $(ls $env_path); do
            echo "$e" | grep -E "$whitelist_regex" | grep -vE "$blacklist_regex" &&
                export "$e=$(cat $env_path/$e)"
            :
        done
    else
        echo "no env path"
    fi
}
