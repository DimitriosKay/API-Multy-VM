# API Multy-VM Setup
## Group API Multi VM setup on AWS (Terraform/Docker)

<br />

## *provider.tf* file is used for interaction to AWS resources:
  - we get version and region so it defaults to those options

## *vpc.tf* files define the virtual network:
  - calling only a simple *cidr_block* which defines the network range
  
## *subnet.tf* file defines the subnet range:
  - passing the *vpc_id* and *cidr_block*
  
## *gateway.tf* creates a gateway for the vpc:
  - calling only the *vpc_id*
  
## *route_table.tf* file directs network traffic:
#### your either your network or vpc has to be associated with the *route_table*
  - specify the block and the *gateway_id* defined earlier
  
## *route_table_association.tf* file creates association between the *routing_table* and *subnet*:
  - pass arguments for *subnet_id* and *route_table_id*

## *key-pair.tf* EC2 key pair setup:
#### control login into instances
  - requires an existing key pair, called in the *public_key* argument

## *-sg.tf* files are the security group setups:
#### split for each instance created (more modular and readable)
  - *name* and *description* are custom
  - vpc_id needs to be specified (defined in vpc *.tf* file)
  - *ingress* = open inbound ports
  - *egress* = open outbound ports (premitted by default)
  
## *-instance.tf* files are the setup for the instances :
#### split for each VM created (more modular and readable)
  - most elements here are either called from other *.tf* files
  - or found somewhere on the web (.eg ami, instance_type)
  - or custom (.eg private_id)
  - call *remote-exec* provisioner to ssh in and run commands
    - run commands


We did it !

