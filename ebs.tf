resource "aws_ebs_volume" "docker_data" {
    
    availability_zone = tolist(aws_instance.jenkins_server[*].availability_zone)[1]
    size = 10
    tags = {
        Name="jenkins-dev-data"
    }

}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.docker_data.id
  instance_id = tolist(aws_instance.jenkins_server[*].id)[1]
}

