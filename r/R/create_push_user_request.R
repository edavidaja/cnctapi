#' Create a new CreatePushUserRequest
#'
#' @description
#' CreatePushUserRequest Class
#'
#' @docType class
#' @title CreatePushUserRequest
#' @description CreatePushUserRequest Class
#' @format An \code{R6Class} generator object
#' @field username The user's desired username character
#' @field email The user's email. character [optional]
#' @field first_name The user's first name character [optional]
#' @field last_name The user's last name character [optional]
#' @field user_role The user's role. If `null` it will default to the role specified by the config setting `Authorization.DefaultUserRole`. character [optional]
#' @field user_must_set_password Applies only to password authentication.  - When `true`, the created user will be asked to set their password on first login. The `password` request parameter cannot be set when this parameter is `true`. - When `false`, you must specify the `password`. character [optional]
#' @field password Applies only to password authentication. Must be at least 6 characters long. Cannot be set when `user_must_set_password` is true. character [optional]
#' @field unique_id Applies only to proxied authentication when `ProxyAuth.UniqueIdHeader` is being used.  It is required when SAML or OAuth2 (non-Google) authentication is being used. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreatePushUserRequest <- R6::R6Class(
  "CreatePushUserRequest",
  public = list(
    `username` = NULL,
    `email` = NULL,
    `first_name` = NULL,
    `last_name` = NULL,
    `user_role` = NULL,
    `user_must_set_password` = NULL,
    `password` = NULL,
    `unique_id` = NULL,
    #' Initialize a new CreatePushUserRequest class.
    #'
    #' @description
    #' Initialize a new CreatePushUserRequest class.
    #'
    #' @param username The user's desired username
    #' @param email The user's email.. Default to "".
    #' @param first_name The user's first name. Default to "".
    #' @param last_name The user's last name. Default to "".
    #' @param user_role The user's role. If `null` it will default to the role specified by the config setting `Authorization.DefaultUserRole`.
    #' @param user_must_set_password Applies only to password authentication.  - When `true`, the created user will be asked to set their password on first login. The `password` request parameter cannot be set when this parameter is `true`. - When `false`, you must specify the `password`.. Default to FALSE.
    #' @param password Applies only to password authentication. Must be at least 6 characters long. Cannot be set when `user_must_set_password` is true.. Default to "".
    #' @param unique_id Applies only to proxied authentication when `ProxyAuth.UniqueIdHeader` is being used.  It is required when SAML or OAuth2 (non-Google) authentication is being used.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`username`, `email` = "", `first_name` = "", `last_name` = "", `user_role` = NULL, `user_must_set_password` = FALSE, `password` = "", `unique_id` = NULL, ...) {
      if (!missing(`username`)) {
        if (!(is.character(`username`) && length(`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", `username`))
        }
        self$`username` <- `username`
      }
      if (!is.null(`email`)) {
        if (!(is.character(`email`) && length(`email`) == 1)) {
          stop(paste("Error! Invalid data for `email`. Must be a string:", `email`))
        }
        self$`email` <- `email`
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
      if (!is.null(`user_must_set_password`)) {
        if (!(is.logical(`user_must_set_password`) && length(`user_must_set_password`) == 1)) {
          stop(paste("Error! Invalid data for `user_must_set_password`. Must be a boolean:", `user_must_set_password`))
        }
        self$`user_must_set_password` <- `user_must_set_password`
      }
      if (!is.null(`password`)) {
        if (!(is.character(`password`) && length(`password`) == 1)) {
          stop(paste("Error! Invalid data for `password`. Must be a string:", `password`))
        }
        self$`password` <- `password`
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
    #' @return CreatePushUserRequest in JSON format
    #' @export
    toJSON = function() {
      CreatePushUserRequestObject <- list()
      if (!is.null(self$`username`)) {
        CreatePushUserRequestObject[["username"]] <-
          self$`username`
      }
      if (!is.null(self$`email`)) {
        CreatePushUserRequestObject[["email"]] <-
          self$`email`
      }
      if (!is.null(self$`first_name`)) {
        CreatePushUserRequestObject[["first_name"]] <-
          self$`first_name`
      }
      if (!is.null(self$`last_name`)) {
        CreatePushUserRequestObject[["last_name"]] <-
          self$`last_name`
      }
      if (!is.null(self$`user_role`)) {
        CreatePushUserRequestObject[["user_role"]] <-
          self$`user_role`
      }
      if (!is.null(self$`user_must_set_password`)) {
        CreatePushUserRequestObject[["user_must_set_password"]] <-
          self$`user_must_set_password`
      }
      if (!is.null(self$`password`)) {
        CreatePushUserRequestObject[["password"]] <-
          self$`password`
      }
      if (!is.null(self$`unique_id`)) {
        CreatePushUserRequestObject[["unique_id"]] <-
          self$`unique_id`
      }
      CreatePushUserRequestObject
    },
    #' Deserialize JSON string into an instance of CreatePushUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreatePushUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreatePushUserRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`username`)) {
        self$`username` <- this_object$`username`
      }
      if (!is.null(this_object$`email`)) {
        self$`email` <- this_object$`email`
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
      if (!is.null(this_object$`user_must_set_password`)) {
        self$`user_must_set_password` <- this_object$`user_must_set_password`
      }
      if (!is.null(this_object$`password`)) {
        self$`password` <- this_object$`password`
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
    #' @return CreatePushUserRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`username`)) {
          sprintf(
          '"username":
            "%s"
                    ',
          self$`username`
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
        if (!is.null(self$`user_must_set_password`)) {
          sprintf(
          '"user_must_set_password":
            %s
                    ',
          tolower(self$`user_must_set_password`)
          )
        },
        if (!is.null(self$`password`)) {
          sprintf(
          '"password":
            "%s"
                    ',
          self$`password`
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
    #' Deserialize JSON string into an instance of CreatePushUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreatePushUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreatePushUserRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`username` <- this_object$`username`
      self$`email` <- this_object$`email`
      self$`first_name` <- this_object$`first_name`
      self$`last_name` <- this_object$`last_name`
      if (!is.null(this_object$`user_role`) && !(this_object$`user_role` %in% c("administrator", "publisher", "viewer"))) {
        stop(paste("Error! \"", this_object$`user_role`, "\" cannot be assigned to `user_role`. Must be \"administrator\", \"publisher\", \"viewer\".", sep = ""))
      }
      self$`user_role` <- this_object$`user_role`
      self$`user_must_set_password` <- this_object$`user_must_set_password`
      self$`password` <- this_object$`password`
      self$`unique_id` <- this_object$`unique_id`
      self
    },
    #' Validate JSON input with respect to CreatePushUserRequest
    #'
    #' @description
    #' Validate JSON input with respect to CreatePushUserRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `username`
      if (!is.null(input_json$`username`)) {
        if (!(is.character(input_json$`username`) && length(input_json$`username`) == 1)) {
          stop(paste("Error! Invalid data for `username`. Must be a string:", input_json$`username`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreatePushUserRequest: the required field `username` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of CreatePushUserRequest
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
      # check if the required `username` is null
      if (is.null(self$`username`)) {
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
      # check if the required `username` is null
      if (is.null(self$`username`)) {
        invalid_fields["username"] <- "Non-nullable required field `username` cannot be null."
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
# CreatePushUserRequest$unlock()
#
## Below is an example to define the print function
# CreatePushUserRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreatePushUserRequest$lock()

