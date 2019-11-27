resource "google_compute_network" "our_development_network" {
    name = "devnetwork"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dev-subnet" {
    ip_cidr_range = "10.0.1.0/24"
    name = "devsubnet"
    network = "${google_compute_network.our_development_network.self_link}"
    region = "us-central1"
}
resource "aws_vpc" "environment-example-too" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        Name = "terraform_aws_example_too"
    }
}

resource "aws_subnet" "subnet1" {
    cidr_block = "${cidrsubnet(aws_vpc.environment-example-too.cidr_block, 3, 1)}"
    vpc_id = "${aws_vpc.environment-example-too.id}"
    availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
    cidr_block = "${cidrsubnet(aws_vpc.environment-example-too.cidr_block, 2, 2)}"
    vpc_id = "${aws_vpc.environment-example-too.id}"
    availability_zone = "us-west-2b"
}

resource "aws_security_group" "subnetsecurity" {
    vpc_id = "${aws_vpc.environment-example-too.id}"

    ingress {
        cidr_blocks = [
            "${aws_vpc.environment-example-too.cidr_block}"   
        ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
}