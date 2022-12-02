module "network" {
  source                  = "./network"
  compartment_ocid_mod    = var.compartment_ocid
  region_mod              = var.region
  availability_domain_mod = var.availability_domain
  vcn_cidr_mod            = var.vcn_cidr
  subnet_cidr_mod         = var.subnet_cidr
}

