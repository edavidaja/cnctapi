# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate

context("Test CreateEnvironmentInput")

model_instance <- CreateEnvironmentInput$new()

test_that("title", {
  # tests for the property `title` (character)
  # A human readable title for this environment.

  # uncomment below to test the property
  #expect_equal(model.instance$`title`, "EXPECTED_RESULT")
})

test_that("description", {
  # tests for the property `description` (character)
  # A human readable description of this environment.

  # uncomment below to test the property
  #expect_equal(model.instance$`description`, "EXPECTED_RESULT")
})

test_that("cluster_name", {
  # tests for the property `cluster_name` (character)
  # The cluster identifier for this environment.   The value must be \&quot;Kubernetes\&quot; when Off Host Execution is enabled.

  # uncomment below to test the property
  #expect_equal(model.instance$`cluster_name`, "EXPECTED_RESULT")
})

test_that("name", {
  # tests for the property `name` (character)
  # The container image that will be used when executing content with this environment.

  # uncomment below to test the property
  #expect_equal(model.instance$`name`, "EXPECTED_RESULT")
})

test_that("matching", {
  # tests for the property `matching` (character)
  # This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  &#x60;any&#x60; (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle&#39;s manifest.  &#x60;exact&#x60; indicates the image must be explicitly asked for in the bundle&#39;s manifest.  &#x60;none&#x60; indicates that the image should never be selected by Posit Connect.

  # uncomment below to test the property
  #expect_equal(model.instance$`matching`, "EXPECTED_RESULT")
})

test_that("supervisor", {
  # tests for the property `supervisor` (character)
  # The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment.

  # uncomment below to test the property
  #expect_equal(model.instance$`supervisor`, "EXPECTED_RESULT")
})

test_that("python", {
  # tests for the property `python` (CreateEnvironmentInputPython)

  # uncomment below to test the property
  #expect_equal(model.instance$`python`, "EXPECTED_RESULT")
})

test_that("quarto", {
  # tests for the property `quarto` (CreateEnvironmentInputQuarto)

  # uncomment below to test the property
  #expect_equal(model.instance$`quarto`, "EXPECTED_RESULT")
})

test_that("r", {
  # tests for the property `r` (CreateEnvironmentInputR)

  # uncomment below to test the property
  #expect_equal(model.instance$`r`, "EXPECTED_RESULT")
})
