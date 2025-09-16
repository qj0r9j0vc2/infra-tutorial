# infra-tutorial

```bash
export AWS_PROFILE=your-profile
terraform init
terraform plan -var="key_name=your-key"
terraform apply -auto-approve -var="key_name=your-key"
# clear
terraform destroy -auto-approve -var="key_name=your-key"


terraform plan   -var-file=dev.tfvars
terraform apply  -var-file=prod.tfvars 
```
