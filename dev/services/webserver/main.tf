provider "aws" {
	region = "us-east-1"
}


terraform {
	backend "s3" {
	bucket = "webserver-dev"
	key = "TF/terraform.tfstate"
	region = "us-east-1"
	encrypt = true
	}
}



module "webserver_cluster_12" {
	source = "github.com/marek-mikolajczyk/terraform-modules//services/webserver?ref=v0.1"

	server_name	= "stgserver"

	server_port	= 8080
	server_env	= "STG"
}


module "webserver_cluster_11" {
	source = "github.com/marek-mikolajczyk/terraform-modules//services/webserver?ref=v0.2"
	# source = "../../../../terraform-modules/services/webserver/"

	server_name	= "devserver"

	server_port	= 8080
	server_env	= "DEV"
}

