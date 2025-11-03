resource "aws_ecr_repository" "react" {
  name = "${var.project}-repo"
  image_scanning_configuration { scan_on_push = true }
  tags = { Project = var.project }
}
