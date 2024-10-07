output "load_balancer_dns" {
  value = aws_lb.internal_lb["my-internal-load-balancer"].dns_name
  description = "The DNS name of the load balancer"
}