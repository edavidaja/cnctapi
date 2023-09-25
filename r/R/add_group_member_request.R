#' Create a new AddGroupMemberRequest
#'
#' @description
#' AddGroupMemberRequest Class
#'
#' @docType class
#' @title AddGroupMemberRequest
#' @description AddGroupMemberRequest Class
#' @format An \code{R6Class} generator object
#' @field user_guid The user's unique identifier character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AddGroupMemberRequest <- R6::R6Class(
  "AddGroupMemberRequest",
  public = list(
    `user_guid` = NULL,
    #' Initialize a new AddGroupMemberRequest class.
    #'
    #' @description
    #' Initialize a new AddGroupMemberRequest class.
    #'
    #' @param user_guid The user's unique identifier
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`user_guid`, ...) {
      if (!missing(`user_guid`)) {
        if (!(is.character(`user_guid`) && length(`user_guid`) == 1)) {
          stop(paste("Error! Invalid data for `user_guid`. Must be a string:", `user_guid`))
        }
        self$`user_guid` <- `user_guid`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AddGroupMemberRequest in JSON format
    #' @export
    toJSON = function() {
      AddGroupMemberRequestObject <- list()
      if (!is.null(self$`user_guid`)) {
        AddGroupMemberRequestObject[["user_guid"]] <-
          self$`user_guid`
      }
      AddGroupMemberRequestObject
    },
    #' Deserialize JSON string into an instance of AddGroupMemberRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddGroupMemberRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddGroupMemberRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`user_guid`)) {
        self$`user_guid` <- this_object$`user_guid`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AddGroupMemberRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`user_guid`)) {
          sprintf(
          '"user_guid":
            "%s"
                    ',
          self$`user_guid`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of AddGroupMemberRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddGroupMemberRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddGroupMemberRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`user_guid` <- this_object$`user_guid`
      self
    },
    #' Validate JSON input with respect to AddGroupMemberRequest
    #'
    #' @description
    #' Validate JSON input with respect to AddGroupMemberRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `user_guid`
      if (!is.null(input_json$`user_guid`)) {
        if (!(is.character(input_json$`user_guid`) && length(input_json$`user_guid`) == 1)) {
          stop(paste("Error! Invalid data for `user_guid`. Must be a string:", input_json$`user_guid`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AddGroupMemberRequest: the required field `user_guid` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of AddGroupMemberRequest
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
      # check if the required `user_guid` is null
      if (is.null(self$`user_guid`)) {
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
      # check if the required `user_guid` is null
      if (is.null(self$`user_guid`)) {
        invalid_fields["user_guid"] <- "Non-nullable required field `user_guid` cannot be null."
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
# AddGroupMemberRequest$unlock()
#
## Below is an example to define the print function
# AddGroupMemberRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AddGroupMemberRequest$lock()

