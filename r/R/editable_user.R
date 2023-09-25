#' Create a new EditableUser
#'
#' @description
#' EditableUser Class
#'
#' @docType class
#' @title EditableUser
#' @description EditableUser Class
#' @format An \code{R6Class} generator object
#' @field email The user's email character
#' @field username The user's username character
#' @field first_name The user's first name character
#' @field last_name The user's last name character
#' @field user_role The user's role character
#' @field updated_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
EditableUser <- R6::R6Class(
  "EditableUser",
  public = list(
    `email` = NULL,
    `username` = NULL,
    `first_name` = NULL,
    `last_name` = NULL,
    `user_role` = NULL,
    `updated_time` = NULL,
    #' Initialize a new EditableUser class.
    #'
    #' @description
    #' Initialize a new EditableUser class.
    #'
    #' @param email The user's email
    #' @param username The user's username
    #' @param first_name The user's first name
    #' @param last_name The user's last name
    #' @param user_role The user's role
    #' @param updated_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`email`, `username`, `first_name`, `last_name`, `user_role`, `updated_time`, ...) {
      if (!missing(`email`)) {
        if (!(is.character(`email`) && length(`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", `email`))
        }
        self$`email` <- `email`
      }
      if (!missing(`username`)) {
        if (!(is.character(`username`) && length(`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", `username`))
        }
        self$`username` <- `username`
      }
      if (!missing(`first_name`)) {
        if (!(is.character(`first_name`) && length(`first_name`) == 1)) {
          stop(paste("Error! Invalid data for `first_name`. Must be a string:", `first_name`))
        }
        self$`first_name` <- `first_name`
      }
      if (!missing(`last_name`)) {
        if (!(is.character(`last_name`) && length(`last_name`) == 1)) {
          stop(paste("Error! Invalid data for `last_name`. Must be a string:", `last_name`))
        }
        self$`last_name` <- `last_name`
      }
      if (!missing(`user_role`)) {
        if (!(`user_role` %in% c("administrator", "publisher", "viewer"))) {
          stop(paste("Error! \"", `user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
        }
        if (!(is.character(`user_role`) && length(`user_role`) == 1)) {
          stop(paste("Error! Invalid data for `user_role`. Must be a string:", `user_role`))
        }
        self$`user_role` <- `user_role`
      }
      if (!missing(`updated_time`)) {
        if (!(is.character(`updated_time`) && length(`updated_time`) == 1)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", `updated_time`))
        }
        self$`updated_time` <- `updated_time`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return EditableUser in JSON format
    #' @export
    toJSON = function() {
      EditableUserObject <- list()
      if (!is.null(self$`email`)) {
        EditableUserObject[["email"]] <-
          self$`email`
      }
      if (!is.null(self$`username`)) {
        EditableUserObject[["username"]] <-
          self$`username`
      }
      if (!is.null(self$`first_name`)) {
        EditableUserObject[["first_name"]] <-
          self$`first_name`
      }
      if (!is.null(self$`last_name`)) {
        EditableUserObject[["last_name"]] <-
          self$`last_name`
      }
      if (!is.null(self$`user_role`)) {
        EditableUserObject[["user_role"]] <-
          self$`user_role`
      }
      if (!is.null(self$`updated_time`)) {
        EditableUserObject[["updated_time"]] <-
          self$`updated_time`
      }
      EditableUserObject
    },
    #' Deserialize JSON string into an instance of EditableUser
    #'
    #' @description
    #' Deserialize JSON string into an instance of EditableUser
    #'
    #' @param input_json the JSON input
    #' @return the instance of EditableUser
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
      if (!is.null(this_object$`updated_time`)) {
        self$`updated_time` <- this_object$`updated_time`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return EditableUser in JSON format
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
        },
        if (!is.null(self$`updated_time`)) {
          sprintf(
          '"updated_time":
            "%s"
                    ',
          self$`updated_time`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of EditableUser
    #'
    #' @description
    #' Deserialize JSON string into an instance of EditableUser
    #'
    #' @param input_json the JSON input
    #' @return the instance of EditableUser
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
      self$`updated_time` <- this_object$`updated_time`
      self
    },
    #' Validate JSON input with respect to EditableUser
    #'
    #' @description
    #' Validate JSON input with respect to EditableUser and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `email`
      if (!is.null(input_json$`email`)) {
        if (!(is.character(input_json$`email`) && length(input_json$`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", input_json$`email`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `email` is missing."))
      }
      # check the required field `username`
      if (!is.null(input_json$`username`)) {
        if (!(is.character(input_json$`username`) && length(input_json$`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", input_json$`username`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `username` is missing."))
      }
      # check the required field `first_name`
      if (!is.null(input_json$`first_name`)) {
        if (!(is.character(input_json$`first_name`) && length(input_json$`first_name`) == 1)) {
          stop(paste("Error! Invalid data for `first_name`. Must be a string:", input_json$`first_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `first_name` is missing."))
      }
      # check the required field `last_name`
      if (!is.null(input_json$`last_name`)) {
        if (!(is.character(input_json$`last_name`) && length(input_json$`last_name`) == 1)) {
          stop(paste("Error! Invalid data for `last_name`. Must be a string:", input_json$`last_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `last_name` is missing."))
      }
      # check the required field `user_role`
      if (!is.null(input_json$`user_role`)) {
        if (!(is.character(input_json$`user_role`) && length(input_json$`user_role`) == 1)) {
          stop(paste("Error! Invalid data for `user_role`. Must be a string:", input_json$`user_role`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `user_role` is missing."))
      }
      # check the required field `updated_time`
      if (!is.null(input_json$`updated_time`)) {
        if (!(is.character(input_json$`updated_time`) && length(input_json$`updated_time`) == 1)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", input_json$`updated_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for EditableUser: the required field `updated_time` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of EditableUser
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
      # check if the required `email` is null
      if (is.null(self$`email`)) {
        return(FALSE)
      }

      # check if the required `username` is null
      if (is.null(self$`username`)) {
        return(FALSE)
      }

      # check if the required `first_name` is null
      if (is.null(self$`first_name`)) {
        return(FALSE)
      }

      # check if the required `last_name` is null
      if (is.null(self$`last_name`)) {
        return(FALSE)
      }

      # check if the required `user_role` is null
      if (is.null(self$`user_role`)) {
        return(FALSE)
      }

      # check if the required `updated_time` is null
      if (is.null(self$`updated_time`)) {
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
      # check if the required `email` is null
      if (is.null(self$`email`)) {
        invalid_fields["email"] <- "Non-nullable required field `email` cannot be null."
      }

      # check if the required `username` is null
      if (is.null(self$`username`)) {
        invalid_fields["username"] <- "Non-nullable required field `username` cannot be null."
      }

      # check if the required `first_name` is null
      if (is.null(self$`first_name`)) {
        invalid_fields["first_name"] <- "Non-nullable required field `first_name` cannot be null."
      }

      # check if the required `last_name` is null
      if (is.null(self$`last_name`)) {
        invalid_fields["last_name"] <- "Non-nullable required field `last_name` cannot be null."
      }

      # check if the required `user_role` is null
      if (is.null(self$`user_role`)) {
        invalid_fields["user_role"] <- "Non-nullable required field `user_role` cannot be null."
      }

      # check if the required `updated_time` is null
      if (is.null(self$`updated_time`)) {
        invalid_fields["updated_time"] <- "Non-nullable required field `updated_time` cannot be null."
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
# EditableUser$unlock()
#
## Below is an example to define the print function
# EditableUser$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# EditableUser$lock()

