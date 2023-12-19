resource "local_file" "ip_value" {

  content  = "[servers] \n${vsphere_virtual_machine.vm.guest_ip_addresses[0]}"

  filename = "/Users/tyler/terr2/1apache/inventory"

  provisioner "local-exec" {
    command = "ansible-playbook -i ../1apache/inventory ../1apache/playbook2.yml -u root"
  }
}