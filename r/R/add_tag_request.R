#' Create a new AddTagRequest
#'
#' @description
#' AddTagRequest Class
#'
#' @docType class
#' @title AddTagRequest
#' @description AddTagRequest Class
#' @format An \code{R6Class} generator object
#' @field tag_id The unique identifier for the tag character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AddTagRequest <- R6::R6Class(
  "AddTagRequest",
  public = list(
    `tag_id` = NULL,
    #' Initialize a new AddTagRequest class.
    #'
    #' @description
    #' Initialize a new AddTagRequest class.
    #'
    #' @param tag_id The unique identifier for the tag
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`tag_id` = NULL, ...) {
      if (!is.null(`tag_id`)) {
        if (!(is.character(`tag_id`) && length(`tag_id`) == 1)) {
          stop(paste("Error! Invalid data for `tag_id`. Must be a string:", `tag_id`))
        }
        self$`tag_id` <- `tag_id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AddTagRequest in JSON format
    #' @export
    toJSON = function() {
      AddTagRequestObject <- list()
      if (!is.null(self$`tag_id`)) {
        AddTagRequestObject[["tag_id"]] <-
          self$`tag_id`
      }
      AddTagRequestObject
    },
    #' Deserialize JSON string into an instance of AddTagRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddTagRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddTagRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`tag_id`)) {
        self$`tag_id` <- this_object$`tag_id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AddTagRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`tag_id`)) {
          sprintf(
          '"tag_id":
            "%s"
                    ',
          self$`tag_id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of AddTagRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddTagRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddTagRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`tag_id` <- this_object$`tag_id`
      self
    },
    #' Validate JSON input with respect to AddTagRequest
    #'
    #' @description
    #' Validate JSON input with respect to AddTagRequest and throw an exception if invalid
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
    #' @return String representation of AddTagRequest
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
# AddTagRequest$unlock()
#
## Below is an example to define the print function
# AddTagRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AddTagRequest$lock()

