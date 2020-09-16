module "security-groups" {
  source = "./modules/security"
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  vpc_id = var.vpc_id
}
module "ec2-wsportal" {
  source     = "./modules/ec2-wsportal"
  ec2_number = 2
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}
module "ec2-ftp" {
  source     = "./modules/ec2-ftp"
  ec2_number = 2
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}
module "bastion-iaas" {
  source     = "./modules/bastion-iaas"
  ec2_number = 2
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}

module "bastion-rds" {
  source = "./modules/bastion-rds"
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}

module "ec2-core" {
  source     = "./modules/ec2-core"
  ec2_number = 2
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}
module "ec2-ihs" {
  source     = "./modules/ec2-ihs"
  ec2_number = 2
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  volume_size        = var.volume_size
  kms_ebs            = var.kms_ebs
  provider_cloud     = var.provider_cloud
  region_cloud       = var.region_cloud
  ou_cloud           = var.ou_cloud
  service_cloud      = var.service_cloud
  service_type       = var.service_type
  vpc_id             = var.vpc_id
  nic                = var.nic
  instance_profile   = data.aws_iam_instance_profile.EC2Role.name
}
/*module "alarm"{
    source = "./modules/alarm"
	number_plan = 3
	 # Common parameters
	project = var.project
	environment = var.environment
	aws_region = var.aws_region
    # Module parameters
    InstanceId = module.ec2.TestMonitor_id
	alarm_name = "${module.ec2.TestMonitor_name}"
	percentage  = var.percentage
	metric_name = var.metric_name
	namespace = var.namespace
	metric = var.metric
}*/
module "backup" {
  source      = "./modules/backup"
  number_plan = 3
  # Common parameters
  project     = var.project
  environment = var.environment
  aws_region  = var.aws_region
  # Module parameters
  rule_name    = var.rule_name
  service_name = var.service_name
  kms_backup   = var.kms_backup
}
module "alb" {
  source = "./modules/alb"
  # Common parameters
  environment = var.environment
  # Module parameters
  alb_internal       = var.alb_internal
  private_subnet_ids = var.private_subnet_ids
  public_subnet_ids  = var.public_subnet_ids
  vpc_id             = var.vpc_id
  server_service     = var.server_service
  resource_type      = var.resource_type
  service_type       = var.service_type

}
module "nlb" {
  source = "./modules/nlb"
  # Module parameters
  private_subnet_ids = var.private_subnet_ids
  vpc_id             = var.vpc_id
}
module "listener" {
  source = "./modules/listener_tg"
  # Module parameters
  number_plan       = 2
  load_balancer_arn = module.nlb.nlb_arn
  //target_id            = 
  //ec2Core = module.ec2-core.ec2Core
  vpc_id = var.vpc_id

}
module "api" {
  source = "./modules/api"
  # Module parameters
  nlb_arn = module.nlb.nlb_arn
}

module "endpoints" {
  source             = "./modules/endpoints"
  vpc_id             = var.vpc_id
  private_subnet_ids = var.private_subnet_ids
}

module "efs" {
  vpc_id             = var.vpc_id
  source             = "./modules/efs"
  kms_efs            = var.kms_efs
  private_subnet_ids = var.private_subnet_ids
}