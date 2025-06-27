output "namespace" {
  value = kubernetes_namespace.fastapi.metadata[0].name
}
