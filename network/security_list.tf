# create security list 

resource "oci_core_security_list" "wind_security_list" {

  compartment_id = var.compartment_ocid_mod
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
