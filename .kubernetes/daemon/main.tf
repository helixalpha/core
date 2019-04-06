resource "helm_release" "helixalpha" {
  name          = "helixalpha"
  force_update  = true
  recreate_pods = true
  chart         = "${"${path.module}/chart"}"

  set {
    name = "replicaCount"
    value = "${var.replica_count}"
  }

  set {
    name  = "volumes.data"
    value = "${var.data_path}"
  }

}