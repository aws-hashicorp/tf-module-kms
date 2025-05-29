output "kms_key_id" {
  value       = aws_kms_key.kms_key.id
  description = "The ID of the KMS key"
}
