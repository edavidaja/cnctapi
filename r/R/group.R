#' Create a new Group
#'
#' @description
#' Group Class
#'
#' @docType class
#' @title Group
#' @description Group Class
#' @format An \code{R6Class} generator object
#' @field guid The unique identifier character
#' @field name The group name character
#' @field owner_guid The group owner's unique identifier. When using LDAP, or SAML/OAuth2/Proxied authentication with group provisioning enabled this property will always be `null`. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Group <- R6::R6Class(
  "Group",
  public = list(
    `guid` = NULL,
    `name` = NULL,
    `owner_guid` = NULL,
    #' Initialize a new Group class.
    #'
    #' @description
    #' Initialize a new Group class.
    #'
    #' @param guid The unique identifier
    #' @param name The group name
    #' @param owner_guid The group owner's unique identifier. When using LDAP, or SAML/OAuth2/Proxied authentication with group provisioning enabled this property will always be `null`.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid`, `name`, `owner_guid`, ...) {
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
      if (!missing(`owner_guid`)) {
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
    #' @return Group in JSON format
    #' @export
    toJSON = function() {
      GroupObject <- list()
      if (!is.null(self$`guid`)) {
        GroupObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`name`)) {
        GroupObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`owner_guid`)) {
        GroupObject[["owner_guid"]] <-
          self$`owner_guid`
      }
      GroupObject
    },
    #' Deserialize JSON string into an instance of Group
    #'
    #' @description
    #' Deserialize JSON string into an instance of Group
    #'
    #' @param input_json the JSON input
    #' @return the instance of Group
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`guid`)) {
        self$`guid` <- this_object$`guid`
      }
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
    #' @return Group in JSON format
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
    #' Deserialize JSON string into an instance of Group
    #'
    #' @description
    #' Deserialize JSON string into an instance of Group
    #'
    #' @param input_json the JSON input
    #' @return the instance of Group
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`guid` <- this_object$`guid`
      self$`name` <- this_object$`name`
      self$`owner_guid` <- this_object$`owner_guid`
      self
    },
    #' Validate JSON input with respect to Group
    #'
    #' @description
    #' Validate JSON input with respect to Group and throw an exception if invalid
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
        stop(paste("The JSON input `", input, "` is invalid for Group: the required field `guid` is missing."))
      }
      # check the required field `name`
      if (!is.null(input_json$`name`)) {
        if (!(is.character(input_json$`name`) && length(input_json$`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", input_json$`name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for Group: the required field `name` is missing."))
      }
      # check the required field `owner_guid`
      if (!is.null(input_json$`owner_guid`)) {
        if (!(is.character(input_json$`owner_guid`) && length(input_json$`owner_guid`) == 1)) {
          stop(paste("Error! Invalid data for `owner_guid`. Must be a string:", input_json$`owner_guid`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for Group: the required field `owner_guid` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of Group
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
      # check if the required `guid` is null
      if (is.null(self$`guid`)) {
        invalid_fields["guid"] <- "Non-nullable required field `guid` cannot be null."
      }

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
# Group$unlock()
#
## Below is an example to define the print function
# Group$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Group$lock()

