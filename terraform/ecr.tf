resource "aws_ecr_repository" "react" {
  name = "${var.project}-repo"
  image_scanning_configuration { scan_on_push = true }
  tags = { Project = var.project }
}

resource "aws_ecr_lifecycle_policy" "react" {
  repository = aws_ecr_repository.react.name
  policy     = <<POLICY
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Expire untagged images older than 30 days",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 30
      },
      "action": { "type": "expire" }
    },
    {
      "rulePriority": 2,
      "description": "Keep only the last 10 tagged images",
      "selection": {
        "tagStatus": "tagged",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": { "type": "expire" }
    }
  ]
}
POLICY
}
