# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test EnvironmentsApi")

api_instance <- EnvironmentsApi$new()

test_that("CreateEnvironment", {
  # tests for CreateEnvironment
  # base path: /__api__
  # Create execution environment
  # Create a new execution environment.  You must have administrator privileges to perform this action.
  # @param environment CreateEnvironmentInput The request body required when creating a new execution environment.
  # @return [Environment]

  # uncomment below to test the operation
  #expect_equal(result, "EXPECTED_RESULT")
})

test_that("DeleteEnvironment", {
  # tests for DeleteEnvironment
  # base path: /__api__
  # Delete an execution environment
  # Delete a specific execution environment.  You must have administrator privileges to perform this action.
  # @param guid character The unique identifier of the desired environment.
  # @return [Void]

  # uncomment below to test the operation
  #expect_equal(result, "EXPECTED_RESULT")
})

test_that("GetEnvironment", {
  # tests for GetEnvironment
  # base path: /__api__
  # Get execution environment details
  # Get detailed information about a specific execution environment.  You must have administrator or publisher privileges to perform this action.
  # @param guid character The unique identifier of the desired environment.
  # @return [Environment]

  # uncomment below to test the operation
  #expect_equal(result, "EXPECTED_RESULT")
})

test_that("ListEnvironments", {
  # tests for ListEnvironments
  # base path: /__api__
  # List execution environments
  # List all execution environments available to Posit Connect.  You must have administrator or publisher privileges to perform this action.
  # @return [array[Environment]]

  # uncomment below to test the operation
  #expect_equal(result, "EXPECTED_RESULT")
})

test_that("UpdateEnvironment", {
  # tests for UpdateEnvironment
  # base path: /__api__
  # Update an execution environment
  # Update a specific execution environment.  You must have administrator privileges to perform this action.
  # @param guid character The unique identifier of the desired environment.
  # @param environment UpdateEnvironmentInput The request body required when creating a new execution environment.
  # @return [Environment]

  # uncomment below to test the operation
  #expect_equal(result, "EXPECTED_RESULT")
})
