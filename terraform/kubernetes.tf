output "cluster_name" {
  value = "home-cluster.k8s.local.aws"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-home-cluster-k8s-local-aws.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-home-cluster-k8s-local-aws.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-home-cluster-k8s-local-aws.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-west-1a-home-cluster-k8s-local-aws.id}", "${aws_subnet.eu-west-1b-home-cluster-k8s-local-aws.id}", "${aws_subnet.eu-west-1c-home-cluster-k8s-local-aws.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-home-cluster-k8s-local-aws.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-home-cluster-k8s-local-aws.name}"
}

output "region" {
  value = "eu-west-1"
}

output "vpc_id" {
  value = "${aws_vpc.home-cluster-k8s-local-aws.id}"
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_autoscaling_attachment" "master-eu-west-1a-masters-home-cluster-k8s-local-aws" {
  elb                    = "${aws_elb.api-home-cluster-k8s-local-aws.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1a-masters-home-cluster-k8s-local-aws.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1b-masters-home-cluster-k8s-local-aws" {
  elb                    = "${aws_elb.api-home-cluster-k8s-local-aws.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1b-masters-home-cluster-k8s-local-aws.id}"
}

resource "aws_autoscaling_attachment" "master-eu-west-1c-masters-home-cluster-k8s-local-aws" {
  elb                    = "${aws_elb.api-home-cluster-k8s-local-aws.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-eu-west-1c-masters-home-cluster-k8s-local-aws.id}"
}

resource "aws_autoscaling_group" "master-eu-west-1a-masters-home-cluster-k8s-local-aws" {
  name                 = "master-eu-west-1a.masters.home-cluster.k8s.local.aws"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1a-masters-home-cluster-k8s-local-aws.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-home-cluster-k8s-local-aws.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1a.masters.home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-west-1b-masters-home-cluster-k8s-local-aws" {
  name                 = "master-eu-west-1b.masters.home-cluster.k8s.local.aws"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1b-masters-home-cluster-k8s-local-aws.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1b-home-cluster-k8s-local-aws.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1b.masters.home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-west-1c-masters-home-cluster-k8s-local-aws" {
  name                 = "master-eu-west-1c.masters.home-cluster.k8s.local.aws"
  launch_configuration = "${aws_launch_configuration.master-eu-west-1c-masters-home-cluster-k8s-local-aws.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1c-home-cluster-k8s-local-aws.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-west-1c.masters.home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-eu-west-1c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-home-cluster-k8s-local-aws" {
  name                 = "nodes.home-cluster.k8s.local.aws"
  launch_configuration = "${aws_launch_configuration.nodes-home-cluster-k8s-local-aws.id}"
  max_size             = 3
  min_size             = 3
  vpc_zone_identifier  = ["${aws_subnet.eu-west-1a-home-cluster-k8s-local-aws.id}", "${aws_subnet.eu-west-1b-home-cluster-k8s-local-aws.id}", "${aws_subnet.eu-west-1c-home-cluster-k8s-local-aws.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.home-cluster.k8s.local.aws"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "a.etcd-events.home-cluster.k8s.local.aws"
    "k8s.io/etcd/events" = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "a.etcd-main.home-cluster.k8s.local.aws"
    "k8s.io/etcd/main"   = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-events-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "b.etcd-events.home-cluster.k8s.local.aws"
    "k8s.io/etcd/events" = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-main-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "b.etcd-main.home-cluster.k8s.local.aws"
    "k8s.io/etcd/main"   = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-events-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "c.etcd-events.home-cluster.k8s.local.aws"
    "k8s.io/etcd/events" = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-main-home-cluster-k8s-local-aws" {
  availability_zone = "eu-west-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "home-cluster.k8s.local.aws"
    Name                 = "c.etcd-main.home-cluster.k8s.local.aws"
    "k8s.io/etcd/main"   = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_eip" "eu-west-1a-home-cluster-k8s-local-aws" {
  vpc = true
}

resource "aws_eip" "eu-west-1b-home-cluster-k8s-local-aws" {
  vpc = true
}

resource "aws_eip" "eu-west-1c-home-cluster-k8s-local-aws" {
  vpc = true
}

resource "aws_elb" "api-home-cluster-k8s-local-aws" {
  name = "api-home-cluster-k8s-loca-a92egm"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-home-cluster-k8s-local-aws.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-home-cluster-k8s-local-aws.id}", "${aws_subnet.utility-eu-west-1b-home-cluster-k8s-local-aws.id}", "${aws_subnet.utility-eu-west-1c-home-cluster-k8s-local-aws.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "api.home-cluster.k8s.local.aws"
  }
}

resource "aws_iam_instance_profile" "masters-home-cluster-k8s-local-aws" {
  name = "masters.home-cluster.k8s.local.aws"
  role = "${aws_iam_role.masters-home-cluster-k8s-local-aws.name}"
}

resource "aws_iam_instance_profile" "nodes-home-cluster-k8s-local-aws" {
  name = "nodes.home-cluster.k8s.local.aws"
  role = "${aws_iam_role.nodes-home-cluster-k8s-local-aws.name}"
}

resource "aws_iam_role" "masters-home-cluster-k8s-local-aws" {
  name               = "masters.home-cluster.k8s.local.aws"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.home-cluster.k8s.local.aws_policy")}"
}

resource "aws_iam_role" "nodes-home-cluster-k8s-local-aws" {
  name               = "nodes.home-cluster.k8s.local.aws"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.home-cluster.k8s.local.aws_policy")}"
}

resource "aws_iam_role_policy" "masters-home-cluster-k8s-local-aws" {
  name   = "masters.home-cluster.k8s.local.aws"
  role   = "${aws_iam_role.masters-home-cluster-k8s-local-aws.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.home-cluster.k8s.local.aws_policy")}"
}

