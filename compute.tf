resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "<Compartment ID>"
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        source_id = "<OS-Image Source ID>"
        source_type = "image"
    }

    # Optional
    display_name = "My Images "
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "<VCN Subnet ID>"
    }
    metadata = {
        ssh_authorized_keys = file("<ssh pub key file localtion local>")
    } 
    preserve_boot_volume = false
}

