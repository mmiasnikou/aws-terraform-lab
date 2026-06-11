# Smoke-test resource: proves Terraform reaches LocalStack.
# Will be replaced by the real bootstrap/networking next.
resource "aws_s3_bucket" "smoke" {
  bucket = "${var.project}-smoke-test"
}
