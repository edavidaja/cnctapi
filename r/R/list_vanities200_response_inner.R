#' Create a new ListVanities200ResponseInner
#'
#' @description
#' The fields that are returned when getting or listing vanity URLs.
#'
#' @docType class
#' @title ListVanities200ResponseInner
#' @description ListVanities200ResponseInner Class
#' @format An \code{R6Class} generator object
#' @field path The URL path that will be used by this application. HTTP requests to this path on the Connect server will be routed to the associated content item. character [optional]
#' @field content_guid The unique identifier of the associated content item. character [optional]
#' @field created_time The timestamp (RFC3339) indicating when this vanity URL was created. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ListVanities200ResponseInner <- R6::R6Class(
  "ListVanities200ResponseInner",
  public = list(
    `path` = NULL,
    `content_guid` = NULL,
    `created_time` = NULL,
    #' Initialize a new ListVanities200ResponseInner class.
    #'
    #' @description
    #' Initialize a new ListVanities200ResponseInner class.
    #'
    #' @param path The URL path that will be used by this application. HTTP requests to this path on the Connect server will be routed to the associated content item.
    #' @param content_guid The unique identifier of the associated content item.
    #' @param created_time The timestamp (RFC3339) indicating when this vanity URL was created.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`path` = NULL, `content_guid` = NULL, `created_time` = NULL, ...) {
      if (!is.null(`path`)) {
        if (!(is.character(`path`) && length(`path`) == 1)) {
          stop(paste("Error! Invalid data for `path`. Must be a string:", `path`))
        }
        self$`path` <- `path`
      }
      if (!is.null(`content_guid`)) {
        if (!(is.character(`content_guid`) && length(`content_guid`) == 1)) {
          stop(paste("Error! Invalid data for `content_guid`. Must be a string:", `content_guid`))
        }
        self$`content_guid` <- `content_guid`
      }
      if (!is.null(`created_time`)) {
        if (!is.character(`created_time`)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", `created_time`))
        }
        self$`created_time` <- `created_time`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return ListVanities200ResponseInner in JSON format
    #' @export
    toJSON = function() {
      ListVanities200ResponseInnerObject <- list()
      if (!is.null(self$`path`)) {
        ListVanities200ResponseInnerObject[["path"]] <-
          self$`path`
      }
      if (!is.null(self$`content_guid`)) {
        ListVanities200ResponseInnerObject[["content_guid"]] <-
          self$`content_guid`
      }
      if (!is.null(self$`created_time`)) {
        ListVanities200ResponseInnerObject[["created_time"]] <-
          self$`created_time`
      }
      ListVanities200ResponseInnerObject
    },
    #' Deserialize JSON string into an instance of ListVanities200ResponseInner
    #'
    #' @description
    #' Deserialize JSON string into an instance of ListVanities200ResponseInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of ListVanities200ResponseInner
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`path`)) {
        self$`path` <- this_object$`path`
      }
      if (!is.null(this_object$`content_guid`)) {
        self$`content_guid` <- this_object$`content_guid`
      }
      if (!is.null(this_object$`created_time`)) {
        self$`created_time` <- this_object$`created_time`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return ListVanities200ResponseInner in JSON format
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
        if (!is.null(self$`content_guid`)) {
          sprintf(
          '"content_guid":
            "%s"
                    ',
          self$`content_guid`
          )
        },
        if (!is.null(self$`created_time`)) {
          sprintf(
          '"created_time":
            "%s"
                    ',
          self$`created_time`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of ListVanities200ResponseInner
    #'
    #' @description
    #' Deserialize JSON string into an instance of ListVanities200ResponseInner
    #'
    #' @param input_json the JSON input
    #' @return the instance of ListVanities200ResponseInner
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`path` <- this_object$`path`
      self$`content_guid` <- this_object$`content_guid`
      self$`created_time` <- this_object$`created_time`
      self
    },
    #' Validate JSON input with respect to ListVanities200ResponseInner
    #'
    #' @description
    #' Validate JSON input with respect to ListVanities200ResponseInner and throw an exception if invalid
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
    #' @return String representation of ListVanities200ResponseInner
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
# ListVanities200ResponseInner$unlock()
#
## Below is an example to define the print function
# ListVanities200ResponseInner$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# ListVanities200ResponseInner$lock()

