# create vcn

resource "oci_core_vcn" "wind_vcn" {

  cidr_block     = var.vcn_cidr_mod
  compartment_id = var.compartment_ocid_mod
  display_name   = "wind_vcn"
}