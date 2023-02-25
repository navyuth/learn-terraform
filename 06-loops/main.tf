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
  # count can be used for list and it will not work for Maps
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

resource "null_resource" "d3" {
  # Count will not work we need to use for_each for Maps
   #count = length(var.d2)
  for_each = var.d3
}