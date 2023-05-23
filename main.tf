resource "aws_instance" "prometheus" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  #key_name               = "your_key_pair_name"
  #subnet_id              = data.aws_subnet.default.id
  vpc_security_group_ids = ["${aws_security_group.prom_sg.id}"]
  

  tags = {
    Name = "prometheus"
  }

    user_data = "${data.template_file.promscript.rendered}"
}
