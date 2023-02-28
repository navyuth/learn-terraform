variable "test" {
  default = {
    "catalogue" = {
      private_ip = "172.31.15.55"
    }
     "user"      = {
       private_ip = "172.31.2.59"
     }
  }
}

output "test" {
  value = var.test["catalogue"].private_ip
}