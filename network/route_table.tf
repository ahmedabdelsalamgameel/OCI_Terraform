# create route table 

resource "oci_core_route_table" "wind_route_table" {

  compartment_id = var.compartment_ocid_mod
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