output "cloud" {
  value = local.contact_info.cloud
}
output "department" {
  value = local.contact_info.department
}
output "cost_code" {
  value = local.contact_info.cost_code
}
output "my_number" {
  value = local.my_number
}
output "phone_number" {
  value     = var.phone_number
  sensitive = true
}