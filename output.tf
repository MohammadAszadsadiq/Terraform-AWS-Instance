/*
output "az_zone" {
    value = "${aws_instance.jenkins_server[*].availability_zone}"
}
*/
/*
output "az_zone" {
    value = tolist(aws_instance.jenkins_server[*].availability_zone)[1]
}
*/

/*
output "az_data" {
    value = "${data.aws_instance.get-az-name.availability_zone}"
}
*/
output "instance_id" {
    value = [for instance_id in aws_instance.jenkins_server.*.id : instance_id if instance_id == "i-05b3bc646656cd347" ]
}

/*
output "instance_Ip" {
    value="${data.aws_instance.get-az-name.public_ip}"
  
}
*/
/*
output "instance_Ip" {
    value= [for instance_id in aws_instance.jenkins_server.*.public_ip : instance_id if instance_id == "i-05b3bc646656cd347" ]
  
}
*/
