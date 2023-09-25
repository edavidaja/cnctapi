#' Create a new BuildContentBundleRequest
#'
#' @description
#' Optionally identifies the target build bundle.
#'
#' @docType class
#' @title BuildContentBundleRequest
#' @description BuildContentBundleRequest Class
#' @format An \code{R6Class} generator object
#' @field bundle_id  character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BuildContentBundleRequest <- R6::R6Class(
  "BuildContentBundleRequest",
  public = list(
    `bundle_id` = NULL,
    #' Initialize a new BuildContentBundleRequest class.
    #'
    #' @description
    #' Initialize a new BuildContentBundleRequest class.
    #'
    #' @param bundle_id bundle_id
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`bundle_id` = NULL, ...) {
      if (!is.null(`bundle_id`)) {
        if (!(is.character(`bundle_id`) && length(`bundle_id`) == 1)) {
          stop(paste("Error! Invalid data for `bundle_id`. Must be a string:", `bundle_id`))
        }
        self$`bundle_id` <- `bundle_id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BuildContentBundleRequest in JSON format
    #' @export
    toJSON = function() {
      BuildContentBundleRequestObject <- list()
      if (!is.null(self$`bundle_id`)) {
        BuildContentBundleRequestObject[["bundle_id"]] <-
          self$`bundle_id`
      }
      BuildContentBundleRequestObject
    },
    #' Deserialize JSON string into an instance of BuildContentBundleRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of BuildContentBundleRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of BuildContentBundleRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`bundle_id`)) {
        self$`bundle_id` <- this_object$`bundle_id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BuildContentBundleRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`bundle_id`)) {
          sprintf(
          '"bundle_id":
            "%s"
                    ',
          self$`bundle_id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of BuildContentBundleRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of BuildContentBundleRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of BuildContentBundleRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`bundle_id` <- this_object$`bundle_id`
      self
    },
    #' Validate JSON input with respect to BuildContentBundleRequest
    #'
    #' @description
    #' Validate JSON input with respect to BuildContentBundleRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of BuildContentBundleRequest
    #' @export
    toString = function() {
      self$toJSONString()
    },
    #' Return true if the values in all fields are valid.
    #'
    #' @description
    #' Return true if the values in all fields are valid.
    #'
    #' @return true if the values in all fields are valid.
    #' @export
    isValid = function() {
      TRUE
    },
    #' Return a list of invalid fields (if any).
    #'
    #' @description
    #' Return a list of invalid fields (if any).
    #'
    #' @return A list of invalid fields (if any).
    #' @export
    getInvalidFields = function() {
      invalid_fields <- list()
      invalid_fields
    },
    #' Print the object
    #'
    #' @description
    #' Print the object
    #'
    #' @export
    print = function() {
      print(jsonlite::prettify(self$toJSONString()))
      invisible(self)
    }
  ),
  # Lock the class to prevent modifications to the method or field
  lock_class = TRUE
)
## Uncomment below to unlock the class to allow modifications of the method or field
# BuildContentBundleRequest$unlock()
#
## Below is an example to define the print function
# BuildContentBundleRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# BuildContentBundleRequest$lock()

