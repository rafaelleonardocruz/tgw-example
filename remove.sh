#!/bin/bash

set -xe

tf_plan() {
  cd resources/$1
  terraform plan -out terraform.tfplan -destroy
  cd ../../
}

tf_plan "1-network-baseline"
tf_plan "2-tgw-baseline"

tf_apply() {
  cd resources/$1
  terraform apply terraform.tfplan
  cd ../../
}

tf_apply "1-network-baseline"
tf_apply "2-tgw-baseline"