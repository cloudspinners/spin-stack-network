# encoding: utf-8

title 'vpc'

deployment_identifier = attribute('deployment_identifier', default: 'unknown', description: 'Which deployment_identifier to inspect')
component = attribute('component', description: 'Which component things should be tagged')

describe aws_vpc_list do
  its('name') { should include "vpc-#{component}-#{deployment_identifier}" }
end
