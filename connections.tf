provider "google" {
    credentials = "${file("../keys/rick-a-55712413767f.json")}"
    project = "rick-a"
    region = "us-central1"
}

provider "aws" {
    region = "us-west-2"
}

#provider "azurerm" {
#    subscription_id = "456739a9-5a6f-48e0-867c-15a5e3750d34"
#    client_id = "1"
#    client_secret = "2"
#    tennant_id = "45d659f4-1555-498b-93b5-0b99a89a284b"
#}