output "vcn_id" {
  value = oci_core_vcn.wind_vcn.id
}

output "subnet_id" {
  value = oci_core_subnet.wind_subnet.id
}
