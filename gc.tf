variable "acc" { }
variable "prj" { }
variable "reg" { }

provider "google" {
  credentials  = "${file("${var.acc}")}"
  project      = "${var.prj}"
  region       = "${var.reg}"
}

resource "google_storage_bucket" "BACKUP" {
  name     = "uatsarose"
  storage_class = "COLDLINE"
  location = "asia-northeast1"

   website {
           main_page_suffix = "index.html"
	       not_found_page   = "404.html"
		     }
}

resource "google_storage_bucket_object" "picture" {
  name   = "test"
  source = "/tmp/test.txt"
  bucket = "${google_storage_bucket.BACKUP.name}"
}
