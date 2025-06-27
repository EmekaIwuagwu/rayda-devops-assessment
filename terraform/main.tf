resource "kubernetes_namespace" "fastapi" {
  metadata {
    name = "fastapi"
  }
}
