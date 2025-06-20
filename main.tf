
module "app_functions" {
  source = "./app_functions" 
  rg_name = var.rg_name
  location_name = var.location_name     
}

