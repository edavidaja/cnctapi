#' Create a new LogEntry
#'
#' @description
#' LogEntry Class
#'
#' @docType class
#' @title LogEntry
#' @description LogEntry Class
#' @format An \code{R6Class} generator object
#' @field source The source of the log entry. `stdout` or `stderr`. character [optional]
#' @field timestamp The timestamp (RFC3339) indicating when this log entry was recorded. character [optional]
#' @field data The log entry content. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LogEntry <- R6::R6Class(
  "LogEntry",
  public = list(
    `source` = NULL,
    `timestamp` = NULL,
    `data` = NULL,
    #' Initialize a new LogEntry class.
    #'
    #' @description
    #' Initialize a new LogEntry class.
    #'
    #' @param source The source of the log entry. `stdout` or `stderr`.
    #' @param timestamp The timestamp (RFC3339) indicating when this log entry was recorded.
    #' @param data The log entry content.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`source` = NULL, `timestamp` = NULL, `data` = NULL, ...) {
      if (!is.null(`source`)) {
        if (!(is.character(`source`) && length(`source`) == 1)) {
          stop(paste("Error! Invalid data for `source`. Must be a string:", `source`))
        }
        self$`source` <- `source`
      }
      if (!is.null(`timestamp`)) {
        if (!is.character(`timestamp`)) {
          stop(paste("Error! Invalid data for `timestamp`. Must be a string:", `timestamp`))
        }
        self$`timestamp` <- `timestamp`
      }
      if (!is.null(`data`)) {
        if (!(is.character(`data`) && length(`data`) == 1)) {
          stop(paste("Error! Invalid data for `data`. Must be a string:", `data`))
        }
        self$`data` <- `data`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LogEntry in JSON format
    #' @export
    toJSON = function() {
      LogEntryObject <- list()
      if (!is.null(self$`source`)) {
        LogEntryObject[["source"]] <-
          self$`source`
      }
      if (!is.null(self$`timestamp`)) {
        LogEntryObject[["timestamp"]] <-
          self$`timestamp`
      }
      if (!is.null(self$`data`)) {
        LogEntryObject[["data"]] <-
          self$`data`
      }
      LogEntryObject
    },
    #' Deserialize JSON string into an instance of LogEntry
    #'
    #' @description
    #' Deserialize JSON string into an instance of LogEntry
    #'
    #' @param input_json the JSON input
    #' @return the instance of LogEntry
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`source`)) {
        self$`source` <- this_object$`source`
      }
      if (!is.null(this_object$`timestamp`)) {
        self$`timestamp` <- this_object$`timestamp`
      }
      if (!is.null(this_object$`data`)) {
        self$`data` <- this_object$`data`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LogEntry in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`source`)) {
          sprintf(
          '"source":
            "%s"
                    ',
          self$`source`
          )
        },
        if (!is.null(self$`timestamp`)) {
          sprintf(
          '"timestamp":
            "%s"
                    ',
          self$`timestamp`
          )
        },
        if (!is.null(self$`data`)) {
          sprintf(
          '"data":
            "%s"
                    ',
          self$`data`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of LogEntry
    #'
    #' @description
    #' Deserialize JSON string into an instance of LogEntry
    #'
    #' @param input_json the JSON input
    #' @return the instance of LogEntry
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`source` <- this_object$`source`
      self$`timestamp` <- this_object$`timestamp`
      self$`data` <- this_object$`data`
      self
    },
    #' Validate JSON input with respect to LogEntry
    #'
    #' @description
    #' Validate JSON input with respect to LogEntry and throw an exception if invalid
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
    #' @return String representation of LogEntry
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
# LogEntry$unlock()
#
## Below is an example to define the print function
# LogEntry$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LogEntry$lock()

