# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test UpdateContentPermissionRequest")

model_instance <- UpdateContentPermissionRequest$new()

test_that("principal_guid", {
  # tests for the property `principal_guid` (character)
  # The identifier of the principal (user or group).

  # uncomment below to test the property
  #expect_equal(model.instance$`principal_guid`, "EXPECTED_RESULT")
})

test_that("principal_type", {
  # tests for the property `principal_type` (character)
  # The type of principal.

  # uncomment below to test the property
  #expect_equal(model.instance$`principal_type`, "EXPECTED_RESULT")
})

test_that("role", {
  # tests for the property `role` (character)
  # The level of access that the principal has been given to this content item.

  # uncomment below to test the property
  #expect_equal(model.instance$`role`, "EXPECTED_RESULT")
})
