output "route_table_shared_services_id" {
  value = aws_ec2_transit_gateway_route_table.shared-services.id
}

output "route_table_production_id" {
  value = aws_ec2_transit_gateway_route_table.production.id
}

output "route_table_staging_id" {
  value = aws_ec2_transit_gateway_route_table.staging.id
}

output "route_table_development_id" {
  value = aws_ec2_transit_gateway_route_table.development.id
}
