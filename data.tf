# data "archive_file" "runner_lambda_zip" {
#   type = "zip"

#   source {
#     content  = file("${path.module}/function/lambda.py")
#     filename = "lambda.py"
#   }

#   source {
#     content  = file("${path.module}/function/aws/events.py")
#     filename = "aws/events.py"
#   }

#   source {
#     content  = file("${path.module}/function/aws/common.py")
#     filename = "aws/common.py"
#   }

#   source {
#     content  = file("${path.module}/function/aws/dynamodb.py")
#     filename = "aws/dynamodb.py"
#   }

#   source {
#     content  = file("${path.module}/function/aws/instances.py")
#     filename = "aws/instances.py"
#   }

#   source {
#     content  = file("${path.module}/function/github/events.py")
#     filename = "github/events.py"
#   }

#   source {
#     content  = file("${path.module}/function/github/common.py")
#     filename = "github/common.py"
#   }

#   source {
#     content  = file("${path.module}/function/github/runners.py")
#     filename = "github/runners.py"
#   }

#   source {
#     content  = file("${path.module}/function/github/webhook.py")
#     filename = "github/webhook.py"
#   }

#   source {
#     content  = file("${path.module}/function/github/workflow.py")
#     filename = "github/workflow.py"
#   }

#   output_path = "${path.module}/lambda.zip"
# }


# data "aws_iam_policy_document" "runner_lambda_role" {
#   statement {
#     actions = [
#       "sts:AssumeRole"
#     ]

#     principals {
#       type = "Service"
#       identifiers = [
#         "lambda.amazonaws.com",
#       ]
#     }
#   }
# }