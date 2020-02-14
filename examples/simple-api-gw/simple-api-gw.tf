module "simple-api-gw"{
	source="../../"
	region="eu-central-1"
	region_id="euc1"
	seq_id="001"
	environment="n"
	cost_centre="infra"
	build_date="14022020"
	version_id="001"
	api_description="API Resource for testing"
	end_point_type=["REGIONAL"]
}

