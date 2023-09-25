#' Create a new UpdateUserRequest
#'
#' @description
#' UpdateUserRequest Class
#'
#' @docType class
#' @title UpdateUserRequest
#' @description UpdateUserRequest Class
#' @format An \code{R6Class} generator object
#' @field email The user's new email. character [optional]
#' @field username The user's new username character [optional]
#' @field first_name The user's new first name character [optional]
#' @field last_name The user's new last name character [optional]
#' @field user_role The user's new role. Note that you can only downgrade yourself. Administrators can change other users' roles to any valid role. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UpdateUserRequest <- R6::R6Class(
  "UpdateUserRequest",
  public = list(
    `email` = NULL,
    `username` = NULL,
    `first_name` = NULL,
    `last_name` = NULL,
    `user_role` = NULL,
    #' Initialize a new UpdateUserRequest class.
    #'
    #' @description
    #' Initialize a new UpdateUserRequest class.
    #'
    #' @param email The user's new email.
    #' @param username The user's new username
    #' @param first_name The user's new first name
    #' @param last_name The user's new last name
    #' @param user_role The user's new role. Note that you can only downgrade yourself. Administrators can change other users' roles to any valid role.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`email` = NULL, `username` = NULL, `first_name` = NULL, `last_name` = NULL, `user_role` = NULL, ...) {
      if (!is.null(`email`)) {
        if (!(is.character(`email`) && length(`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", `email`))
        }
        self$`email` <- `email`
      }
      if (!is.null(`username`)) {
        if (!(is.character(`username`) && length(`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", `username`))
        }
        self$`username` <- `username`
      }
      if (!is.null(`first_name`)) {
        if (!(is.character(`first_name`) && length(`first_name`) == 1)) {
          stop(paste("Error! Invalid data for `first_name`. Must be a string:", `first_name`))
        }
        self$`first_name` <- `first_name`
      }
      if (!is.null(`last_name`)) {
        if (!(is.character(`last_name`) && length(`last_name`) == 1)) {
          stop(paste("Error! Invalid data for `last_name`. Must be a string:", `last_name`))
        }
        self$`last_name` <- `last_name`
      }
      if (!is.null(`user_role`)) {
        if (!(`user_role` %in% c("administrator", "publisher", "viewer"))) {
          stop(paste("Error! \"", `user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
        }
        if (!(is.character(`user_role`) && length(`user_role`) == 1)) {
          stop(paste("Error! Invalid data for `user_role`. Must be a string:", `user_role`))
        }
        self$`user_role` <- `user_role`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateUserRequest in JSON format
    #' @export
    toJSON = function() {
      UpdateUserRequestObject <- list()
      if (!is.null(self$`email`)) {
        UpdateUserRequestObject[["email"]] <-
          self$`email`
      }
      if (!is.null(self$`username`)) {
        UpdateUserRequestObject[["username"]] <-
          self$`username`
      }
      if (!is.null(self$`first_name`)) {
        UpdateUserRequestObject[["first_name"]] <-
          self$`first_name`
      }
      if (!is.null(self$`last_name`)) {
        UpdateUserRequestObject[["last_name"]] <-
          self$`last_name`
      }
      if (!is.null(self$`user_role`)) {
        UpdateUserRequestObject[["user_role"]] <-
          self$`user_role`
      }
      UpdateUserRequestObject
    },
    #' Deserialize JSON string into an instance of UpdateUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateUserRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`email`)) {
        self$`email` <- this_object$`email`
      }
      if (!is.null(this_object$`username`)) {
        self$`username` <- this_object$`username`
      }
      if (!is.null(this_object$`first_name`)) {
        self$`first_name` <- this_object$`first_name`
      }
      if (!is.null(this_object$`last_name`)) {
        self$`last_name` <- this_object$`last_name`
      }
      if (!is.null(this_object$`user_role`)) {
        if (!is.null(this_object$`user_role`) && !(this_object$`user_role` %in% c("administrator", "publisher", "viewer"))) {
          stop(paste("Error! \"", this_object$`user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
        }
        self$`user_role` <- this_object$`user_role`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateUserRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`email`)) {
          sprintf(
          '"email":
            "%s"
                    ',
          self$`email`
          )
        },
        if (!is.null(self$`username`)) {
          sprintf(
          '"username":
            "%s"
                    ',
          self$`username`
          )
        },
        if (!is.null(self$`first_name`)) {
          sprintf(
          '"first_name":
            "%s"
                    ',
          self$`first_name`
          )
        },
        if (!is.null(self$`last_name`)) {
          sprintf(
          '"last_name":
            "%s"
                    ',
          self$`last_name`
          )
        },
        if (!is.null(self$`user_role`)) {
          sprintf(
          '"user_role":
            "%s"
                    ',
          self$`user_role`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UpdateUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateUserRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`email` <- this_object$`email`
      self$`username` <- this_object$`username`
      self$`first_name` <- this_object$`first_name`
      self$`last_name` <- this_object$`last_name`
      if (!is.null(this_object$`user_role`) && !(this_object$`user_role` %in% c("administrator", "publisher", "viewer"))) {
        stop(paste("Error! \"", this_object$`user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
      }
      self$`user_role` <- this_object$`user_role`
      self
    },
    #' Validate JSON input with respect to UpdateUserRequest
    #'
    #' @description
    #' Validate JSON input with respect to UpdateUserRequest and throw an exception if invalid
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
    #' @return String representation of UpdateUserRequest
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
# UpdateUserRequest$unlock()
#
## Below is an example to define the print function
# UpdateUserRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UpdateUserRequest$lock()

