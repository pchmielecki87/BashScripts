# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew update
brew update

# brew update casks
brew tap homebrew/cask-versions

# install dev-tools
brew install \
git \
--cask visual-studio-code \
--cask visual-studio \
--cask powershell \
dotnet \
--cask dotnet-sdk \
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