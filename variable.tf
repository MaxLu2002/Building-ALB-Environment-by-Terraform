# ---------- 參數調整
# region: ap-northeast-1
    # x86ID = "ami-0bf4c288973b2f12b"
    # armID = "ami-0b86b628eb7332756"

# region: ap-northeast-2 | linux2
    # x86ID = "ami-0ee82191e264e07cc"
    # armID = "ami-0fe2320d6217ae1eb"

# ---------- 定義 AWS 提供者
provider "aws" {
  region  = var.region
  profile = "account1"
}

variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "tags" {
  type = map(string)
  default = {
    name = "test"
  }
}

variable "EC2_AMI" {
  type = map(string)
  default = {
    x86ID = "ami-0e18fe6ecdad223e5"
    armID = "ami-011fb2b8814373313"
  }
}

variable "EC2_size" {
  type = map(string)
  default = {
    t3micro  = "t3.micro"
    t4gmicro = "t4g.micro"
  }
}
