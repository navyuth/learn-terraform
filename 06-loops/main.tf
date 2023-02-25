variable "d1" {
  default = 5
}

resource "null_resource" "nothing" {
  count = var.d1
}

variable "d2" {
  default = ["Apple", "Banana"]
}

resource "null_resource" "d2" {
  count = length(var.d2)
}

variable "d3" {
  default = {
    apple = {
      name="Apple"
      count=3
    }
    banana = {
      name="Banana"
      count=30
    }
  }
}