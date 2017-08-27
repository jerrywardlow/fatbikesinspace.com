variable "fb_key_name" {}
variable "fb_key_algorithm" {}
variable "fb_key_secret" {}

provider "dns" {
    update {
        server = "72.167.238.111"
        key_name = "${var.fb_key_name}"
        key_algorithm = "${var.fb_key_algorithm}"
        key_secret = "${var.fb_key_secret}"
    }
}

resource "dns_a_record_set" "www" {
    zone = "fatbikesinspace.com"
    name = "www"
    addresses = [
        "107.180.57.118"
    ]
    ttl = 3600
}
