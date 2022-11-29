# create instance 

resource "oci_core_instance" "wind_instance" {

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "wind_instance"
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
    #ssh_authorized_keys = tls_private_key.public_and_private_key_pair.public_key_openssh
  }

  create_vnic_details {
    subnet_id        = module.network.subnet_id
    display_name     = "wind_vnic"
    assign_public_ip = true
  }

  source_details {
    source_id   = var.image_ocid
    source_type = "image"
  }
}

/*
# we can use tls_private_key resource to generate <public and private key >
resource "tls_private_key" "public_and_private_key_pair" {
  algorithm = "RSA"
}
*/