resource "aws_iam_role_policy" "nodes-home-cluster-k8s-local-aws" {
  name   = "nodes.home-cluster.k8s.local.aws"
  role   = "${aws_iam_role.nodes-home-cluster-k8s-local-aws.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.home-cluster.k8s.local.aws_policy")}"
}

resource "aws_internet_gateway" "home-cluster-k8s-local-aws" {
  vpc_id = "${aws_vpc.home-cluster-k8s-local-aws.id}"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "home-cluster.k8s.local.aws"
  }
}

resource "aws_key_pair" "kubernetes-home-cluster-k8s-local-aws-f9c8bc9e615f0efc99ef49d39c2c08f5" {
  key_name   = "kubernetes.home-cluster.k8s.local.aws-f9:c8:bc:9e:61:5f:0e:fc:99:ef:49:d3:9c:2c:08:f5"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.home-cluster.k8s.local.aws-f9c8bc9e615f0efc99ef49d39c2c08f5_public_key")}"
}

resource "aws_launch_configuration" "master-eu-west-1a-masters-home-cluster-k8s-local-aws" {
  name_prefix                 = "master-eu-west-1a.masters.home-cluster.k8s.local.aws-"
  image_id                    = "ami-bd229ec4"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-home-cluster-k8s-local-aws-f9c8bc9e615f0efc99ef49d39c2c08f5.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-home-cluster-k8s-local-aws.id}"
  security_groups             = ["${aws_security_group.masters-home-cluster-k8s-local-aws.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1a.masters.home-cluster.k8s.local.aws_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-west-1b-masters-home-cluster-k8s-local-aws" {
  name_prefix                 = "master-eu-west-1b.masters.home-cluster.k8s.local.aws-"
  image_id                    = "ami-bd229ec4"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-home-cluster-k8s-local-aws-f9c8bc9e615f0efc99ef49d39c2c08f5.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-home-cluster-k8s-local-aws.id}"
  security_groups             = ["${aws_security_group.masters-home-cluster-k8s-local-aws.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1b.masters.home-cluster.k8s.local.aws_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-west-1c-masters-home-cluster-k8s-local-aws" {
  name_prefix                 = "master-eu-west-1c.masters.home-cluster.k8s.local.aws-"
  image_id                    = "ami-bd229ec4"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-home-cluster-k8s-local-aws-f9c8bc9e615f0efc99ef49d39c2c08f5.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-home-cluster-k8s-local-aws.id}"
  security_groups             = ["${aws_security_group.masters-home-cluster-k8s-local-aws.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-west-1c.masters.home-cluster.k8s.local.aws_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-home-cluster-k8s-local-aws" {
  name_prefix                 = "nodes.home-cluster.k8s.local.aws-"
  image_id                    = "ami-bd229ec4"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-home-cluster-k8s-local-aws-f9c8bc9e615f0efc99ef49d39c2c08f5.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-home-cluster-k8s-local-aws.id}"
  security_groups             = ["${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.home-cluster.k8s.local.aws_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "eu-west-1a-home-cluster-k8s-local-aws" {
  allocation_id = "${aws_eip.eu-west-1a-home-cluster-k8s-local-aws.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1a-home-cluster-k8s-local-aws.id}"
}

resource "aws_nat_gateway" "eu-west-1b-home-cluster-k8s-local-aws" {
  allocation_id = "${aws_eip.eu-west-1b-home-cluster-k8s-local-aws.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1b-home-cluster-k8s-local-aws.id}"
}

resource "aws_nat_gateway" "eu-west-1c-home-cluster-k8s-local-aws" {
  allocation_id = "${aws_eip.eu-west-1c-home-cluster-k8s-local-aws.id}"
  subnet_id     = "${aws_subnet.utility-eu-west-1c-home-cluster-k8s-local-aws.id}"
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.home-cluster-k8s-local-aws.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.home-cluster-k8s-local-aws.id}"
}

resource "aws_route" "private-eu-west-1a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1a-home-cluster-k8s-local-aws.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1a-home-cluster-k8s-local-aws.id}"
}

resource "aws_route" "private-eu-west-1b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1b-home-cluster-k8s-local-aws.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1b-home-cluster-k8s-local-aws.id}"
}

resource "aws_route" "private-eu-west-1c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-eu-west-1c-home-cluster-k8s-local-aws.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.eu-west-1c-home-cluster-k8s-local-aws.id}"
}

