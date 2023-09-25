#' Create a new UserWithTicket
#'
#' @description
#' UserWithTicket Class
#'
#' @docType class
#' @title UserWithTicket
#' @description UserWithTicket Class
#' @format An \code{R6Class} generator object
#' @field guid The user's GUID, or unique identifier in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. When a user does not exist in the Posit Connect server, this property will be `null`. character
#' @field email The user's email character
#' @field username The user's username character
#' @field first_name The user's first name character
#' @field last_name The user's last name character
#' @field user_role The user's role character
#' @field created_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was created in the Posit Connect server character
#' @field updated_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server character
#' @field active_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last active on the Posit Connect server character
#' @field confirmed Whether or not the user is confirmed. This property will always be `true` for all authentication providers except password. character
#' @field locked Whether or not the user is locked character
#' @field temp_ticket This value is for actions that require a `temp_ticket`, such as adding an LDAP or OAuth2 with Google user to the Connect server. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UserWithTicket <- R6::R6Class(
  "UserWithTicket",
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
    `temp_ticket` = NULL,
    #' Initialize a new UserWithTicket class.
    #'
    #' @description
    #' Initialize a new UserWithTicket class.
    #'
    #' @param guid The user's GUID, or unique identifier in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. When a user does not exist in the Posit Connect server, this property will be `null`.
    #' @param email The user's email
    #' @param username The user's username
    #' @param first_name The user's first name
    #' @param last_name The user's last name
    #' @param user_role The user's role
    #' @param created_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was created in the Posit Connect server
    #' @param updated_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server
    #' @param active_time The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last active on the Posit Connect server
    #' @param confirmed Whether or not the user is confirmed. This property will always be `true` for all authentication providers except password.
    #' @param locked Whether or not the user is locked
    #' @param temp_ticket This value is for actions that require a `temp_ticket`, such as adding an LDAP or OAuth2 with Google user to the Connect server.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid`, `email`, `username`, `first_name`, `last_name`, `user_role`, `created_time`, `updated_time`, `active_time`, `confirmed`, `locked`, `temp_ticket`, ...) {
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
      if (!missing(`temp_ticket`)) {
        if (!(is.character(`temp_ticket`) && length(`temp_ticket`) == 1)) {
          stop(paste("Error! Invalid data for `temp_ticket`. Must be a string:", `temp_ticket`))
        }
        self$`temp_ticket` <- `temp_ticket`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UserWithTicket in JSON format
    #' @export
    toJSON = function() {
      UserWithTicketObject <- list()
      if (!is.null(self$`guid`)) {
        UserWithTicketObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`email`)) {
        UserWithTicketObject[["email"]] <-
          self$`email`
      }
      if (!is.null(self$`username`)) {
        UserWithTicketObject[["username"]] <-
          self$`username`
      }
      if (!is.null(self$`first_name`)) {
        UserWithTicketObject[["first_name"]] <-
          self$`first_name`
      }
      if (!is.null(self$`last_name`)) {
        UserWithTicketObject[["last_name"]] <-
          self$`last_name`
      }
      if (!is.null(self$`user_role`)) {
        UserWithTicketObject[["user_role"]] <-
          self$`user_role`
      }
      if (!is.null(self$`created_time`)) {
        UserWithTicketObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`updated_time`)) {
        UserWithTicketObject[["updated_time"]] <-
          self$`updated_time`
      }
      if (!is.null(self$`active_time`)) {
        UserWithTicketObject[["active_time"]] <-
          self$`active_time`
      }
      if (!is.null(self$`confirmed`)) {
        UserWithTicketObject[["confirmed"]] <-
          self$`confirmed`
      }
      if (!is.null(self$`locked`)) {
        UserWithTicketObject[["locked"]] <-
          self$`locked`
      }
      if (!is.null(self$`temp_ticket`)) {
        UserWithTicketObject[["temp_ticket"]] <-
          self$`temp_ticket`
      }
      UserWithTicketObject
    },
    #' Deserialize JSON string into an instance of UserWithTicket
    #'
    #' @description
    #' Deserialize JSON string into an instance of UserWithTicket
    #'
    #' @param input_json the JSON input
    #' @return the instance of UserWithTicket
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
      if (!is.null(this_object$`temp_ticket`)) {
        self$`temp_ticket` <- this_object$`temp_ticket`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UserWithTicket in JSON format
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
        },
        if (!is.null(self$`temp_ticket`)) {
          sprintf(
          '"temp_ticket":
            "%s"
                    ',
          self$`temp_ticket`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UserWithTicket
    #'
    #' @description
    #' Deserialize JSON string into an instance of UserWithTicket
    #'
    #' @param input_json the JSON input
    #' @return the instance of UserWithTicket
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
      self$`temp_ticket` <- this_object$`temp_ticket`
      self
    },
    #' Validate JSON input with respect to UserWithTicket
    #'
    #' @description
    #' Validate JSON input with respect to UserWithTicket and throw an exception if invalid
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
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `guid` is missing."))
      }
      # check the required field `email`
      if (!is.null(input_json$`email`)) {
        if (!(is.character(input_json$`email`) && length(input_json$`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", input_json$`email`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `email` is missing."))
      }
      # check the required field `username`
      if (!is.null(input_json$`username`)) {
        if (!(is.character(input_json$`username`) && length(input_json$`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", input_json$`username`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `username` is missing."))
      }
      # check the required field `first_name`
      if (!is.null(input_json$`first_name`)) {
        if (!(is.character(input_json$`first_name`) && length(input_json$`first_name`) == 1)) {
          stop(paste("Error! Invalid data for `first_name`. Must be a string:", input_json$`first_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `first_name` is missing."))
      }
      # check the required field `last_name`
      if (!is.null(input_json$`last_name`)) {
        if (!(is.character(input_json$`last_name`) && length(input_json$`last_name`) == 1)) {
          stop(paste("Error! Invalid data for `last_name`. Must be a string:", input_json$`last_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `last_name` is missing."))
      }
      # check the required field `user_role`
      if (!is.null(input_json$`user_role`)) {
        if (!(is.character(input_json$`user_role`) && length(input_json$`user_role`) == 1)) {
          stop(paste("Error! Invalid data for `user_role`. Must be a string:", input_json$`user_role`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `user_role` is missing."))
      }
      # check the required field `created_time`
      if (!is.null(input_json$`created_time`)) {
        if (!(is.character(input_json$`created_time`) && length(input_json$`created_time`) == 1)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", input_json$`created_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `created_time` is missing."))
      }
      # check the required field `updated_time`
      if (!is.null(input_json$`updated_time`)) {
        if (!(is.character(input_json$`updated_time`) && length(input_json$`updated_time`) == 1)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", input_json$`updated_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `updated_time` is missing."))
      }
      # check the required field `active_time`
      if (!is.null(input_json$`active_time`)) {
        if (!(is.character(input_json$`active_time`) && length(input_json$`active_time`) == 1)) {
          stop(paste("Error! Invalid data for `active_time`. Must be a string:", input_json$`active_time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `active_time` is missing."))
      }
      # check the required field `confirmed`
      if (!is.null(input_json$`confirmed`)) {
        if (!(is.logical(input_json$`confirmed`) && length(input_json$`confirmed`) == 1)) {
          stop(paste("Error! Invalid data for `confirmed`. Must be a boolean:", input_json$`confirmed`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `confirmed` is missing."))
      }
      # check the required field `locked`
      if (!is.null(input_json$`locked`)) {
        if (!(is.logical(input_json$`locked`) && length(input_json$`locked`) == 1)) {
          stop(paste("Error! Invalid data for `locked`. Must be a boolean:", input_json$`locked`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `locked` is missing."))
      }
      # check the required field `temp_ticket`
      if (!is.null(input_json$`temp_ticket`)) {
        if (!(is.character(input_json$`temp_ticket`) && length(input_json$`temp_ticket`) == 1)) {
          stop(paste("Error! Invalid data for `temp_ticket`. Must be a string:", input_json$`temp_ticket`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UserWithTicket: the required field `temp_ticket` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of UserWithTicket
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

      # check if the required `temp_ticket` is null
      if (is.null(self$`temp_ticket`)) {
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

      # check if the required `temp_ticket` is null
      if (is.null(self$`temp_ticket`)) {
        invalid_fields["temp_ticket"] <- "Non-nullable required field `temp_ticket` cannot be null."
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
# UserWithTicket$unlock()
#
## Below is an example to define the print function
# UserWithTicket$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UserWithTicket$lock()

