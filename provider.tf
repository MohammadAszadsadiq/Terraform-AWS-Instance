# Please provide the cloud name
provider "aws" {
  //shared_config_files      = ["/home/ubuntu/.aws/conf"]
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
  profile                  = "dev"
  region = "${var.region}"
 
}