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

resource "null_resource" "perform_ebs_volumes" {


  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = tolist(aws_instance.jenkins_server[*].public_ip)[1]
    user = "ubuntu"
    private_key = file("mykey.pem")
  }  
 provisioner "remote-exec" {
    inline = [
      //"sudo chown -R jenkins:jenkins /var/lib/jenkins",
      "sudo systemctl stop nginx",
      "sudo lsblk",
      "sudo mkfs -t  ext4 /dev/xvdh",
      "sudo mount /dev/xvdh /usr/share/nginx/html",
      "sudo systemctl start nginx",
      "sudo lsblk"

    ]
  }

}
