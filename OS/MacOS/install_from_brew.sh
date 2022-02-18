# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew update
brew update

# brew add repos
brew tap homebrew/cask-versions
brew tap isen-ng/dotnet-sdk-versions

# install dev-tools
brew install \
git \
--cask visual-studio-code \
--cask visual-studio \
--cask powershell \
dotnet \
--cask dotnet-sdk6-0-100
azure-cli \
docker \
kubernetes-cli \
helm

## oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fancy tools
brew install \
spotify \
--cask zoom \
--cask microsoft-teams \
--cask lastpass 