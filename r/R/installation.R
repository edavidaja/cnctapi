#' Create a new Installation
#'
#' @description
#' The installation object represents an instance of an interpreter within an execution environment.
#'
#' @docType class
#' @title Installation
#' @description Installation Class
#' @format An \code{R6Class} generator object
#' @field path The absolute path to the interpreter's executable. character [optional]
#' @field version The semantic version of the interpreter. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Installation <- R6::R6Class(
  "Installation",
  public = list(
    `path` = NULL,
    `version` = NULL,
    #' Initialize a new Installation class.
    #'
    #' @description
    #' Initialize a new Installation class.
    #'
    #' @param path The absolute path to the interpreter's executable.
    #' @param version The semantic version of the interpreter.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`path` = NULL, `version` = NULL, ...) {
      if (!is.null(`path`)) {
        if (!(is.character(`path`) && length(`path`) == 1)) {
          stop(paste("Error! Invalid data for `path`. Must be a string:", `path`))
        }
        self$`path` <- `path`
      }
      if (!is.null(`version`)) {
        if (!(is.character(`version`) && length(`version`) == 1)) {
          stop(paste("Error! Invalid data for `version`. Must be a string:", `version`))
        }
        self$`version` <- `version`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Installation in JSON format
    #' @export
    toJSON = function() {
      InstallationObject <- list()
      if (!is.null(self$`path`)) {
        InstallationObject[["path"]] <-
          self$`path`
      }
      if (!is.null(self$`version`)) {
        InstallationObject[["version"]] <-
          self$`version`
      }
      InstallationObject
    },
    #' Deserialize JSON string into an instance of Installation
    #'
    #' @description
    #' Deserialize JSON string into an instance of Installation
    #'
    #' @param input_json the JSON input
    #' @return the instance of Installation
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`path`)) {
        self$`path` <- this_object$`path`
      }
      if (!is.null(this_object$`version`)) {
        self$`version` <- this_object$`version`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Installation in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`path`)) {
          sprintf(
          '"path":
            "%s"
                    ',
          self$`path`
          )
        },
        if (!is.null(self$`version`)) {
          sprintf(
          '"version":
            "%s"
                    ',
          self$`version`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Installation
    #'
    #' @description
    #' Deserialize JSON string into an instance of Installation
    #'
    #' @param input_json the JSON input
    #' @return the instance of Installation
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`path` <- this_object$`path`
      self$`version` <- this_object$`version`
      self
    },
    #' Validate JSON input with respect to Installation
    #'
    #' @description
    #' Validate JSON input with respect to Installation and throw an exception if invalid
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
    #' @return String representation of Installation
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
# Installation$unlock()
#
## Below is an example to define the print function
# Installation$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Installation$lock()

