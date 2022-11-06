resource "aws_instance" "basic" {
  ami = var.ami
  #ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  tags = {
    Name = "basic_test"
  }
}

resource "aws_instance" "for-each-var-block" {
  for_each = {
    for x, y in var.ec2-values : x => y
  }
  ami           = each.value.ami_test
  instance_type = each.value.instance_type_test

  tags = {
    Name = "for_each_var_test"
  }
}

resource "aws_instance" "count-test" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "count_test-${count.index}"
  }
}

resource "aws_instance" "for-each-test" {
  for_each          = toset(["us-east-1a", "us-east-1b"])
  availability_zone = each.key
  ami               = var.ami
  instance_type     = var.instance_type

  tags = {
    Name = "for_each_test-${each.value}"
  }
}
