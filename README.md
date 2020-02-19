# Terraform AWS API Gateway
Git repo for creating AWS API Gateway

## [Mind Map for API Gateway](https://github.com/polganesh/wiki-images/blob/master/aws/mindmap/design-new-solutions/AWS%20API%20Gateway.jpeg "Mind Map for API Gateway")


## Purpose of this Module
+ This module proivde facility to create AWS API Gateway **REST** API
+ Add predefined tags to API Gateway for monitoring and billing
+ Provide flexibility to provide resource policy in json format from outside. please also note it provide facility to inject aws account,region on the fly 

## Dependencies and Prerequisites
- Terraform version 0.12 and higher
- AWS account
- AWS CLI

## Important Variables
|variable name                         	|is required	|Default Value	|Type	| Notes       	 		                     |
|:--------------------------------------|:--------------|:------------	|:---	|:---------------------------------------------------|
|region					|N		|eu-west-1	|string	| Valid AWS Region|
|region_id				|N		|euw1		|string	| Region Identifier. for more information about this please refer following sections|
|seq_id				|N		|001|string	|usually some sequential number.  |
|environment				|N		|dev|string	|indicates name of our environment.it can be anything. Possible values dev,cit,sit,uat,pprod,prod,n. for more information refer following sections.|
|cost_centre				|N		|na|string	|A part of an organization to which bill might be charged.e.g. finance/it/hr/wholesale/retail/investment etc...|

for complete list of variables please refer variables.tf of this module.

### region
* Indicates region in which Regional API Gateway  to be created. for Edge and PRIVATE API gateway it is better to define from which region this terraform script executed.
* Possible values :- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
* e.g. for Europe ireland :- eu-west-1

### region_id
* short indicator for region
* it can be  max 5 char.
* for **eu**-**w**est-1 it is **euw1**
* for **ap**-**s**outh**e**ast-1, singapore i.e. apse1	
* please note these are indicator for ideal region_id. one can use its own standard if needed.

### cost_centre
* It represents an entity which will own cost for resources created in this module .
* Any org can have multiple departments wfollowing cost centres. following values are indicative.one can use their own indicator,but one need to follow same throughout.
* all small case letters
* length 1 to 4 chars

Possible Cost Centres	|value
---------------------	|----
admin			|admn|
infrastructure		|infra|
techsupport		|tsup|
hr			|hr|
it			|it|
legal			|lgl|
finance			|fin|
wholesale		|whsl|
retail			|rtl|
manufacturing		|mfg|
banking			|bank|
investment		|inv|
marketing		|mkt|

### environment
* It represents the environment for which this resource created for. 
* length 1 to 3 chars
* all small case letters
* Possible values

Value  | Important Note
------------- | -------------
dev  | 	for **Dev**elopment environment
cit  | 	specific to **C**omponent **I**ntegration **T**esting
sit  | 	specific to **S**ystem **I**ntegration **T**esting
uat  | 	specific to **U**ser **A**cceptance **T**esting
pre  | 	specific to **Pre**prod environment
n    |	VPC which is **not** for production env
p    |	VPC for **P**roduction environment


## Important Notes for Tags
This module add/override  following tags to various resources created.

|Tag Key   	| Variable 	|Notes												|
|:--------------|:--------------|:----------------------------------------------------------------------------------------------|
|RegionId  	|region_id 	|Represent indicator for region in which resource present					|
|Environment  	|environment 	|Represent Environment. 										|
|CostCentre  	|cost_centre 	|some predefined, unique identifier across org for identifying entity responsible for cost.	|
|VersionId  	|version_id 	|it is less signficant,but if anyone want to track it is good idea|
|BuildDate  	|build_date 	|it is less signficant,but if someone wants to track date(predefine date format defined in your org) then it is good indicator for date on which this component/resource created/updated|
|AppRole  	| 	|it is constant with value **network** for various resources created by this module.|
|AppService|app_service|application service for which this API Gateway created.|

## Examples
### Example for creating Private API Gateway

```
module "simple-api-gw" {
  source="git::https://github.com/polganesh/terraform-aws-api-gateway.git"
  region               = "eu-central-1"
  region_id            = "euc1"
  seq_id               = "001"
  environment          = "n"
  cost_centre          = "infra"
  build_date           = "14022020"
  version_id           = "001"
  app_service          = "myapp"
  api_description      = "API Resource for testing"
  end_point_type       = ["PRIVATE"]
  vpc_endpoint_ids     = ["XXXX", "yyyyy"]
  policy_file_location = "/init/api-gw-access-policy.json"

}
```



