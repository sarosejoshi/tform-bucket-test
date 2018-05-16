resource "google_storage_bucket_iam_binding" "binding" {
  bucket = "uatsarose"
  role        = "roles/storage.objectAdmin"

  members = [
    "user:sarosejoshi@gmail.com",
  ]
}
