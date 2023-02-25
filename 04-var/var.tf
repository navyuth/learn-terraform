#variable "sample" {
#  default = "Hello World"
#}
#
#output "sample" {
#  value = var.sample
#}
#
#variable "sample1" {}
#
#output "sample1" {
#  value = var.sample1
#}
#
#variable "cli" {}
#
#output "cli" {
#  value = var.cli
#}
#
#variable "input" {}
#
#variable "sample2" {
#  default = "Hello"
#}
#
#variable "sample3" {
#  default =  [
#    "Hello",
#    1000,
#    true,
#    "World"
#  ]
#}
#
#variable "sample4" {
#  default =  {
#    string = "Hello",
#    number = 100,
#    boolean = true
#  }
#}
#
#output "types" {
#  value = "variable sample2 - ${var.sample2}, first value in list - ${var.sample3[0]}, Boolean value of Map - ${var.sample4["boolean"]}"
#}
#

variable "d1" {
  default = [
    {
      course_name="AWS"
      trainer_name="Ravi"
    },
    {
      course_name="DevOps"
      trainer_name="Raghu"
    }
  ]
}

output "course_names" {
  value = var.d1.*.course_name
}