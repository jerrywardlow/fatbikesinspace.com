data "external" "lpass" {
    query = {
        project = "Fatbikes-In-Space"
    }
    program = ["bash", "${path.module}/lpass-scrape.sh"]
}

provider "dns" {
    update {
        server = "72.167.238.111"
        key_name = "${var.key_name}"
        key_algorithm = "${var.key_algorithm}"
        key_secret = "${var.key_secret}"
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
