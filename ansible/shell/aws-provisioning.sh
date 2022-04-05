cd ../terraform
terraform fmt -check
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
