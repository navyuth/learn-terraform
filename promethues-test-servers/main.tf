resource "aws_spot_instance_request" "node1" {
  ami = "ami-01f00f562868293a1"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
  wait_for_fulfillment = true

  tags = {
    Name = "prom-test-server"
  }
}

resource "aws_ec2_tag" "node1" {
  key         = "Name"
  resource_id = aws_spot_instance_request.node1.spot_instance_id
  value       = "prom-test-server"
}

resource "aws_spot_instance_request" "node2" {
  ami = "ami-01f00f562868293a1"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0141873d0ab9c8b98"]
  wait_for_fulfillment = true

  tags = {
    Name = "prom-test-node"
  }
}

resource "aws_ec2_tag" "node2" {
  key         = "Name"
  resource_id = aws_spot_instance_request.node2.spot_instance_id
  value       = "prom-test-node"
}