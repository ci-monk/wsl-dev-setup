#!/usr/bin/env bash

# ==============================================================================
## DESCRIPTION: Hashicorp functions
## AUTHOR: Lucca Pessoa da Silva Matos
## DATE: 12.09.2020
# ==============================================================================

# ==============================================================================
# FUNCTIONS
# ==============================================================================

function SetupHashiCorp(){
  Status "👾 Setup Hashicorp repository"
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update
}

function InstallTerraform(){
  if ! [ -x "$(command -v terraform)" ]; then
    Status "👾 Install terraform "
    sudo apt-get install terraform && terraform -install-autocomplete
  else
    Status "💀 Terraform  alredy installed - Version $(terraform -v)... skipping"
  fi
}

function InstallPacker(){
  if ! [ -x "$(command -v packer)" ]; then
    Status "👾 Install packer"
    sudo apt-get install packer
  else
    Status "💀 Packer alredy installed - Version $(packer -v)... skipping"
  fi
}

function InstallVault(){
  if ! [ -x "$(command -v vault)" ]; then
    Status "👾 Install vault"
    sudo apt-get install vault
  else
    Status "💀 Vault alredy installed - Version $(vault -v)... skipping"
  fi
}
