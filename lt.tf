resource "aws_launch_template" "your_eks_launch_template" {
  name = "your_eks_launch_template"

  vpc_security_group_ids = ["${aws_security_group.ssh_allowed.id}"]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  image_id = "ami-0667149a69bc2c367"
  instance_type = "t3.medium"
  key_name = "AWS_SSO"


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EKS-MANAGED-NODE"
    }
  }
    user_data = base64encode(templatefile("userdata.tpl", { CLUSTER_NAME = aws_eks_cluster.demo.name, B64_CLUSTER_CA = aws_eks_cluster.demo.certificate_authority[0].data, API_SERVER_URL = aws_eks_cluster.demo.endpoint }))

}
