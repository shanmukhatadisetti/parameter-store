resource "aws_ssm_parameter" "parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].type
  value = var.parameters[count.index].value
}

variable "parameters" {
  default = [
    {name = "prod.rds.master_username" , value = "Expense" , type = "String"},
    {name = "prod.rds.master_password" , value = "Expenseprod1234" , type = "SecureString"},
    {name = "prod.rds.endpoint" , value = "prod-mysql.cluster-cnjbzccd9deq.us-east-1.rds.amazonaws.com" , type = "String"},
    {name = "prod.expense.frontend.backend_url" , value = "http://backend-prod.autonagar.in/" , type = "String"},

    #dev env

    {name = "dev.expense.frontend.backend_url" , value = "http://backend-dev.autonagar.in/" , type = "String"},

    #jenkins
    {name = "jenkins_password" , value = "admin123" , type = "SecureString"}

    ##Note: Ideally we don't keep passwords in GIT REPOS, Those will be created manually. Secret management of creating secret is most of the time is Manual

  ]
}