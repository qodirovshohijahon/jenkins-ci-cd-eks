resource "kubernetes_deployment" "java-app" {
  metadata {
    name = "java-app"
    labels = {
      app = "java-app"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "java-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "java-app"
        }
      }
      spec {
        container {
          image = "akdevopscoaching/mywebapp:latest"
          name  = "java-app"

          port {
            container_port = 8085
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}