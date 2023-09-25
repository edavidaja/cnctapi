#' Create a new CreateGroupRequest
#'
#' @description
#' CreateGroupRequest Class
#'
#' @docType class
#' @title CreateGroupRequest
#' @description CreateGroupRequest Class
#' @format An \code{R6Class} generator object
#' @field name The group's desired name character
#' @field unique_id Applies to SAML, OAuth2 and Proxied authentication when the setting `GroupsByUniqueId` is enabled. This field must not be present otherwise. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreateGroupRequest <- R6::R6Class(
  "CreateGroupRequest",
  public = list(
    `name` = NULL,
    `unique_id` = NULL,
    #' Initialize a new CreateGroupRequest class.
    #'
    #' @description
    #' Initialize a new CreateGroupRequest class.
    #'
    #' @param name The group's desired name
    #' @param unique_id Applies to SAML, OAuth2 and Proxied authentication when the setting `GroupsByUniqueId` is enabled. This field must not be present otherwise.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name`, `unique_id` = NULL, ...) {
      if (!missing(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`unique_id`)) {
        if (!(is.character(`unique_id`) && length(`unique_id`) == 1)) {
          stop(paste("Error! Invalid data for `unique_id`. Must be a string:", `unique_id`))
        }
        self$`unique_id` <- `unique_id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateGroupRequest in JSON format
    #' @export
    toJSON = function() {
      CreateGroupRequestObject <- list()
      if (!is.null(self$`name`)) {
        CreateGroupRequestObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`unique_id`)) {
        CreateGroupRequestObject[["unique_id"]] <-
          self$`unique_id`
      }
      CreateGroupRequestObject
    },
    #' Deserialize JSON string into an instance of CreateGroupRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateGroupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateGroupRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`unique_id`)) {
        self$`unique_id` <- this_object$`unique_id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateGroupRequest in JSON format
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
        if (!is.null(self$`unique_id`)) {
          sprintf(
          '"unique_id":
            "%s"
                    ',
          self$`unique_id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of CreateGroupRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateGroupRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateGroupRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`name` <- this_object$`name`
      self$`unique_id` <- this_object$`unique_id`
      self
    },
    #' Validate JSON input with respect to CreateGroupRequest
    #'
    #' @description
    #' Validate JSON input with respect to CreateGroupRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `name`
      if (!is.null(input_json$`name`)) {
        if (!(is.character(input_json$`name`) && length(input_json$`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", input_json$`name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreateGroupRequest: the required field `name` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of CreateGroupRequest
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
      # check if the required `name` is null
      if (is.null(self$`name`)) {
        return(FALSE)
      }

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
      # check if the required `name` is null
      if (is.null(self$`name`)) {
        invalid_fields["name"] <- "Non-nullable required field `name` cannot be null."
      }

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
# CreateGroupRequest$unlock()
#
## Below is an example to define the print function
# CreateGroupRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreateGroupRequest$lock()

