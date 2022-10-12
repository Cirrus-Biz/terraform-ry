# make outputs for Region all names and tags, cidr block, Starting IP?, 

# output "load_balancer_arn" {
#   value = module.load_balancer.load_balancer_arn
# }

# output "load_balancer_dns" {
#   value = module.load_balancer.load_balancer_dns
# }

output "public_ip" {
  value = module.vpc.public_subnets
}

output "vcp_name" {
  value = module.vpc.name
}