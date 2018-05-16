resource "google_kms_key_ring" "key_ring" {
  name     = "kms-secret-keyring"
  location = "asia-northeast1"
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "kms-secret-key"
  key_ring = "${google_kms_key_ring.key_ring.id}"
}

data "google_kms_secret" "usersecret" {
  crypto_key = "${google_kms_crypto_key.crypto_key.id}"
  ciphertext = "CiQAvo+g7Tp7NzRemJcG352L7CcYJCefLMJT6cOI+nC7K8rKm0USMgD6sjTT8tv5tVrYyck+Hy4GKNcWHgZBZTSP6AlqZnCjzarbQ59eisEvvxaRyqN3HsP2"
}