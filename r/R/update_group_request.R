#' Create a new UpdateGroupRequest
#'
#' @description
#' UpdateGroupRequest Class
#'
#' @docType class
#' @title UpdateGroupRequest
#' @description UpdateGroupRequest Class
#' @format An \code{R6Class} generator object
#' @field name The group's desired name character [optional]
#' @field owner_guid The group owner's unique identifier. When using SAML/OAuth2/Proxied authentication with group provisioning enabled this property must always be `null`. Any existing owner is also removed in this condition. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UpdateGroupRequest <- R6::R6Class(
  "UpdateGroupRequest",
  public = list(
    `name` = NULL,
    `owner_guid` = NULL,
    #' Initialize a new UpdateGroupRequest class.
    #'
    #' @description
    #' Initialize a new UpdateGroupRequest class.
    #'
    #' @param name The group's desired name
    #' @param owner_guid The group owner's unique identifier. When using SAML/OAuth2/Proxied authentication with group provisioning enabled this property must always be `null`. Any existing owner is also removed in this condition.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name` = NULL, `owner_guid` = NULL, ...) {
      if (!is.null(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`owner_guid`)) {
        if (!(is.character(`owner_guid`) && length(`owner_guid`) == 1)) {
          stop(paste("Error! Invalid data for `owner_guid`. Must be a string:", `owner_guid`))
        }
        self$`owner_guid` <- `owner_guid`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateGroupRequest in JSON format
    #' @export
    toJSON = function() {
      UpdateGroupRequestObject <- list()
      if (!is.null(self$`name`)) {
        UpdateGroupRequestObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`owner_guid`)) {
        UpdateGroupRequestObject[["owner_guid"]] <-
          self$`owner_guid`
      }
      UpdateGroupRequestObject
    },
    #' Deserialize JSON string into an instance of UpdateGroupRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateGroupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateGroupRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`owner_guid`)) {
        self$`owner_guid` <- this_object$`owner_guid`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateGroupRequest in JSON format
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
        if (!is.null(self$`owner_guid`)) {
          sprintf(
          '"owner_guid":
            "%s"
                    ',
          self$`owner_guid`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UpdateGroupRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateGroupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateGroupRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`name` <- this_object$`name`
      self$`owner_guid` <- this_object$`owner_guid`
      self
    },
    #' Validate JSON input with respect to UpdateGroupRequest
    #'
    #' @description
    #' Validate JSON input with respect to UpdateGroupRequest and throw an exception if invalid
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
    #' @return String representation of UpdateGroupRequest
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
# UpdateGroupRequest$unlock()
#
## Below is an example to define the print function
# UpdateGroupRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UpdateGroupRequest$lock()

