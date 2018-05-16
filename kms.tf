resource "google_kms_key_ring" "key_ring" {
  name     = "kms-secret-keyring"
  location = "asia-northeast1"
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "kms-secret-key"
  key_ring = "${google_kms_key_ring.key_ring.id}"
}
