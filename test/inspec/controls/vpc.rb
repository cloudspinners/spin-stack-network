# encoding: utf-8

title 'vpc'

instance_identifier = attribute('instance_identifier', description: 'Which stack to test')

describe aws_vpc_list do
  its('name') { should include "vpc-#{instance_identifier}" }
end
