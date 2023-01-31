resource "kubernetes_service" "java-app-service" {
  metadata {
    name = "java-app-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.java-app-deployment.spec.0.template.0.metadata[0].labels.app
    }
    port {
      port        = 80
      target_port = 8085
    }

    type = "LoadBalancer"
  }
}