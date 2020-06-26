provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::855824826546:role/OrganizationAccountAccessRole"
  }
}

provider "aws" {
  region = "sa-east-1"
  alias  = "sa-east-1"

  assume_role {
    role_arn = "arn:aws:iam::855824826546:role/OrganizationAccountAccessRole"
  }
}