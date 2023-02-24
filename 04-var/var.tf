variable "sample" {
  default = "Hello World"
}

output "sample" {
  value = var.sample
}

variable "sample1" {}

output "sample1" {
  value = var.sample1
}

variable "cli" {}

output "cli" {
  value = var.cli
}

variable "input" {}

variable "sample2" {
  default = "Hello"
}

variable "sample3" {
  default =  [
    "Hello",
    1000,
    true,
    "World"
  ]
}

variable "sample4" {
  default =  {
    string = "Hello",
    number = 100,
    boolean = true
  }
}