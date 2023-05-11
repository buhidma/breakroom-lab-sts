resource "google_project_service" "resource-manager" {
    service = "cloudresourcemanager.googleapis.com"
    disable_dependent_services = true
  
}
resource "google_project_service" "storage-transfer" {
    service = "storagetransfer.googleapis.com"
    disable_dependent_services = true
  
}
  
