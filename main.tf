resource "aws_iam_role" "runner_lambda_role" {
  name               = "${var.common_name}-runner-lambda-role-${var.region}"
  path               = "/"
  description        = "IAM role for runner lambda function"
  assume_role_policy = data.aws_iam_policy_document.runner_lambda_role.json
}

resource "aws_lambda_function" "runner_lambda_function" {
  function_name    = "myDaniela-runner-lambda"
  role             = aws_iam_role.runner_lambda_role.arn
  handler          = "lambda.handler"
  runtime          = "python3.8"
  filename         = data.archive_file.runner_lambda_zip.output_path
  source_code_hash = data.archive_file.runner_lambda_zip.output_base64sha256
  timeout          = var.lambda_timeout

  environment {
    variables = {
      foo="bar"
    }
  }
}

resource "aws_lambda_provisioned_concurrency_config" "lambda_concurrency" {
  function_name                     = "myDanielaFunction"
  qualifier                         = aws_lambda_function.runner_lambda_function.version
  provisioned_concurrent_executions = try(var.lambda_provisioned_concurrency[var.env], 1)
}