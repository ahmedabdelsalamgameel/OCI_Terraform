# create internet gateway

resource "oci_core_internet_gateway" "wind_internet_gateway" {

  compartment_id = var.compartment_ocid_mod
  vcn_id         = oci_core_vcn.wind_vcn.id
  display_name   = "wind_internet_gateway"
}