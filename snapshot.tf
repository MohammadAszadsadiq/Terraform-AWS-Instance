resource "aws_ebs_snapshot" "jenkins_snapshot" {
  volume_id = aws_ebs_volume.docker_data.id

  tags = {
    Name = "jenkins_data"
  }
  depends_on = [aws_ebs_volume.docker_data, aws_volume_attachment.ebs_att]
}
