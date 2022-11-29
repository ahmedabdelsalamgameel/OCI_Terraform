# create subnet 

resource "oci_core_subnet" "wind_subnet" {

  vcn_id            = oci_core_vcn.wind_vcn.id
  cidr_block        = var.subnet_cidr_mod
  display_name      = "wind_subnet"
  compartment_id    = var.compartment_ocid_mod
  security_list_ids = [oci_core_security_list.wind_security_list.id]

}
