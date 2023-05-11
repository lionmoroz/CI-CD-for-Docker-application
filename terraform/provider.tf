provider "google" {
   credentials = "${file("/tmp/serviceaccount.json")}"
   project     = "engaged-diode-380415" # REPLACE WITH YOUR PROJECT ID
   region      = "europe-west1"
}
