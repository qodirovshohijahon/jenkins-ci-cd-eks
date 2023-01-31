resource "kubernetes_deployment" "ak_angular_app_poc_deployment" {
  metadata {
    name = "ak-angular-app-poc-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "ak-angular-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "ak-angular-app"
        }
      }

      spec {
        container {
          name  = "ak-angular-app"
          image = "ananthkannan/myspringbootapp:latest"

          port {
            container_port = 8085
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "ak_angular_svc" {
  metadata {
    name = "ak-angular-svc"
  }

  spec {
    port {
      protocol    = "TCP"
      port        = 8085
      target_port = "8085"
    }

    selector = {
      app = "ak-angular-app"
    }

    type = "LoadBalancer"
  }
}