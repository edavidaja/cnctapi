#' Create a new LoggedError
#'
#' @description
#' LoggedError Class
#'
#' @docType class
#' @title LoggedError
#' @description LoggedError Class
#' @format An \code{R6Class} generator object
#' @field code The error code. character [optional]
#' @field summary Summary of the error. character [optional]
#' @field help_url A help URL with further information about the error. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LoggedError <- R6::R6Class(
  "LoggedError",
  public = list(
    `code` = NULL,
    `summary` = NULL,
    `help_url` = NULL,
    #' Initialize a new LoggedError class.
    #'
    #' @description
    #' Initialize a new LoggedError class.
    #'
    #' @param code The error code.
    #' @param summary Summary of the error.
    #' @param help_url A help URL with further information about the error.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`code` = NULL, `summary` = NULL, `help_url` = NULL, ...) {
      if (!is.null(`code`)) {
        if (!(is.character(`code`) && length(`code`) == 1)) {
          stop(paste("Error! Invalid data for `code`. Must be a string:", `code`))
        }
        self$`code` <- `code`
      }
      if (!is.null(`summary`)) {
        if (!(is.character(`summary`) && length(`summary`) == 1)) {
          stop(paste("Error! Invalid data for `summary`. Must be a string:", `summary`))
        }
        self$`summary` <- `summary`
      }
      if (!is.null(`help_url`)) {
        if (!(is.character(`help_url`) && length(`help_url`) == 1)) {
          stop(paste("Error! Invalid data for `help_url`. Must be a string:", `help_url`))
        }
        self$`help_url` <- `help_url`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LoggedError in JSON format
    #' @export
    toJSON = function() {
      LoggedErrorObject <- list()
      if (!is.null(self$`code`)) {
        LoggedErrorObject[["code"]] <-
          self$`code`
      }
      if (!is.null(self$`summary`)) {
        LoggedErrorObject[["summary"]] <-
          self$`summary`
      }
      if (!is.null(self$`help_url`)) {
        LoggedErrorObject[["help_url"]] <-
          self$`help_url`
      }
      LoggedErrorObject
    },
    #' Deserialize JSON string into an instance of LoggedError
    #'
    #' @description
    #' Deserialize JSON string into an instance of LoggedError
    #'
    #' @param input_json the JSON input
    #' @return the instance of LoggedError
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`code`)) {
        self$`code` <- this_object$`code`
      }
      if (!is.null(this_object$`summary`)) {
        self$`summary` <- this_object$`summary`
      }
      if (!is.null(this_object$`help_url`)) {
        self$`help_url` <- this_object$`help_url`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LoggedError in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`code`)) {
          sprintf(
          '"code":
            "%s"
                    ',
          self$`code`
          )
        },
        if (!is.null(self$`summary`)) {
          sprintf(
          '"summary":
            "%s"
                    ',
          self$`summary`
          )
        },
        if (!is.null(self$`help_url`)) {
          sprintf(
          '"help_url":
            "%s"
                    ',
          self$`help_url`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of LoggedError
    #'
    #' @description
    #' Deserialize JSON string into an instance of LoggedError
    #'
    #' @param input_json the JSON input
    #' @return the instance of LoggedError
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`code` <- this_object$`code`
      self$`summary` <- this_object$`summary`
      self$`help_url` <- this_object$`help_url`
      self
    },
    #' Validate JSON input with respect to LoggedError
    #'
    #' @description
    #' Validate JSON input with respect to LoggedError and throw an exception if invalid
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
    #' @return String representation of LoggedError
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
# LoggedError$unlock()
#
## Below is an example to define the print function
# LoggedError$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LoggedError$lock()

