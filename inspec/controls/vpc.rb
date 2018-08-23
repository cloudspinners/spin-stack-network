# encoding: utf-8

title 'vpc'

stack_instance_id = attribute('stack_instance_id', description: 'Which stack to test')

describe aws_vpc_list do
  its('name') { should include "vpc-networking-#{stack_instance_id}" }
end
