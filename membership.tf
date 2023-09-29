resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_Ayse.name,
    aws_iam_user.user_Ahmet.name,
  ]

  group = aws_iam_group.YeniDevelopers.name
}

resource "aws_iam_group" "group" {
  name = "YeniDevelopers"
}

resource "aws_iam_user" "user_one" {
  name = "Ayse"
}

resource "aws_iam_user" "user_two" {
  name = "Ahmet"
}