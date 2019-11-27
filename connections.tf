provider "google" {
    credentials = "${file("../keys/rick-a-55712413767f.json")}"
    project = "rick-a"
    region = "us-central1"
}
provider "aws" {
    region = "us-west-2"
}

provider "azurerm" {
    subscription_id = "0"
    client_id = "1"
    client_secret = "2"
    tennant_id = "3"
}