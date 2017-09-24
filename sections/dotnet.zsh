# DOTNET
SPACESHIP_DOTNET_SHOW="${SPACESHIP_DOTNET_SHOW:=true}"
SPACESHIP_DOTNET_PREFIX="${SPACESHIP_DOTNET_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DOTNET_SUFFIX="${SPACESHIP_DOTNET_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOTNET_SYMBOL="${SPACESHIP_DOTNET_SYMBOL:=".NET "}"
SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR:="128"}"

# DOTNET
# Show current version of .NET SDK
spaceship_dotnet() {
  [[ $SPACESHIP_DOTNET_SHOW == false ]] && return

  # Show DOTNET status only for folders containing project.json, global.json, .csproj, .xproj or .sln files
  [[ -f project.json || -f global.json || -n *.csproj(#qN^/) || -n *.xproj(#qN^/) || -n *.sln(#qN^/) ]] || return

  _exists dotnet || return

  # dotnet-cli automatically handles SDK pinning (specified in a global.json file)
  # therefore, this already returns the expected version for the current directory
  local dotnet_version=$(dotnet --version 2>/dev/null)

  _prompt_section \
    "$SPACESHIP_DOTNET_COLOR" \
    "$SPACESHIP_DOTNET_PREFIX" \
    "${SPACESHIP_DOTNET_SYMBOL}${dotnet_version}" \
    "$SPACESHIP_DOTNET_SUFFIX"
}