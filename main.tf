
module "helixalpha_daemon" {
  source = "./.kubernetes/daemon"
  data_path    = "/root/.helixalpha"
  replica_count = "1"
}