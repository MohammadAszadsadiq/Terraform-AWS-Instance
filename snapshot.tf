resource "aws_ebs_snapshot" "jenkins_snapshot" {
  volume_id = aws_ebs_volume.docker_data.id

  tags = {
    Name = "jenkins_data"
  }
  depends_on = [aws_ebs_volume.docker_data, aws_volume_attachment.ebs_att]
}



resource "aws_ebs_snapshot_copy" "jenkins_snap" {
    source_snapshot_id = aws_ebs_snapshot.jenkins_snapshot.id
    source_region = var.region
    tags= {
        Name = "jenkins_snap"
    }
  depends_on = [ aws_ebs_volume.docker_data, aws_volume_attachment.ebs_att,aws_ebs_snapshot.jenkins_snapshot]
}
