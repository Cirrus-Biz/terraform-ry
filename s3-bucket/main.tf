# # Create the s3 bucket
# resource "aws_s3_bucket" "s3_bucket" {
#   bucket = var.bucket_name

#   tags = var.tags
# }

# resource "aws_s3_bucket_website_configuration" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }
# }

# resource "aws_s3_bucket_acl" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   acl = "private"
# }

# data "aws_iam_policy_document" "allow_access_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["123456789012"]
#     }

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.s3_bucket.arn,
#       "${aws_s3_bucket.s3_bucket.arn}/*",
#     ]
#   }
# }

# resource "aws_s3_bucket_public_access_block" "s3_bucket" {
#   bucket = aws_s3_bucket.s3_bucket.id

#   block_public_acls   = true
#   block_public_policy = true
# }
