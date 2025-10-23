package k8s.admission
deny[msg] {
  input.request.kind.kind == "Pod"
  not input.request.object.spec.securityContext.runAsNonRoot
  msg = "all pods must set securityContext.runAsNonRoot = true"
}
