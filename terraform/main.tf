provider "vsphere" {
    user = var.user_name
    password = var.user_password
    vsphere_server = var.server
    allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "Development"
}

data "vsphere_datastore" "datastore" {
  name          = "DEV_STORAGE"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "EAS-DEV"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
    name = "blank-centos8-server-w-pub-key"
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform_trial"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = "centos8_64Guest"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  firmware = "efi"
  disk {
    label = "disk0"
    size            = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id 
  }
}

