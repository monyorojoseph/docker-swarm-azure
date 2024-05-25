variable "ports" {
  type = list(object({ name = string, dest_port = string, priority = string, direction = string, protocol = string }))
  default = [
    {
      name      = "ssh"
      dest_port = "22"
      priority  = "300"
      direction = "Inbound"
      protocol  = "Tcp"
    },
    {
      name      = "http"
      dest_port = "80"
      priority  = "301"
      direction = "Inbound"
      protocol  = "Tcp"
    },
    {
      name      = "https"
      dest_port = "443"
      priority  = "302"
      direction = "Inbound"
      protocol  = "Tcp"
    },
    {
      name      = "ManagerNodesInBound"
      dest_port = "2377"
      priority  = "303"
      direction = "Inbound"
      protocol  = "Tcp"
    },
    {
      name      = "OverlayNetworkNodeDiscoveryInBound"
      dest_port = "7946"
      priority  = "304"
      direction = "Inbound"
      protocol  = "*"
    },
    {
      name      = "OverlayMetworkTrafficInBound"
      dest_port = "4789"
      priority  = "305"
      direction = "Inbound"
      protocol  = "Udp"
    },
    {
      name      = "ManagerNodesOutBound"
      dest_port = "2377"
      priority  = "306"
      direction = "Outbound"
      protocol  = "Tcp"
    },
    {
      name      = "OverlayNetworkNodeDiscoveryOutbound"
      dest_port = "7946"
      priority  = "307"
      direction = "Outbound"
      protocol  = "*"
    },
    {
      name      = "OverlayMetworkTrafficOutbound"
      dest_port = "4789"
      priority  = "308"
      direction = "Outbound"
      protocol  = "Udp"
    },
  ]
}