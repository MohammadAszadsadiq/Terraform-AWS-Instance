# Resource creation for jenkins installation
resource "aws_instance" "jenkins_server" { 
    ami = "ami-06aa3f7caf3a30282"
    instance_type = "${var.instance_size}"
    key_name = "sbfsajbj"
    count = 3
    tags = {
      //Name="jenkins_machine-${count.index + 1}"
       Name = "jenkins_machine"
    }
    user_data=file("install.sh")
}
