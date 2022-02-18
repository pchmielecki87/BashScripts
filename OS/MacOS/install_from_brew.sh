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
azure-cli \
docker \
kubernetes-cli \
helm

# install fancy tools
brew install \
spotify \
--cask zoom \
--cask microsoft-teams \
--cask lastpass 