#' Create a new EnvironmentVariable
#'
#' @description
#' Defines an environment variable and its value.
#'
#' @docType class
#' @title EnvironmentVariable
#' @description EnvironmentVariable Class
#' @format An \code{R6Class} generator object
#' @field name Name of the environment variable. character [optional]
#' @field value New value of the environment variable. A value of `null` will delete the environment variable. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EnvironmentVariable <- R6::R6Class(
  "EnvironmentVariable",
  public = list(
    `name` = NULL,
    `value` = NULL,
    #' Initialize a new EnvironmentVariable class.
    #'
    #' @description
    #' Initialize a new EnvironmentVariable class.
    #'
    #' @param name Name of the environment variable.
    #' @param value New value of the environment variable. A value of `null` will delete the environment variable.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name` = NULL, `value` = NULL, ...) {
      if (!is.null(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`value`)) {
        if (!(is.character(`value`) && length(`value`) == 1)) {
          stop(paste("Error! Invalid data for `value`. Must be a string:", `value`))
        }
        self$`value` <- `value`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return EnvironmentVariable in JSON format
    #' @export
    toJSON = function() {
      EnvironmentVariableObject <- list()
      if (!is.null(self$`name`)) {
        EnvironmentVariableObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`value`)) {
        EnvironmentVariableObject[["value"]] <-
          self$`value`
      }
      EnvironmentVariableObject
    },
    #' Deserialize JSON string into an instance of EnvironmentVariable
    #'
    #' @description
    #' Deserialize JSON string into an instance of EnvironmentVariable
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnvironmentVariable
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`value`)) {
        self$`value` <- this_object$`value`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return EnvironmentVariable in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`name`)) {
          sprintf(
          '"name":
            "%s"
                    ',
          self$`name`
          )
        },
        if (!is.null(self$`value`)) {
          sprintf(
          '"value":
            "%s"
                    ',
          self$`value`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of EnvironmentVariable
    #'
    #' @description
    #' Deserialize JSON string into an instance of EnvironmentVariable
    #'
    #' @param input_json the JSON input
    #' @return the instance of EnvironmentVariable
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`name` <- this_object$`name`
      self$`value` <- this_object$`value`
      self
    },
    #' Validate JSON input with respect to EnvironmentVariable
    #'
    #' @description
    #' Validate JSON input with respect to EnvironmentVariable and throw an exception if invalid
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
    #' @return String representation of EnvironmentVariable
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
# EnvironmentVariable$unlock()
#
## Below is an example to define the print function
# EnvironmentVariable$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EnvironmentVariable$lock()

