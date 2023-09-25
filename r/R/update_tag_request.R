#' Create a new UpdateTagRequest
#'
#' @description
#' The fields that can be specified when creating or updating a tag
#'
#' @docType class
#' @title UpdateTagRequest
#' @description UpdateTagRequest Class
#' @format An \code{R6Class} generator object
#' @field name The name of the tag. Tags under the same parent must have a unique name and cannot be longer than 255 characters. character [optional]
#' @field parent_id The identifier for the parent tag. If there is no parent_id, the tag will be a top-level tag. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UpdateTagRequest <- R6::R6Class(
  "UpdateTagRequest",
  public = list(
    `name` = NULL,
    `parent_id` = NULL,
    #' Initialize a new UpdateTagRequest class.
    #'
    #' @description
    #' Initialize a new UpdateTagRequest class.
    #'
    #' @param name The name of the tag. Tags under the same parent must have a unique name and cannot be longer than 255 characters.
    #' @param parent_id The identifier for the parent tag. If there is no parent_id, the tag will be a top-level tag.. Default to "null".
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name` = NULL, `parent_id` = "null", ...) {
      if (!is.null(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`parent_id`)) {
        if (!(is.character(`parent_id`) && length(`parent_id`) == 1)) {
          stop(paste("Error! Invalid data for `parent_id`. Must be a string:", `parent_id`))
        }
        self$`parent_id` <- `parent_id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateTagRequest in JSON format
    #' @export
    toJSON = function() {
      UpdateTagRequestObject <- list()
      if (!is.null(self$`name`)) {
        UpdateTagRequestObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`parent_id`)) {
        UpdateTagRequestObject[["parent_id"]] <-
          self$`parent_id`
      }
      UpdateTagRequestObject
    },
    #' Deserialize JSON string into an instance of UpdateTagRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateTagRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateTagRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`parent_id`)) {
        self$`parent_id` <- this_object$`parent_id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateTagRequest in JSON format
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
        if (!is.null(self$`parent_id`)) {
          sprintf(
          '"parent_id":
            "%s"
                    ',
          self$`parent_id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UpdateTagRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateTagRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateTagRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`name` <- this_object$`name`
      self$`parent_id` <- this_object$`parent_id`
      self
    },
    #' Validate JSON input with respect to UpdateTagRequest
    #'
    #' @description
    #' Validate JSON input with respect to UpdateTagRequest and throw an exception if invalid
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
    #' @return String representation of UpdateTagRequest
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
# UpdateTagRequest$unlock()
#
## Below is an example to define the print function
# UpdateTagRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UpdateTagRequest$lock()

