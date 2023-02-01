resource "kubernetes_service" "nginx" {
  metadata {
    name = "java-app-svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.app
    }
    port {
#      node_port   = 30201
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
