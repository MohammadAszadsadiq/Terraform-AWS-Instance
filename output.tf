output "az_zone" {
    value = tolist(aws_instance.jenkins_server[*].availability_zone)[1]
}
output "instance_id" {
    value = tolist(aws_instance.jenkins_server[*].id)[1]
}
output "instance_Ip" {
   value = tolist(aws_instance.jenkins_server[*].public_ip)[1]
  
}
output "snap_id" {
    value = aws_ebs_snapshot.jenkins_snapshot.id.0
}
