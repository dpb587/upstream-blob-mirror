variable "owner"      { default = "dpb587" }
variable "repository" { default = "upstream-blob-receipts" }
variable "region"     { default = "us-east-1" }

provider "aws" {
  region = "${var.region}"
}


#
# iam
#

resource "aws_iam_user" "concourse" {
  name = "${var.repository}-concourse"
}

resource "aws_iam_access_key" "user" {
  user = "${aws_iam_user.concourse.name}"
}

output "concourse_access_key" {
  value = "${aws_iam_access_key.user.id}"
}

output "concourse_secret_key" {
  sensitive = true
  value = "${aws_iam_access_key.user.secret}"
}


#
# s3
#

resource "aws_s3_bucket" "bucket" {
  region = "${var.region}"
  bucket = "${var.owner}-${var.repository}-${var.region}"
  versioning {
    enabled = true
  }
}

  output "bucket_fqdn" { value = "${aws_s3_bucket.bucket.bucket_domain_name}" }
  output "bucket_parent_domain" { value = "${replace("${aws_s3_bucket.bucket.bucket_domain_name}", "/^[^\\.]+\\.(.+)$/", "$1")}" }
  output "bucket_name" { value = "${aws_s3_bucket.bucket.bucket}" }

data "aws_iam_policy_document" "public_read" {
  statement {
    actions = [
      "s3:ListBucket"
    ]
    effect = "Allow"
    principals {
      type = "*"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.bucket.arn}",
    ]
  }
  statement {
    actions = [
      "s3:GetObject"
    ]
    effect = "Allow"
    principals {
      type = "*"
      identifiers = ["*"]
    }
    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy = "${data.aws_iam_policy_document.public_read.json}"
}

data "aws_iam_policy_document" "concourse_write" {
  statement {
    actions = [
      "s3:ListBucket"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.bucket.arn}",
    ]
  }
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.bucket.arn}/*",
    ]
  }
}

resource "aws_iam_user_policy" "concourse_write" {
    name = "s3"
    user = "${aws_iam_user.concourse.name}"
    policy = "${data.aws_iam_policy_document.concourse_write.json}"
}
