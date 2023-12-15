# DATA FOR AZ

data "aws_instance" "get-az-name" {
    filter {
        name = "tag:Name"
        values=["jenkins-server-2"]
    }
}