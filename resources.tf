resource "google_compute_network" "our_development_network" {
    name = "devnetwork"
    auto_create_subnetworks = true
}

resource "aws_vpc" "environment-example-too" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "terraform_aws_gcp_example_too"
    }
}