# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

all: clean install install-deps update solc build

# Install proper solc version.
solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_0_8_9

# Clean the repo 
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

# Install the Modules
install :; forge install # dapphub/ds-test && forge install rari-capital/solmate && forge install brockelmore/forge-std && forge install ZeframLou/clones-with-immutable-args

# Install the Dependencies
install-deps :; yarn install

# Update Dependencies
update:; forge update

# Builds
build  :; forge clean && forge build --optimize --optimize-runs 1000000

# chmod scripts
scripts :; chmod +x ./scripts/*

# Tests
test   :; forge clean && forge test --optimize --optimize-runs 1000000 -v # --ffi # enable if you need the `ffi` cheat code on HEVM

# Tests with Gas Report
test-gasreport 	:; forge test --gas-report

# Lints
lint :; prettier --write contracts/**/*.sol && prettier --write contracts/*.sol

# Generate Gas Snapshots
snapshot :; forge clean && forge snapshot --optimize --optimize-runs 1000000

# Fork Mainnet With Hardhat
mainnet-fork :; npx hardhat node --fork ${ETH_MAINNET_RPC_URL}

# Rename all instances of femplate with the new repo name
rename :; chmod +x ./scripts/* && ./scripts/rename.sh