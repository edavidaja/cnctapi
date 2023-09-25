#' Create a new AuditEntry
#'
#' @description
#' AuditEntry Class
#'
#' @docType class
#' @title AuditEntry
#' @description AuditEntry Class
#' @format An \code{R6Class} generator object
#' @field id ID of the audit action character
#' @field time Timestamp in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format when action was taken character
#' @field user_id User ID of the actor who made the audit action character
#' @field user_guid User GUID of the actor who made the audit action character
#' @field user_description Description of the actor character
#' @field action Audit action taken character
#' @field event_description Description of action character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AuditEntry <- R6::R6Class(
  "AuditEntry",
  public = list(
    `id` = NULL,
    `time` = NULL,
    `user_id` = NULL,
    `user_guid` = NULL,
    `user_description` = NULL,
    `action` = NULL,
    `event_description` = NULL,
    #' Initialize a new AuditEntry class.
    #'
    #' @description
    #' Initialize a new AuditEntry class.
    #'
    #' @param id ID of the audit action
    #' @param time Timestamp in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format when action was taken
    #' @param user_id User ID of the actor who made the audit action
    #' @param user_guid User GUID of the actor who made the audit action
    #' @param user_description Description of the actor
    #' @param action Audit action taken
    #' @param event_description Description of action
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id`, `time`, `user_id`, `user_guid`, `user_description`, `action`, `event_description`, ...) {
      if (!missing(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!missing(`time`)) {
        if (!(is.character(`time`) && length(`time`) == 1)) {
          stop(paste("Error! Invalid data for `time`. Must be a string:", `time`))
        }
        self$`time` <- `time`
      }
      if (!missing(`user_id`)) {
        if (!(is.character(`user_id`) && length(`user_id`) == 1)) {
          stop(paste("Error! Invalid data for `user_id`. Must be a string:", `user_id`))
        }
        self$`user_id` <- `user_id`
      }
      if (!missing(`user_guid`)) {
        if (!(is.character(`user_guid`) && length(`user_guid`) == 1)) {
          stop(paste("Error! Invalid data for `user_guid`. Must be a string:", `user_guid`))
        }
        self$`user_guid` <- `user_guid`
      }
      if (!missing(`user_description`)) {
        if (!(is.character(`user_description`) && length(`user_description`) == 1)) {
          stop(paste("Error! Invalid data for `user_description`. Must be a string:", `user_description`))
        }
        self$`user_description` <- `user_description`
      }
      if (!missing(`action`)) {
        if (!(is.character(`action`) && length(`action`) == 1)) {
          stop(paste("Error! Invalid data for `action`. Must be a string:", `action`))
        }
        self$`action` <- `action`
      }
      if (!missing(`event_description`)) {
        if (!(is.character(`event_description`) && length(`event_description`) == 1)) {
          stop(paste("Error! Invalid data for `event_description`. Must be a string:", `event_description`))
        }
        self$`event_description` <- `event_description`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditEntry in JSON format
    #' @export
    toJSON = function() {
      AuditEntryObject <- list()
      if (!is.null(self$`id`)) {
        AuditEntryObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`time`)) {
        AuditEntryObject[["time"]] <-
          self$`time`
      }
      if (!is.null(self$`user_id`)) {
        AuditEntryObject[["user_id"]] <-
          self$`user_id`
      }
      if (!is.null(self$`user_guid`)) {
        AuditEntryObject[["user_guid"]] <-
          self$`user_guid`
      }
      if (!is.null(self$`user_description`)) {
        AuditEntryObject[["user_description"]] <-
          self$`user_description`
      }
      if (!is.null(self$`action`)) {
        AuditEntryObject[["action"]] <-
          self$`action`
      }
      if (!is.null(self$`event_description`)) {
        AuditEntryObject[["event_description"]] <-
          self$`event_description`
      }
      AuditEntryObject
    },
    #' Deserialize JSON string into an instance of AuditEntry
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditEntry
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditEntry
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`time`)) {
        self$`time` <- this_object$`time`
      }
      if (!is.null(this_object$`user_id`)) {
        self$`user_id` <- this_object$`user_id`
      }
      if (!is.null(this_object$`user_guid`)) {
        self$`user_guid` <- this_object$`user_guid`
      }
      if (!is.null(this_object$`user_description`)) {
        self$`user_description` <- this_object$`user_description`
      }
      if (!is.null(this_object$`action`)) {
        self$`action` <- this_object$`action`
      }
      if (!is.null(this_object$`event_description`)) {
        self$`event_description` <- this_object$`event_description`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditEntry in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`id`)) {
          sprintf(
          '"id":
            "%s"
                    ',
          self$`id`
          )
        },
        if (!is.null(self$`time`)) {
          sprintf(
          '"time":
            "%s"
                    ',
          self$`time`
          )
        },
        if (!is.null(self$`user_id`)) {
          sprintf(
          '"user_id":
            "%s"
                    ',
          self$`user_id`
          )
        },
        if (!is.null(self$`user_guid`)) {
          sprintf(
          '"user_guid":
            "%s"
                    ',
          self$`user_guid`
          )
        },
        if (!is.null(self$`user_description`)) {
          sprintf(
          '"user_description":
            "%s"
                    ',
          self$`user_description`
          )
        },
        if (!is.null(self$`action`)) {
          sprintf(
          '"action":
            "%s"
                    ',
          self$`action`
          )
        },
        if (!is.null(self$`event_description`)) {
          sprintf(
          '"event_description":
            "%s"
                    ',
          self$`event_description`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of AuditEntry
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditEntry
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditEntry
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`time` <- this_object$`time`
      self$`user_id` <- this_object$`user_id`
      self$`user_guid` <- this_object$`user_guid`
      self$`user_description` <- this_object$`user_description`
      self$`action` <- this_object$`action`
      self$`event_description` <- this_object$`event_description`
      self
    },
    #' Validate JSON input with respect to AuditEntry
    #'
    #' @description
    #' Validate JSON input with respect to AuditEntry and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `id`
      if (!is.null(input_json$`id`)) {
        if (!(is.character(input_json$`id`) && length(input_json$`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", input_json$`id`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `id` is missing."))
      }
      # check the required field `time`
      if (!is.null(input_json$`time`)) {
        if (!(is.character(input_json$`time`) && length(input_json$`time`) == 1)) {
          stop(paste("Error! Invalid data for `time`. Must be a string:", input_json$`time`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `time` is missing."))
      }
      # check the required field `user_id`
      if (!is.null(input_json$`user_id`)) {
        if (!(is.character(input_json$`user_id`) && length(input_json$`user_id`) == 1)) {
          stop(paste("Error! Invalid data for `user_id`. Must be a string:", input_json$`user_id`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `user_id` is missing."))
      }
      # check the required field `user_guid`
      if (!is.null(input_json$`user_guid`)) {
        if (!(is.character(input_json$`user_guid`) && length(input_json$`user_guid`) == 1)) {
          stop(paste("Error! Invalid data for `user_guid`. Must be a string:", input_json$`user_guid`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `user_guid` is missing."))
      }
      # check the required field `user_description`
      if (!is.null(input_json$`user_description`)) {
        if (!(is.character(input_json$`user_description`) && length(input_json$`user_description`) == 1)) {
          stop(paste("Error! Invalid data for `user_description`. Must be a string:", input_json$`user_description`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `user_description` is missing."))
      }
      # check the required field `action`
      if (!is.null(input_json$`action`)) {
        if (!(is.character(input_json$`action`) && length(input_json$`action`) == 1)) {
          stop(paste("Error! Invalid data for `action`. Must be a string:", input_json$`action`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `action` is missing."))
      }
      # check the required field `event_description`
      if (!is.null(input_json$`event_description`)) {
        if (!(is.character(input_json$`event_description`) && length(input_json$`event_description`) == 1)) {
          stop(paste("Error! Invalid data for `event_description`. Must be a string:", input_json$`event_description`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditEntry: the required field `event_description` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of AuditEntry
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
      # check if the required `id` is null
      if (is.null(self$`id`)) {
        return(FALSE)
      }

      # check if the required `time` is null
      if (is.null(self$`time`)) {
        return(FALSE)
      }

      # check if the required `user_id` is null
      if (is.null(self$`user_id`)) {
        return(FALSE)
      }

      # check if the required `user_guid` is null
      if (is.null(self$`user_guid`)) {
        return(FALSE)
      }

      # check if the required `user_description` is null
      if (is.null(self$`user_description`)) {
        return(FALSE)
      }

      # check if the required `action` is null
      if (is.null(self$`action`)) {
        return(FALSE)
      }

      # check if the required `event_description` is null
      if (is.null(self$`event_description`)) {
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
      # check if the required `id` is null
      if (is.null(self$`id`)) {
        invalid_fields["id"] <- "Non-nullable required field `id` cannot be null."
      }

      # check if the required `time` is null
      if (is.null(self$`time`)) {
        invalid_fields["time"] <- "Non-nullable required field `time` cannot be null."
      }

      # check if the required `user_id` is null
      if (is.null(self$`user_id`)) {
        invalid_fields["user_id"] <- "Non-nullable required field `user_id` cannot be null."
      }

      # check if the required `user_guid` is null
      if (is.null(self$`user_guid`)) {
        invalid_fields["user_guid"] <- "Non-nullable required field `user_guid` cannot be null."
      }

      # check if the required `user_description` is null
      if (is.null(self$`user_description`)) {
        invalid_fields["user_description"] <- "Non-nullable required field `user_description` cannot be null."
      }

      # check if the required `action` is null
      if (is.null(self$`action`)) {
        invalid_fields["action"] <- "Non-nullable required field `action` cannot be null."
      }

      # check if the required `event_description` is null
      if (is.null(self$`event_description`)) {
        invalid_fields["event_description"] <- "Non-nullable required field `event_description` cannot be null."
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
# AuditEntry$unlock()
#
## Below is an example to define the print function
# AuditEntry$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AuditEntry$lock()

