resource "aws_security_group" "nlb_security_group" {
  for_each = var.nlb_sg_data
  vpc_id   = var.vpc_id
  name     = each.key

  ingress {
    from_port   = each.value[3]
    to_port     = each.value[3]
    protocol    = each.value[1]
    cidr_blocks = [each.value[2]]
  }

  egress {
    from_port   = each.value[0]
    to_port     = each.value[0]
    protocol    = each.value[4]
    cidr_blocks = [each.value[2]]
  }
}

resource "aws_lb" "internal_lb" {
  for_each = var.lb_data
  name               = each.key
  internal           = each.value[0]
  load_balancer_type = each.value[1]
  security_groups    = [aws_security_group.nlb_security_group[each.value[2]].id]
  subnets            = var.subnet_map[each.value[3]]
}

resource "aws_lb_target_group" "internal_target_group" {
  for_each = var.target_group
  name     = each.key
  port     = each.value[0]
  protocol = each.value[1]
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "lb_listener" {
  for_each = var.listener_data
  load_balancer_arn = aws_lb.internal_lb[each.key].arn
  port              = each.value[0]
  protocol          = each.value[1]
  
  default_action {
    type             = each.value[2]
    target_group_arn = aws_lb_target_group.internal_target_group[each.value[3]].arn
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment" {
  count = length(var.ec2_private_instance_ids)

  target_group_arn = aws_lb_target_group.internal_target_group["internal-target-group"].arn
  target_id        = var.ec2_private_instance_ids[count.index]
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_public_attachment" {
  count = length(var.ec2_public_instance_ids)

  target_group_arn = aws_lb_target_group.internal_target_group["public-target-group"].arn
  target_id        = var.ec2_public_instance_ids[count.index]
  port             = 80
}
