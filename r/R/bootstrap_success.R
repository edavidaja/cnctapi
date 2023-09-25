#' Create a new BootstrapSuccess
#'
#' @description
#' BootstrapSuccess Class
#'
#' @docType class
#' @title BootstrapSuccess
#' @description BootstrapSuccess Class
#' @format An \code{R6Class} generator object
#' @field api_key The API key for the newly created administrator user. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BootstrapSuccess <- R6::R6Class(
  "BootstrapSuccess",
  public = list(
    `api_key` = NULL,
    #' Initialize a new BootstrapSuccess class.
    #'
    #' @description
    #' Initialize a new BootstrapSuccess class.
    #'
    #' @param api_key The API key for the newly created administrator user.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`api_key` = NULL, ...) {
      if (!is.null(`api_key`)) {
        if (!(is.character(`api_key`) && length(`api_key`) == 1)) {
          stop(paste("Error! Invalid data for `api_key`. Must be a string:", `api_key`))
        }
        self$`api_key` <- `api_key`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BootstrapSuccess in JSON format
    #' @export
    toJSON = function() {
      BootstrapSuccessObject <- list()
      if (!is.null(self$`api_key`)) {
        BootstrapSuccessObject[["api_key"]] <-
          self$`api_key`
      }
      BootstrapSuccessObject
    },
    #' Deserialize JSON string into an instance of BootstrapSuccess
    #'
    #' @description
    #' Deserialize JSON string into an instance of BootstrapSuccess
    #'
    #' @param input_json the JSON input
    #' @return the instance of BootstrapSuccess
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`api_key`)) {
        self$`api_key` <- this_object$`api_key`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BootstrapSuccess in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`api_key`)) {
          sprintf(
          '"api_key":
            "%s"
                    ',
          self$`api_key`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of BootstrapSuccess
    #'
    #' @description
    #' Deserialize JSON string into an instance of BootstrapSuccess
    #'
    #' @param input_json the JSON input
    #' @return the instance of BootstrapSuccess
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`api_key` <- this_object$`api_key`
      self
    },
    #' Validate JSON input with respect to BootstrapSuccess
    #'
    #' @description
    #' Validate JSON input with respect to BootstrapSuccess and throw an exception if invalid
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
    #' @return String representation of BootstrapSuccess
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
# BootstrapSuccess$unlock()
#
## Below is an example to define the print function
# BootstrapSuccess$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# BootstrapSuccess$lock()

