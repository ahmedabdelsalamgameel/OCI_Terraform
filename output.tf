output "instance_ip" {
  value = oci_core_instance.wind_instance.public_ip
}

/*
 here: i generate private key from tls_private_key 
 you can display value of it after apply using "terraform  output generated_ssh_private_key"

output "generated_ssh_private_key" {
  value     = tls_private_key.public_and_private_key_pair.private_key_pem
  sensitive = true
}
*/