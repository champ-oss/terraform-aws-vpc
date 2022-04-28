package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

// TestExamplesComplete tests a typical deployment of this module
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{TerraformDir: "../../examples/complete"}
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApplyAndIdempotent(t, terraformOptions)

	// Validate 2 public and 2 private subnets
	assert.Len(t, terraform.OutputList(t, terraformOptions, "all_subnets_ids"), 4)
	assert.Len(t, terraform.OutputList(t, terraformOptions, "public_subnets_ids"), 2)
	assert.Len(t, terraform.OutputList(t, terraformOptions, "private_subnets_ids"), 2)

	// Validate 1 public and 2 private route tables
	assert.Len(t, terraform.OutputList(t, terraformOptions, "all_route_table_ids"), 3)
	assert.Len(t, terraform.OutputList(t, terraformOptions, "private_route_table_ids"), 2)

	// Validate 2 public NAT IPs
	assert.Len(t, terraform.OutputList(t, terraformOptions, "nat_public_ips"), 2)
}
