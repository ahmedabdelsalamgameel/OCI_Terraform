module "network" {
  source                  = "./network"
  compartment_ocid_mod    = var.compartment_ocid
  region_mod              = var.region
  availability_domain_mod = var.availability_domain
  vcn_cidr_mod            = var.vcn_cidr
  subnet_cidr_mod         = var.subnet_cidr
}











/*
# create vcn

resource "oci_core_vcn" "wind_vcn" {

  cidr_block     = var.vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "wind_vcn"

}

# create subnet 

resource "oci_core_subnet" "wind_subnet" {

  vcn_id            = oci_core_vcn.wind_vcn.id
  cidr_block        = var.subnet_cidr
  display_name      = "wind_subnet"
  compartment_id    = var.compartment_ocid
  security_list_ids = [oci_core_security_list.wind_security_list.id]

}

# create internet gateway

resource "oci_core_internet_gateway" "wind_internet_gateway" {

  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.wind_vcn.id
  display_name   = "wind_internet_gateway"
}
# create route table 

resource "oci_core_route_table" "wind_route_table" {

  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.wind_vcn.id
  display_name   = "wind_route_table"
  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.wind_internet_gateway.id
  }

}

# create route table attachment

resource "oci_core_route_table_attachment" "wind_route_table_attachment" {

  subnet_id      = oci_core_subnet.wind_subnet.id
  route_table_id = oci_core_route_table.wind_route_table.id

}
# create security list 

resource "oci_core_security_list" "wind_security_list" {

  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.wind_vcn.id
  display_name   = "wind_security_list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6" # TCP protocol
  }

  ingress_security_rules {

    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = 22 # for SSH
      min = 22
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      max = 80 # for HTTP 
      min = 80
    }
  }
}


# create instance 

resource "oci_core_instance" "wind_instance" {

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "wind_instance"
  shape               = var.instance_shape

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key)
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.wind_subnet.id
    display_name     = "wind_vnic"
    hostname_label   = "wind_instance_vnic"
    assign_public_ip = true
  }

  source_details {
    source_id   = var.image_ocid
    source_type = "image"
  }
}

*/