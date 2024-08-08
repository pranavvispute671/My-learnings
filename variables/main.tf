variable "vpcname"{
    type = string
    default = "vpc_name_string"  //String data type
}

variable "sshport" {
    type = number
    default = 22    //number data type
}

variable "enabled" {
    default = true     //boolean data type
}

variable "mylist" {
    type = list(string)
    default = [ "vpc_name_list_1", "vpc_name_list_2" ]   //List data type
}

variable "mymap" {
    type = map
    default = {
        Key1 = "vpc_name_map_1"     //Map data type
        Key2="vpc_name_list_2"
    }
}

variable "inputvar" {
    type = string
    description = "Enter the name of VPC"      //user input string
}

provider "aws" {
    region="ap-south-1"  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags={
        Name = var.inputvar
    }
}

output "myoutput"{
    value=aws_vpc.myvpc.id
}

variable "my_tuple" {
    type = tuple([string, number, bool])
    default = ["Working?", 0, false]
}

variable "obj_name" {
    type = object({
        name    = string,
        port    = number,
        enabled = bool
    })
    default = {
        name    = "my-object",
        port    = 52,
        enabled = true
    }
}
