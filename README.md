# terrafrom-create-s3
########>>>>deploy an static site on aws s3 using terraform<<<<<###############

1 first you clone this repo
 
 git clone https://github.com/muhammada1y/s3-through-terraform.git

2 second check if you have terraform cli install 
 
$ sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

  Install the HashiCorp GPG key.
$ wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

  Verify the key's fingerprint. 
$ gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint

  Add the official HashiCorp repository to your system. The lsb_release -cs command finds the distribution release codename for your current system, such as buster, groovy, or sid.
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/hashicorp.list

 Download the package information from HashiCorp.
$ sudo apt update 

 Install Terraform from the new repository.
$ sudo apt-get install terraform

3 now your current dir is ( s3-through-terraform ) which is clone from github
  run these commands

* Initialize the Terraform configuration and download the necessary provider plugins. 
  $ terrafrom init
 >output:
  -HP-EliteBook:~/Downloads/tarraform/s3$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v5.1.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

* Validate the Terraform configuration for syntax and other errors. Run the following command  
  $ terrafrom validate
  > output: 
    HP-EliteBook:~/Downloads/tarraform/s3$ terraform validate
    Success! The configuration is valid.

* Generate an execution plan that shows the changes Terraform will make to the infrastructure. Run the following command  
  $ terrafrom plan:
  >output:
  -HP-EliteBook:~/Downloads/tarraform/s3$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.my_bucket will be created
  + resource "aws_s3_bucket" "my_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "muhammad.ali.bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = .......................

* Apply the changes defined in the Terraform configuration to create, update, or delete resources. Run the following command:  
  $ terrafrom apply
  >output: 
  # aws_s3_object.index will be created
  + resource "aws_s3_object" "index" {
      + bucket                 = (known after apply)
      + bucket_key_enabled     = (known after apply)
      + content_type           = "text/html"
      + etag                   = (known after apply)
      + force_destroy          = false
      + id                     = (known after apply)
      + key                    = "index.html"
      + kms_key_id             = (known after apply)
      + server_side_encryption = (known after apply)
      + source                 = "./index.html"
      + storage_class          = (known after apply)
      + tags_all               = (known after apply)
      + version_id             = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_s3_bucket.my_bucket: Creating...
aws_s3_bucket.my_bucket: Creation complete after 6s [id=muhammad.ali.bucket]
aws_s3_object.index: Creating...
aws_s3_object.index: Creation complete after 0s [id=index.html]

* terrafrom destroy is use to delete  resource 
$ terraform destroy
>output:
aws_s3_object.index will be destroyed
  - resource "aws_s3_object" "index" {
      - bucket                 = "muhammad.ali.bucket" -> null
      - bucket_key_enabled     = false -> null
      - content_type           = "text/html" -> null
      - etag                   = "36e099f9d4b0da1985b7c96eede8e864" -> null
      - force_destroy          = false -> null
      - id                     = "index.html" -> null
      - key                    = "index.html" -> null
      - metadata               = {} -> null
      - server_side_encryption = "AES256" -> null
      - source                 = "./index.html" -> null
      - storage_class          = "STANDARD" -> null
      - tags                   = {} -> null
