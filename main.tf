# KMS Key
resource "aws_kms_key" "kms_key" {
  description             = var.key_description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = true

  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = var.kms_key_policy

  tags = merge(
    {
      Name = var.alias_name
    },
    var.tags
  )
}

# KMS Alias
resource "aws_kms_alias" "key_alias" {
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.kms_key.id
}
