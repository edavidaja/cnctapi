#' Create a new RuntimeCaches
#'
#' @description
#' An object containing an array of runtime caches.
#'
#' @docType class
#' @title RuntimeCaches
#' @description RuntimeCaches Class
#' @format An \code{R6Class} generator object
#' @field caches  list(\link{RuntimeCache}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
RuntimeCaches <- R6::R6Class(
  "RuntimeCaches",
  public = list(
    `caches` = NULL,
    #' Initialize a new RuntimeCaches class.
    #'
    #' @description
    #' Initialize a new RuntimeCaches class.
    #'
    #' @param caches caches
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`caches` = NULL, ...) {
      if (!is.null(`caches`)) {
        stopifnot(is.vector(`caches`), length(`caches`) != 0)
        sapply(`caches`, function(x) stopifnot(R6::is.R6(x)))
        self$`caches` <- `caches`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return RuntimeCaches in JSON format
    #' @export
    toJSON = function() {
      RuntimeCachesObject <- list()
      if (!is.null(self$`caches`)) {
        RuntimeCachesObject[["caches"]] <-
          lapply(self$`caches`, function(x) x$toJSON())
      }
      RuntimeCachesObject
    },
    #' Deserialize JSON string into an instance of RuntimeCaches
    #'
    #' @description
    #' Deserialize JSON string into an instance of RuntimeCaches
    #'
    #' @param input_json the JSON input
    #' @return the instance of RuntimeCaches
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`caches`)) {
        self$`caches` <- ApiClient$new()$deserializeObj(this_object$`caches`, "array[RuntimeCache]", loadNamespace("connectapi2"))
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return RuntimeCaches in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`caches`)) {
          sprintf(
          '"caches":
          [%s]
',
          paste(sapply(self$`caches`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of RuntimeCaches
    #'
    #' @description
    #' Deserialize JSON string into an instance of RuntimeCaches
    #'
    #' @param input_json the JSON input
    #' @return the instance of RuntimeCaches
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`caches` <- ApiClient$new()$deserializeObj(this_object$`caches`, "array[RuntimeCache]", loadNamespace("connectapi2"))
      self
    },
    #' Validate JSON input with respect to RuntimeCaches
    #'
    #' @description
    #' Validate JSON input with respect to RuntimeCaches and throw an exception if invalid
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
    #' @return String representation of RuntimeCaches
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
# RuntimeCaches$unlock()
#
## Below is an example to define the print function
# RuntimeCaches$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# RuntimeCaches$lock()

