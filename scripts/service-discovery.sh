#!/bin/bash

# Services not queried due to denial by permission boundaries
# Amazon AppStream
# You will need to check 
# Billing
# Chatbot 


managed_services=""

service_test=$(aws acm list-certificates | grep CertificateArn | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="AWS Certificate Manager Private Certificate Authority,"
fi

service_test=$(aws mq list-brokers | grep BrokerArn | wc -l)
service_test_2=$(aws mq list-configurations | grep Arn | wc -l)

if [[ "$service_test" -gt 0 || "$service_test_2" -gt 0 ]]
then
  managed_services+="Amazon MQ,"
fi

service_test=$(aws apigateway get-rest-apis | grep name | wc -l)
service_test_2=$(aws apigatewayv2 get-apis | grep Name | wc -l)

if [[ "$service_test" -gt 0 || "$service_test_2" -gt 0 ]]
then
  managed_services+="Amazon API Gateway,"
fi

service_test=$(aws apprunner list-services --region eu-west-1 | grep ServiceArn | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="AWS App Runner,"
fi

service_test=$(aws appsync list-graphql-apis | grep name | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="AWS AppSync,"
fi

service_test=$(aws athena list-work-groups | grep Name | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon Athena,"
fi

service_test=$(aws rds describe-db-clusters | grep DBClusterIdentifier | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon Aurora,"
fi

service_test=$(aws autoscaling describe-auto-scaling-groups | grep AutoScalingGroupName | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon EC2 Auto Scaling,"
fi

service_test=$(aws keyspaces list-keyspaces | grep keyspaceName | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon Keyspaces,"
fi

service_test=$(aws cloudfront list-distributions | grep ARN | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon CloudFront,"
fi

service_test=$(aws cloudhsmv2 describe-clusters | grep ClusterId | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="AWS CloudHSM,"
fi

service_test=$(aws cloudsearch describe-domains --region eu-west-1 | grep ARN | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon CloudSearch,"
fi

service_test=$(aws codebuild list-projects | wc -l)

if [ "$service_test" -gt 3 ]
then
  managed_services+="AWS CodeBuild"
fi

service_test=$(aws cognito-identity list-identity-pools --max-results 1 | grep IdentityPoolId | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon Cognito"
fi

service_test=$(aws connect list-instances | grep Arn | wc -l)

if [ "$service_test" -gt 0 ]
then
  managed_services+="Amazon Connect"
fi

service_test=$(aws eks list-clusters | wc -l)

if [ "$service_test" -gt 3 ]
then
  managed_services+="Amazon Elastic Kubernetes Service (EKS)"
fi

echo $managed_services | tr "," "\n"