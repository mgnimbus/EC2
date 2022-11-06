variable "ami" {
  default = "ami-09d3b3274b6c5d4aa"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2-values" {
  description = "inputs for ec2 instance"

  type = map(object({
    ami_test           = string
    instance_type_test = string
  }))

}
