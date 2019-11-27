resource "google_compute_instance" "firstserver" {
    name = "thefirserver"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"

    boot_disk {
        initialize_params {
            image = "ubuntu-1804-bionic-v20191113"
        }
    }
    network_interface {
        subnetwork = "${google_compute_subnetwork.dev-subnet.name}"
        access_config {
        }
    }
    metadata = {
        foo = "bar"
    }
    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}
resource "aws_instance" "secondserver" {
    ami = "${data.aws_ami.ubuntu.id}"
    instance_type = "t2.micro"

    tags = {
        Name = "Identifier tag"
    }
    subnet_id = "${aws_subnet.subnet2.id}"
}