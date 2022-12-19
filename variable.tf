variable "region" {
  default = "ap-south-1"
}
variable "zone1" {
  default = "ap-south-1a"
}
variable "zone2" {
  default = "ap-south-1b"
}
variable "zone3" {
  default = "ap-south-1c"
}
variable "ami" {
  type = map(any)
  default = {
    ap-south-1 = "ami-0a2457eba250ca23d"
    us-east-1  = "ami-02b972fec07f1e659"
  }
}
variable "user" {
  default = "ec2-user"
}
variable "pub_key" {
  default = "dovekey.pub"
}
variable "priv_key" {
  default = "dovekey"
}
variable "my_ip" {
  default = "0.0.0.0/0"
}