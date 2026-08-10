output "sender_email" {

  description = "Verified sender email for Amazon SES"

  value = aws_ses_email_identity.sender.email

}

output "sender_email_arn" {

  description = "ARN of the SES Email Identity"

  value = aws_ses_email_identity.sender.arn

}