resource "aws_route53_record" "api-home-cluster-k8s-local-aws" {
  name = "api.home-cluster.k8s.local.aws"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-home-cluster-k8s-local-aws.dns_name}"
    zone_id                = "${aws_elb.api-home-cluster-k8s-local-aws.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/Z3L6TOI1CHVERF"
}

resource "aws_route53_zone_association" "Z3L6TOI1CHVERF" {
  zone_id = "/hostedzone/Z3L6TOI1CHVERF"
  vpc_id  = "${aws_vpc.home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table" "home-cluster-k8s-local-aws" {
  vpc_id = "${aws_vpc.home-cluster-k8s-local-aws.id}"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "home-cluster.k8s.local.aws"
  }
}

resource "aws_route_table" "private-eu-west-1a-home-cluster-k8s-local-aws" {
  vpc_id = "${aws_vpc.home-cluster-k8s-local-aws.id}"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "private-eu-west-1a.home-cluster.k8s.local.aws"
  }
}

resource "aws_route_table" "private-eu-west-1b-home-cluster-k8s-local-aws" {
  vpc_id = "${aws_vpc.home-cluster-k8s-local-aws.id}"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "private-eu-west-1b.home-cluster.k8s.local.aws"
  }
}

resource "aws_route_table" "private-eu-west-1c-home-cluster-k8s-local-aws" {
  vpc_id = "${aws_vpc.home-cluster-k8s-local-aws.id}"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "private-eu-west-1c.home-cluster.k8s.local.aws"
  }
}

resource "aws_route_table_association" "private-eu-west-1a-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.eu-west-1a-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.private-eu-west-1a-home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table_association" "private-eu-west-1b-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.eu-west-1b-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.private-eu-west-1b-home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table_association" "private-eu-west-1c-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.eu-west-1c-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.private-eu-west-1c-home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table_association" "utility-eu-west-1a-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.utility-eu-west-1a-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table_association" "utility-eu-west-1b-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.utility-eu-west-1b-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.home-cluster-k8s-local-aws.id}"
}

resource "aws_route_table_association" "utility-eu-west-1c-home-cluster-k8s-local-aws" {
  subnet_id      = "${aws_subnet.utility-eu-west-1c-home-cluster-k8s-local-aws.id}"
  route_table_id = "${aws_route_table.home-cluster-k8s-local-aws.id}"
}

resource "aws_security_group" "api-elb-home-cluster-k8s-local-aws" {
  name        = "api-elb.home-cluster.k8s.local.aws"
  vpc_id      = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "api-elb.home-cluster.k8s.local.aws"
  }
}

resource "aws_security_group" "masters-home-cluster-k8s-local-aws" {
  name        = "masters.home-cluster.k8s.local.aws"
  vpc_id      = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "masters.home-cluster.k8s.local.aws"
  }
}

resource "aws_security_group" "nodes-home-cluster-k8s-local-aws" {
  name        = "nodes.home-cluster.k8s.local.aws"
  vpc_id      = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "nodes.home-cluster.k8s.local.aws"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-home-cluster-k8s-local-aws.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-api-elb-xxx-xxx-xxx-xxx--32" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-home-cluster-k8s-local-aws.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["xxx.xxx.xxx.xxx/32"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.api-elb-home-cluster-k8s-local-aws.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  source_security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-xxx-xxx-xxx-xxx--32" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-home-cluster-k8s-local-aws.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["xxx.xxx.xxx.xxx/32"]
}

resource "aws_security_group_rule" "ssh-external-to-node-xxx-xxx-xxx-xxx--32" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-home-cluster-k8s-local-aws.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["xxx.xxx.xxx.xxx/32"]
}

resource "aws_subnet" "eu-west-1a-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "eu-west-1a.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/internal-elb"                  = "1"
  }
}

resource "aws_subnet" "eu-west-1b-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "eu-west-1b.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/internal-elb"                  = "1"
  }
}

resource "aws_subnet" "eu-west-1c-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "eu-west-1c.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/internal-elb"                  = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1a-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "eu-west-1a"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "utility-eu-west-1a.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/elb"                           = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1b-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "eu-west-1b"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "utility-eu-west-1b.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/elb"                           = "1"
  }
}

resource "aws_subnet" "utility-eu-west-1c-home-cluster-k8s-local-aws" {
  vpc_id            = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "eu-west-1c"

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "utility-eu-west-1c.home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
    "kubernetes.io/role/elb"                           = "1"
  }
}

resource "aws_vpc" "home-cluster-k8s-local-aws" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                                  = "home-cluster.k8s.local.aws"
    Name                                               = "home-cluster.k8s.local.aws"
    "kubernetes.io/cluster/home-cluster.k8s.local.aws" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "home-cluster-k8s-local-aws" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "home-cluster.k8s.local.aws"
    Name              = "home-cluster.k8s.local.aws"
  }
}

resource "aws_vpc_dhcp_options_association" "home-cluster-k8s-local-aws" {
  vpc_id          = "${aws_vpc.home-cluster-k8s-local-aws.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.home-cluster-k8s-local-aws.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
