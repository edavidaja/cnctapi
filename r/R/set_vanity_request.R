#' Create a new SetVanityRequest
#'
#' @description
#' The fields that can be specified when creating a vanity URL.
#'
#' @docType class
#' @title SetVanityRequest
#' @description SetVanityRequest Class
#' @format An \code{R6Class} generator object
#' @field path The URL path that will be assigned to this content item. HTTP requests to this path on the Connect server will be routed to the associated content item. character [optional]
#' @field force If true, and a vanity URL exists with the specified path, reassign it to the specified content item. To reassign a vanity URL, you must be an administrator, or a collaborator/owner of both content items. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SetVanityRequest <- R6::R6Class(
  "SetVanityRequest",
  public = list(
    `path` = NULL,
    `force` = NULL,
    #' Initialize a new SetVanityRequest class.
    #'
    #' @description
    #' Initialize a new SetVanityRequest class.
    #'
    #' @param path The URL path that will be assigned to this content item. HTTP requests to this path on the Connect server will be routed to the associated content item.
    #' @param force If true, and a vanity URL exists with the specified path, reassign it to the specified content item. To reassign a vanity URL, you must be an administrator, or a collaborator/owner of both content items.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`path` = NULL, `force` = NULL, ...) {
      if (!is.null(`path`)) {
        if (!(is.character(`path`) && length(`path`) == 1)) {
          stop(paste("Error! Invalid data for `path`. Must be a string:", `path`))
        }
        self$`path` <- `path`
      }
      if (!is.null(`force`)) {
        if (!(is.logical(`force`) && length(`force`) == 1)) {
          stop(paste("Error! Invalid data for `force`. Must be a boolean:", `force`))
        }
        self$`force` <- `force`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return SetVanityRequest in JSON format
    #' @export
    toJSON = function() {
      SetVanityRequestObject <- list()
      if (!is.null(self$`path`)) {
        SetVanityRequestObject[["path"]] <-
          self$`path`
      }
      if (!is.null(self$`force`)) {
        SetVanityRequestObject[["force"]] <-
          self$`force`
      }
      SetVanityRequestObject
    },
    #' Deserialize JSON string into an instance of SetVanityRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of SetVanityRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of SetVanityRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`path`)) {
        self$`path` <- this_object$`path`
      }
      if (!is.null(this_object$`force`)) {
        self$`force` <- this_object$`force`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return SetVanityRequest in JSON format
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
        if (!is.null(self$`force`)) {
          sprintf(
          '"force":
            %s
                    ',
          tolower(self$`force`)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of SetVanityRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of SetVanityRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of SetVanityRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`path` <- this_object$`path`
      self$`force` <- this_object$`force`
      self
    },
    #' Validate JSON input with respect to SetVanityRequest
    #'
    #' @description
    #' Validate JSON input with respect to SetVanityRequest and throw an exception if invalid
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
    #' @return String representation of SetVanityRequest
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
# SetVanityRequest$unlock()
#
## Below is an example to define the print function
# SetVanityRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# SetVanityRequest$lock()

