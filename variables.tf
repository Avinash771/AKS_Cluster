variable "rg1_name" {}
variable "location" {}
variable "rg_name" {}
variable "aks_cluster_name" {}
variable "node_count" {
  type    = number
  default = 1
}
variable "vm_size" {
  type    = string
  default = "Standard_D2_v2"
}