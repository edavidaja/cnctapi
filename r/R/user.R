#' Create a new User
#'
#' @description
#' User Class
#'
#' @docType class
#' @title User
#' @description User Class
#' @format An \code{R6Class} generator object
#' @field guid The user's GUID, or unique identifier, in UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format character
#' @field email The user's email character
#' @field username The user's username character
#' @field first_name The user's first name character
#' @field last_name The user's last name character
#' @field user_role The user's role character
#' @field created_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when the user was created in the Posit Connect server. character
#' @field updated_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when information about this user was last updated in the Posit Connect server. character
#' @field active_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating approximately when the user was last active. Highly active users only receive periodic updates. character
#' @field confirmed When `false`, the created user must confirm their account through an email. This feature is unique to password authentication. character
#' @field locked Whether or not the user is locked character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
User <- R6::R6Class(
  "User",
  public = list(
    `guid` = NULL,
    `email` = NULL,
    `username` = NULL,
    `first_name` = NULL,
    `last_name` = NULL,
    `user_role` = NULL,
    `created_time` = NULL,
    `updated_time` = NULL,
    `active_time` = NULL,
    `confirmed` = NULL,
    `locked` = NULL,
    #' Initialize a new User class.
    #'
    #' @description
    #' Initialize a new User class.
    #'
    #' @param guid The user's GUID, or unique identifier, in UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format
    #' @param email The user's email
    #' @param username The user's username
    #' @param first_name The user's first name
    #' @param last_name The user's last name
    #' @param user_role The user's role
    #' @param created_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when the user was created in the Posit Connect server.
    #' @param updated_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when information about this user was last updated in the Posit Connect server.
    #' @param active_time Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating approximately when the user was last active. Highly active users only receive periodic updates.
    #' @param confirmed When `false`, the created user must confirm their account through an email. This feature is unique to password authentication.
    #' @param locked Whether or not the user is locked
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid`, `email`, `username`, `first_name`, `last_name`, `user_role`, `created_time`, `updated_time`, `active_time`, `confirmed`, `locked`, ...) {
      if (!missing(`guid`)) {
        if (!(is.character(`guid`) && length(`guid`) == 1)) {
          stop(paste("Error! Invalid data for `guid`. Must be a string:", `guid`))
        }
        self$`guid` <- `guid`
      }
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
      if (!missing(`created_time`)) {
        if (!(is.character(`created_time`) && length(`created_time`) == 1)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", `created_time`))
        }
        self$`created_time` <- `created_time`
      }
      if (!missing(`updated_time`)) {
        if (!(is.character(`updated_time`) && length(`updated_time`) == 1)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", `updated_time`))
        }
        self$`updated_time` <- `updated_time`
      }
      if (!missing(`active_time`)) {
        if (!(is.character(`active_time`) && length(`active_time`) == 1)) {
          stop(paste("Error! Invalid data for `active_time`. Must be a string:", `active_time`))
        }
        self$`active_time` <- `active_time`
      }
      if (!missing(`confirmed`)) {
        if (!(is.logical(`confirmed`) && length(`confirmed`) == 1)) {
          stop(paste("Error! Invalid data for `confirmed`. Must be a boolean:", `confirmed`))
        }
        self$`confirmed` <- `confirmed`
      }
      if (!missing(`locked`)) {
        if (!(is.logical(`locked`) && length(`locked`) == 1)) {
          stop(paste("Error! Invalid data for `locked`. Must be a boolean:", `locked`))
        }
        self$`locked` <- `locked`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return User in JSON format
    #' @export
    toJSON = function() {
      UserObject <- list()
      if (!is.null(self$`guid`)) {
        UserObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`email`)) {
        UserObject[["email"]] <-
          self$`email`
      }
      if (!is.null(self$`username`)) {
        UserObject[["username"]] <-
          self$`username`
      }
      if (!is.null(self$`first_name`)) {
        UserObject[["first_name"]] <-
          self$`first_name`
      }
      if (!is.null(self$`last_name`)) {
        UserObject[["last_name"]] <-
          self$`last_name`
      }
      if (!is.null(self$`user_role`)) {
        UserObject[["user_role"]] <-
          self$`user_role`
      }
      if (!is.null(self$`created_time`)) {
        UserObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`updated_time`)) {
        UserObject[["updated_time"]] <-
          self$`updated_time`
      }
      if (!is.null(self$`active_time`)) {
        UserObject[["active_time"]] <-
          self$`active_time`
      }
      if (!is.null(self$`confirmed`)) {
        UserObject[["confirmed"]] <-
          self$`confirmed`
      }
      if (!is.null(self$`locked`)) {
        UserObject[["locked"]] <-
          self$`locked`
      }
      UserObject
    },
    #' Deserialize JSON string into an instance of User
    #'
    #' @description
    #' Deserialize JSON string into an instance of User
    #'
    #' @param input_json the JSON input
    #' @return the instance of User
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`guid`)) {
        self$`guid` <- this_object$`guid`
      }
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
      if (!is.null(this_object$`created_time`)) {
        self$`created_time` <- this_object$`created_time`
      }
      if (!is.null(this_object$`updated_time`)) {
        self$`updated_time` <- this_object$`updated_time`
      }
      if (!is.null(this_object$`active_time`)) {
        self$`active_time` <- this_object$`active_time`
      }
      if (!is.null(this_object$`confirmed`)) {
        self$`confirmed` <- this_object$`confirmed`
      }
      if (!is.null(this_object$`locked`)) {
        self$`locked` <- this_object$`locked`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return User in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`guid`)) {
          sprintf(
          '"guid":
            "%s"
                    ',
          self$`guid`
          )
        },
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
        if (!is.null(self$`created_time`)) {
          sprintf(
          '"created_time":
            "%s"
                    ',
          self$`created_time`
          )
        },
        if (!is.null(self$`updated_time`)) {
          sprintf(
          '"updated_time":
            "%s"
                    ',
          self$`updated_time`
          )
        },
        if (!is.null(self$`active_time`)) {
          sprintf(
          '"active_time":
            "%s"
                    ',
          self$`active_time`
          )
        },
        if (!is.null(self$`confirmed`)) {
          sprintf(
          '"confirmed":
            %s
                    ',
          tolower(self$`confirmed`)
          )
        },
        if (!is.null(self$`locked`)) {
          sprintf(
          '"locked":
            %s
                    ',
          tolower(self$`locked`)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of User
    #'
    #' @description
    #' Deserialize JSON string into an instance of User
    #'
    #' @param input_json the JSON input
    #' @return the instance of User
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`guid` <- this_object$`guid`
      self$`email` <- this_object$`email`
      self$`username` <- this_object$`username`
      self$`first_name` <- this_object$`first_name`
      self$`last_name` <- this_object$`last_name`
      if (!is.null(this_object$`user_role`) && !(this_object$`user_role` %in% c("administrator", "publisher", "viewer"))) {
        stop(paste("Error! \"", this_object$`user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
      }
      self$`user_role` <- this_object$`user_role`
      self$`created_time` <- this_object$`created_time`
      self$`updated_time` <- this_object$`updated_time`
      self$`active_time` <- this_object$`active_time`
      self$`confirmed` <- this_object$`confirmed`
      self$`locked` <- this_object$`locked`
      self
    },
    #' Validate JSON input with respect to User
    #'
    #' @description
    #' Validate JSON input with respect to User and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `guid`
      if (!is.null(input_json$`guid`)) {
        if (!(is.character(input_json$`guid`) && length(input_json$`guid`) == 1)) {
          stop(paste("Error! Invalid data for `guid`. Must be a string:", input_json$`guid`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `guid` is missing."))
      }
      # check the required field `email`
      if (!is.null(input_json$`email`)) {
        if (!(is.character(input_json$`email`) && length(input_json$`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", input_json$`email`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `email` is missing."))
      }
      # check the required field `username`
      if (!is.null(input_json$`username`)) {
        if (!(is.character(input_json$`username`) && length(input_json$`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", input_json$`username`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `username` is missing."))
      }
      # check the required field `first_name`
      if (!is.null(input_json$`first_name`)) {
        if (!(is.character(input_json$`first_name`) && length(input_json$`first_name`) == 1)) {
          stop(paste("Error! Invalid data for `first_name`. Must be a string:", input_json$`first_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `first_name` is missing."))
      }
      # check the required field `last_name`
      if (!is.null(input_json$`last_name`)) {
        if (!(is.character(input_json$`last_name`) && length(input_json$`last_name`) == 1)) {
          stop(paste("Error! Invalid data for `last_name`. Must be a string:", input_json$`last_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `last_name` is missing."))
      }
      # check the required field `user_role`
      if (!is.null(input_json$`user_role`)) {
        if (!(is.character(input_json$`user_role`) && length(input_json$`user_role`) == 1)) {
          stop(paste("Error! Invalid data for `user_role`. Must be a string:", input_json$`user_role`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `user_role` is missing."))
      }
      # check the required field `created_time`
      if (!is.null(input_json$`created_time`)) {
        if (!(is.character(input_json$`created_time`) && length(input_json$`created_time`) == 1)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", input_json$`created_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `created_time` is missing."))
      }
      # check the required field `updated_time`
      if (!is.null(input_json$`updated_time`)) {
        if (!(is.character(input_json$`updated_time`) && length(input_json$`updated_time`) == 1)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", input_json$`updated_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `updated_time` is missing."))
      }
      # check the required field `active_time`
      if (!is.null(input_json$`active_time`)) {
        if (!(is.character(input_json$`active_time`) && length(input_json$`active_time`) == 1)) {
          stop(paste("Error! Invalid data for `active_time`. Must be a string:", input_json$`active_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `active_time` is missing."))
      }
      # check the required field `confirmed`
      if (!is.null(input_json$`confirmed`)) {
        if (!(is.logical(input_json$`confirmed`) && length(input_json$`confirmed`) == 1)) {
          stop(paste("Error! Invalid data for `confirmed`. Must be a boolean:", input_json$`confirmed`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `confirmed` is missing."))
      }
      # check the required field `locked`
      if (!is.null(input_json$`locked`)) {
        if (!(is.logical(input_json$`locked`) && length(input_json$`locked`) == 1)) {
          stop(paste("Error! Invalid data for `locked`. Must be a boolean:", input_json$`locked`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for User: the required field `locked` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of User
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
      # check if the required `guid` is null
      if (is.null(self$`guid`)) {
        return(FALSE)
      }

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

      # check if the required `created_time` is null
      if (is.null(self$`created_time`)) {
        return(FALSE)
      }

      # check if the required `updated_time` is null
      if (is.null(self$`updated_time`)) {
        return(FALSE)
      }

      # check if the required `confirmed` is null
      if (is.null(self$`confirmed`)) {
        return(FALSE)
      }

      # check if the required `locked` is null
      if (is.null(self$`locked`)) {
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
      # check if the required `guid` is null
      if (is.null(self$`guid`)) {
        invalid_fields["guid"] <- "Non-nullable required field `guid` cannot be null."
      }

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

      # check if the required `created_time` is null
      if (is.null(self$`created_time`)) {
        invalid_fields["created_time"] <- "Non-nullable required field `created_time` cannot be null."
      }

      # check if the required `updated_time` is null
      if (is.null(self$`updated_time`)) {
        invalid_fields["updated_time"] <- "Non-nullable required field `updated_time` cannot be null."
      }

      # check if the required `confirmed` is null
      if (is.null(self$`confirmed`)) {
        invalid_fields["confirmed"] <- "Non-nullable required field `confirmed` cannot be null."
      }

      # check if the required `locked` is null
      if (is.null(self$`locked`)) {
        invalid_fields["locked"] <- "Non-nullable required field `locked` cannot be null."
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
# User$unlock()
#
## Below is an example to define the print function
# User$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# User$lock()

