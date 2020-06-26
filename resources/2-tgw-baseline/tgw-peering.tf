data "aws_region" "peer" {
  provider = aws.sa-east-1
}

resource "aws_ec2_transit_gateway_peering_attachment" "us" {
  provider = aws.us-east-1

  peer_account_id         = module.tgw-us.tgw_owner_id
  peer_region             = data.aws_region.peer.name
  peer_transit_gateway_id = module.tgw-sa.tgw_id
  transit_gateway_id      = module.tgw-us.tgw_id

  tags = {
    Name = "TGW Peering - sa-east-1 <-> us-east-1"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "example" {
  provider = aws.sa-east-1

  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us.id

  tags = {
    Name = "TGW Peering - sa-east-1 <-> us-east-1"
  }
}