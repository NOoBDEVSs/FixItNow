region         = "us-east-1"
name           = "CC"
vpc_cidr       = "10.0.0.0/20"

public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]
data_subnets    = ["10.0.4.0/24", "10.0.5.0/24"]

azs = ["us-east-1a", "us-east-1b"]

ami_id          = "ami-0f88e80871fd81e91"  # Example Amazon Linux 2 AMI
instance_type   = "t2.micro"
key_name        = "my-ssh-key"

desired_capacity = 2
min_size         = 2
max_size         = 4

db_name          = "appdb"
db_username      = "admin"
db_password      = "SuperSecurePassword123!"

acm_certificate_arn = "arn:aws:acm:us-east-1:337121284578:certificate/a0996041-1129-4f11-816b-92ceee71c705"
