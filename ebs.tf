# EBS volume creation
/*
resource "aws_ebs_volume" "docker_data" {
    
    availability_zone = "${data.aws_ec2_instance.get-az-name.availability_zone}"
    size = 10
    tags = {
        Name="jenkins-dev-data"
    }

depends_on = [ data.aws_instance.get-az-name]
}


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



resource "aws_ebs_snapshot" "jenkins_snapshot" {
  volume_id = aws_ebs_volume.docker_data.id

  tags = {
    Name = "jenkins_data"
  }
  depends_on = [aws_ebs_volume.docker_data, aws_volume_attachment.ebs_att]
}


resource "aws_ebs_snapshot_copy" "jenkins_snap" {
    source_snapshot_id = aws_ebs_snapshot.jenkins_snapshot.id
    source_region = "ap-south-1"
    tags= {
        Name = "jenkins_snap"
    }
  depends_on = [ aws_ebs_volume.docker_data, aws_volume_attachment.ebs_att,aws_ebs_snapshot.jenkins_snapshot]
}

*/
