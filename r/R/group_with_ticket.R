#' Create a new GroupWithTicket
#'
#' @description
#' GroupWithTicket Class
#'
#' @docType class
#' @title GroupWithTicket
#' @description GroupWithTicket Class
#' @format An \code{R6Class} generator object
#' @field guid The group's unique identifier in [RFC4122](https://tools.ietf.org/html/rfc4122) format. When a group does not exist in the Posit Connect server, this property will be `null`. character
#' @field name The group name character
#' @field temp_ticket This value is for actions that require a `temp_ticket`, such as adding an LDAP group to the Connect server. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
GroupWithTicket <- R6::R6Class(
  "GroupWithTicket",
  public = list(
    `guid` = NULL,
    `name` = NULL,
    `temp_ticket` = NULL,
    #' Initialize a new GroupWithTicket class.
    #'
    #' @description
    #' Initialize a new GroupWithTicket class.
    #'
    #' @param guid The group's unique identifier in [RFC4122](https://tools.ietf.org/html/rfc4122) format. When a group does not exist in the Posit Connect server, this property will be `null`.
    #' @param name The group name
    #' @param temp_ticket This value is for actions that require a `temp_ticket`, such as adding an LDAP group to the Connect server.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid`, `name`, `temp_ticket`, ...) {
      if (!missing(`guid`)) {
        if (!(is.character(`guid`) && length(`guid`) == 1)) {
          stop(paste("Error! Invalid data for `guid`. Must be a string:", `guid`))
        }
        self$`guid` <- `guid`
      }
      if (!missing(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
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
    #' @return GroupWithTicket in JSON format
    #' @export
    toJSON = function() {
      GroupWithTicketObject <- list()
      if (!is.null(self$`guid`)) {
        GroupWithTicketObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`name`)) {
        GroupWithTicketObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`temp_ticket`)) {
        GroupWithTicketObject[["temp_ticket"]] <-
          self$`temp_ticket`
      }
      GroupWithTicketObject
    },
    #' Deserialize JSON string into an instance of GroupWithTicket
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupWithTicket
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupWithTicket
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`guid`)) {
        self$`guid` <- this_object$`guid`
      }
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
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
    #' @return GroupWithTicket in JSON format
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
        if (!is.null(self$`name`)) {
          sprintf(
          '"name":
            "%s"
                    ',
          self$`name`
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
    #' Deserialize JSON string into an instance of GroupWithTicket
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupWithTicket
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupWithTicket
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`guid` <- this_object$`guid`
      self$`name` <- this_object$`name`
      self$`temp_ticket` <- this_object$`temp_ticket`
      self
    },
    #' Validate JSON input with respect to GroupWithTicket
    #'
    #' @description
    #' Validate JSON input with respect to GroupWithTicket and throw an exception if invalid
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
        stop(paste("The JSON input `", input, "` is invalid for GroupWithTicket: the required field `guid` is missing."))
      }
      # check the required field `name`
      if (!is.null(input_json$`name`)) {
        if (!(is.character(input_json$`name`) && length(input_json$`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", input_json$`name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for GroupWithTicket: the required field `name` is missing."))
      }
      # check the required field `temp_ticket`
      if (!is.null(input_json$`temp_ticket`)) {
        if (!(is.character(input_json$`temp_ticket`) && length(input_json$`temp_ticket`) == 1)) {
          stop(paste("Error! Invalid data for `temp_ticket`. Must be a string:", input_json$`temp_ticket`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for GroupWithTicket: the required field `temp_ticket` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of GroupWithTicket
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
      # check if the required `name` is null
      if (is.null(self$`name`)) {
        invalid_fields["name"] <- "Non-nullable required field `name` cannot be null."
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
# GroupWithTicket$unlock()
#
## Below is an example to define the print function
# GroupWithTicket$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# GroupWithTicket$lock()

