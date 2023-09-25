#' Create a new CreateEnvironmentInputPython
#'
#' @description
#' The available Python installations in this environment.
#'
#' @docType class
#' @title CreateEnvironmentInputPython
#' @description CreateEnvironmentInputPython Class
#' @format An \code{R6Class} generator object
#' @field installations  list(\link{Installation}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreateEnvironmentInputPython <- R6::R6Class(
  "CreateEnvironmentInputPython",
  public = list(
    `installations` = NULL,
    #' Initialize a new CreateEnvironmentInputPython class.
    #'
    #' @description
    #' Initialize a new CreateEnvironmentInputPython class.
    #'
    #' @param installations installations
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`installations` = NULL, ...) {
      if (!is.null(`installations`)) {
        stopifnot(is.vector(`installations`), length(`installations`) != 0)
        sapply(`installations`, function(x) stopifnot(R6::is.R6(x)))
        self$`installations` <- `installations`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateEnvironmentInputPython in JSON format
    #' @export
    toJSON = function() {
      CreateEnvironmentInputPythonObject <- list()
      if (!is.null(self$`installations`)) {
        CreateEnvironmentInputPythonObject[["installations"]] <-
          lapply(self$`installations`, function(x) x$toJSON())
      }
      CreateEnvironmentInputPythonObject
    },
    #' Deserialize JSON string into an instance of CreateEnvironmentInputPython
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateEnvironmentInputPython
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateEnvironmentInputPython
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`installations`)) {
        self$`installations` <- ApiClient$new()$deserializeObj(this_object$`installations`, "array[Installation]", loadNamespace("connectapi2"))
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateEnvironmentInputPython in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`installations`)) {
          sprintf(
          '"installations":
          [%s]
',
          paste(sapply(self$`installations`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of CreateEnvironmentInputPython
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateEnvironmentInputPython
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateEnvironmentInputPython
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`installations` <- ApiClient$new()$deserializeObj(this_object$`installations`, "array[Installation]", loadNamespace("connectapi2"))
      self
    },
    #' Validate JSON input with respect to CreateEnvironmentInputPython
    #'
    #' @description
    #' Validate JSON input with respect to CreateEnvironmentInputPython and throw an exception if invalid
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
    #' @return String representation of CreateEnvironmentInputPython
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
# CreateEnvironmentInputPython$unlock()
#
## Below is an example to define the print function
# CreateEnvironmentInputPython$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreateEnvironmentInputPython$lock()

