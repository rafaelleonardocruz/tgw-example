#!/bin/bash

set -xe

#tf_init() {
#  cd resources/$1
#  terraform init -input false
#  cd ../../
#}
#
#tf_init 1-network-baseline
#tf_init 2-tgw-baseline
#
#tf_plan() {
#  cd resources/$1
#  terraform plan -out terraform.tfplan -input false
#  cd ../../
#}
#
#tf_plan "1-network-baseline"
#tf_plan "2-tgw-baseline"
#
#tf_apply() {
#  cd resources/$1
#  terraform apply terraform.tfplan
#  cd ../../
#}
#
#tf_apply "1-network-baseline"
#tf_apply "2-tgw-baseline"

cd resources/1-network-baseline
terraform init -input false
cd ../../

cd resources/2-tgw-baseline
terraform init -input false
cd ../../


cd resources/1-network-baseline
terraform plan -out terraform.tfplan -input false
cd ../../

cd resources/2-tgw-baseline
terraform plan -out terraform.tfplan -input false
cd ../../

#tf_apply() {
#  cd resources/$1
#  terraform apply terraform.tfplan
#  cd ../../
#}
#
#tf_apply "1-network-baseline"
#tf_apply "2-tgw-baseline"
#