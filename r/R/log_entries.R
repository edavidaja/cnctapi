#' Create a new LogEntries
#'
#' @description
#' LogEntries Class
#'
#' @docType class
#' @title LogEntries
#' @description LogEntries Class
#' @format An \code{R6Class} generator object
#' @field entries  list(\link{LogEntry}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LogEntries <- R6::R6Class(
  "LogEntries",
  public = list(
    `entries` = NULL,
    #' Initialize a new LogEntries class.
    #'
    #' @description
    #' Initialize a new LogEntries class.
    #'
    #' @param entries entries
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`entries` = NULL, ...) {
      if (!is.null(`entries`)) {
        stopifnot(is.vector(`entries`), length(`entries`) != 0)
        sapply(`entries`, function(x) stopifnot(R6::is.R6(x)))
        self$`entries` <- `entries`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LogEntries in JSON format
    #' @export
    toJSON = function() {
      LogEntriesObject <- list()
      if (!is.null(self$`entries`)) {
        LogEntriesObject[["entries"]] <-
          lapply(self$`entries`, function(x) x$toJSON())
      }
      LogEntriesObject
    },
    #' Deserialize JSON string into an instance of LogEntries
    #'
    #' @description
    #' Deserialize JSON string into an instance of LogEntries
    #'
    #' @param input_json the JSON input
    #' @return the instance of LogEntries
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`entries`)) {
        self$`entries` <- ApiClient$new()$deserializeObj(this_object$`entries`, "array[LogEntry]", loadNamespace("connectapi2"))
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LogEntries in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`entries`)) {
          sprintf(
          '"entries":
          [%s]
',
          paste(sapply(self$`entries`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of LogEntries
    #'
    #' @description
    #' Deserialize JSON string into an instance of LogEntries
    #'
    #' @param input_json the JSON input
    #' @return the instance of LogEntries
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`entries` <- ApiClient$new()$deserializeObj(this_object$`entries`, "array[LogEntry]", loadNamespace("connectapi2"))
      self
    },
    #' Validate JSON input with respect to LogEntries
    #'
    #' @description
    #' Validate JSON input with respect to LogEntries and throw an exception if invalid
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
    #' @return String representation of LogEntries
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
# LogEntries$unlock()
#
## Below is an example to define the print function
# LogEntries$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LogEntries$lock()

