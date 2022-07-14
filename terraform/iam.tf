resource "aws_iam_role" "IamRole" {
  name = "Ec2RoleForSSM"
  description = "EC2 IAM role for SSM access"
  assume_role_policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow",
    }
  ]
}
)
}

resource "aws_iam_instance_profile" "Ec2InstanceProfile" {
  role = aws_iam_role.IamRole.name
  name = "Ec2RoleForSSM"
}
resource "aws_iam_role_policy_attachment" "IamRoleManagedPolicyRoleAttachment0" {
  role = aws_iam_role.IamRole.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
