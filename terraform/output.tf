output "admin-pip" {
  value = module.vm-01.vm_public_ip
}
output "manager-one-pip" {
  value = module.vm-02.vm_public_ip
}
output "worker-one-pip" {
  value = module.vm-03.vm_public_ip
}