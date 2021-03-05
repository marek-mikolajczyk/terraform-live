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



module "webserver_cluster_10" {
	source = "github.com/marek-mikolajczyk/terraform-modules//services/webserver?ref=0.1.0"

	server_port	= 8080
	server_env	= "DEV"
}


module "webserver_cluster_11" {
	source = "github.com/marek-mikolajczyk/terraform-modules//services/webserver?ref=0.1.1"
	# source = "../../../../terraform-modules/services/webserver/"

	server_port	= 8080
	server_env	= "DEV"
}

