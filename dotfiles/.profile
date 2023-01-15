is_wsl() {
    grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null
}

if is_wsl; then
    export BROWSER="powershell.exe /C start"
fi

EDITOR="vim"

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# asdf
source "$(brew --prefix asdf)/libexec/asdf.sh"

# personal bins
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/bin:$PATH"

# .bashrc if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
