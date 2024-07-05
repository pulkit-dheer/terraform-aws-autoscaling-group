resource "aws_launch_template" "lt" {
  name_prefix   = "launch"
  image_id      = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "bar" {
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}