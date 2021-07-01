
variable "ami_id" {
  type =map
  default = {
  rhel = "ami-0b28dfc7adc325ef4"
  linux = "ami-0800fc0fa715fdcfe"
  ubuntu = "ami-03d5c68bab01f3496"
  }
}

variable "instance_type" {
  type = list
  default = ["t2.micro","t2.medium","t2.small"]
}
variable "region" {

}
variable "profile" {

}
