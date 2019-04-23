data "aws_ami" "centos" {
  most_recent = true
  owners      = ["aws-marketplace"]
  filter {
    name   = "name"
    values = ["centos-7"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "template_file" "user_data" {
  template = "${file("user-data.sh")}"
  vars {
    domain = "${var.domain}"
    ip     = "${aws_eip.ipa.public_ip}"
    name   = "${var.name}"
  }
}
resource "aws_instance" "ipa" {
  ami                         = "${data.aws_ami.centos.image_id}"
  associate_public_ip_address = true
  instance_type               = "${var.instance_type}"
  key_name                    = "${aws_key_pair.ssh_key.key_name}"
  security_groups             = ["${aws_security_group.ipa.name}"]
  user_data                   = "${data.template_file.user_data.rendered}"
  root_block_device           = {
    volume_type = "gp2"
    volume_size = "${var.volume_size}"
  }
  tags {
    Name = "${var.name}"
  }
}
resource "aws_eip" "ipa" {
  instance = "${aws_instance.ipa.id}"
  vpc      = true
  tags {
    Name = "${var.name}"
  }
}
