module "keypair" {
  source  = "mitchellh/dynamic-keys/aws"
  version = "2.0.0"
  path    = "keys/${var.environment}"
  name    = "kp-${var.environment}-${var.key_name}"
}