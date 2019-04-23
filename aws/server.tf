data "template_file" "user_data" {
  template = "${file("user-data.sh")}"
  vars {
    domain = "${var.domain}"
    name   = "${var.name}"
  }
}
resource "aws_instance" "ipa" {
  ami                         = "${var.ami}"
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
