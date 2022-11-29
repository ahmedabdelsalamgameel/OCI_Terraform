terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.100.0"
    }
  }
}

provider "oci" {

  user_ocid        = var.user_ocid
  tenancy_ocid     = var.tenancy_ocid
  region           = var.region
  fingerprint      = var.fingerprint
  private_key_path = var.oci_private_key

}