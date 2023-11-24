variable "http_server" {
  description = "value of the http server which talks the terraform remote api"
}
variable "stateid" {
  description = "id of the state to use"
}

terraform {
  backend "http" {
    address = "http://${var.http_server}/terraform_state/${var.stateid}"
    lock_address = "http://${var.http_server}/terraform_lock/${var.stateid}"
    lock_method = "PUT"
    unlock_address = "http://${var.http_server}/terraform_lock/${var.stateid}"
    unlock_method = "DELETE"
  }
}

resource "null_resource" "test" {
  count = 5 
}

output "all" {
  value = null_resource.test[*].id
}