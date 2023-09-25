#' Create a new GroupOwnershipContent
#'
#' @description
#' GroupOwnershipContent Class
#'
#' @docType class
#' @title GroupOwnershipContent
#' @description GroupOwnershipContent Class
#' @format An \code{R6Class} generator object
#' @field content_guid The unique identifier of the content item. character [optional]
#' @field content_name The name of the content item. character [optional]
#' @field content_title The title of the content item. character [optional]
#' @field access_type The access type of the content item. character [optional]
#' @field permissions List of principals (users and groups) with access to the content. The owner is listed as `author` and is always present. list(\link{GroupOwnershipPermission}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
GroupOwnershipContent <- R6::R6Class(
  "GroupOwnershipContent",
  public = list(
    `content_guid` = NULL,
    `content_name` = NULL,
    `content_title` = NULL,
    `access_type` = NULL,
    `permissions` = NULL,
    #' Initialize a new GroupOwnershipContent class.
    #'
    #' @description
    #' Initialize a new GroupOwnershipContent class.
    #'
    #' @param content_guid The unique identifier of the content item.
    #' @param content_name The name of the content item.
    #' @param content_title The title of the content item.
    #' @param access_type The access type of the content item.
    #' @param permissions List of principals (users and groups) with access to the content. The owner is listed as `author` and is always present.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`content_guid` = NULL, `content_name` = NULL, `content_title` = NULL, `access_type` = NULL, `permissions` = NULL, ...) {
      if (!is.null(`content_guid`)) {
        if (!(is.character(`content_guid`) && length(`content_guid`) == 1)) {
          stop(paste("Error! Invalid data for `content_guid`. Must be a string:", `content_guid`))
        }
        self$`content_guid` <- `content_guid`
      }
      if (!is.null(`content_name`)) {
        if (!(is.character(`content_name`) && length(`content_name`) == 1)) {
          stop(paste("Error! Invalid data for `content_name`. Must be a string:", `content_name`))
        }
        self$`content_name` <- `content_name`
      }
      if (!is.null(`content_title`)) {
        if (!(is.character(`content_title`) && length(`content_title`) == 1)) {
          stop(paste("Error! Invalid data for `content_title`. Must be a string:", `content_title`))
        }
        self$`content_title` <- `content_title`
      }
      if (!is.null(`access_type`)) {
        if (!(`access_type` %in% c("acl", "all", "logged_in"))) {
          stop(paste("Error! \"", `access_type`, "\" cannot be assigned to `access_type`. Must be \"acl\", \"all\", \"logged_in\".", sep = ""))
        }
        if (!(is.character(`access_type`) && length(`access_type`) == 1)) {
          stop(paste("Error! Invalid data for `access_type`. Must be a string:", `access_type`))
        }
        self$`access_type` <- `access_type`
      }
      if (!is.null(`permissions`)) {
        stopifnot(is.vector(`permissions`), length(`permissions`) != 0)
        sapply(`permissions`, function(x) stopifnot(R6::is.R6(x)))
        self$`permissions` <- `permissions`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GroupOwnershipContent in JSON format
    #' @export
    toJSON = function() {
      GroupOwnershipContentObject <- list()
      if (!is.null(self$`content_guid`)) {
        GroupOwnershipContentObject[["content_guid"]] <-
          self$`content_guid`
      }
      if (!is.null(self$`content_name`)) {
        GroupOwnershipContentObject[["content_name"]] <-
          self$`content_name`
      }
      if (!is.null(self$`content_title`)) {
        GroupOwnershipContentObject[["content_title"]] <-
          self$`content_title`
      }
      if (!is.null(self$`access_type`)) {
        GroupOwnershipContentObject[["access_type"]] <-
          self$`access_type`
      }
      if (!is.null(self$`permissions`)) {
        GroupOwnershipContentObject[["permissions"]] <-
          lapply(self$`permissions`, function(x) x$toJSON())
      }
      GroupOwnershipContentObject
    },
    #' Deserialize JSON string into an instance of GroupOwnershipContent
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupOwnershipContent
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupOwnershipContent
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`content_guid`)) {
        self$`content_guid` <- this_object$`content_guid`
      }
      if (!is.null(this_object$`content_name`)) {
        self$`content_name` <- this_object$`content_name`
      }
      if (!is.null(this_object$`content_title`)) {
        self$`content_title` <- this_object$`content_title`
      }
      if (!is.null(this_object$`access_type`)) {
        if (!is.null(this_object$`access_type`) && !(this_object$`access_type` %in% c("acl", "all", "logged_in"))) {
          stop(paste("Error! \"", this_object$`access_type`, "\" cannot be assigned to `access_type`. Must be \"acl\", \"all\", \"logged_in\".", sep = ""))
        }
        self$`access_type` <- this_object$`access_type`
      }
      if (!is.null(this_object$`permissions`)) {
        self$`permissions` <- ApiClient$new()$deserializeObj(this_object$`permissions`, "array[GroupOwnershipPermission]", loadNamespace("connectapi2"))
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GroupOwnershipContent in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`content_guid`)) {
          sprintf(
          '"content_guid":
            "%s"
                    ',
          self$`content_guid`
          )
        },
        if (!is.null(self$`content_name`)) {
          sprintf(
          '"content_name":
            "%s"
                    ',
          self$`content_name`
          )
        },
        if (!is.null(self$`content_title`)) {
          sprintf(
          '"content_title":
            "%s"
                    ',
          self$`content_title`
          )
        },
        if (!is.null(self$`access_type`)) {
          sprintf(
          '"access_type":
            "%s"
                    ',
          self$`access_type`
          )
        },
        if (!is.null(self$`permissions`)) {
          sprintf(
          '"permissions":
          [%s]
',
          paste(sapply(self$`permissions`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of GroupOwnershipContent
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupOwnershipContent
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupOwnershipContent
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`content_guid` <- this_object$`content_guid`
      self$`content_name` <- this_object$`content_name`
      self$`content_title` <- this_object$`content_title`
      if (!is.null(this_object$`access_type`) && !(this_object$`access_type` %in% c("acl", "all", "logged_in"))) {
        stop(paste("Error! \"", this_object$`access_type`, "\" cannot be assigned to `access_type`. Must be \"acl\", \"all\", \"logged_in\".", sep = ""))
      }
      self$`access_type` <- this_object$`access_type`
      self$`permissions` <- ApiClient$new()$deserializeObj(this_object$`permissions`, "array[GroupOwnershipPermission]", loadNamespace("connectapi2"))
      self
    },
    #' Validate JSON input with respect to GroupOwnershipContent
    #'
    #' @description
    #' Validate JSON input with respect to GroupOwnershipContent and throw an exception if invalid
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
    #' @return String representation of GroupOwnershipContent
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
# GroupOwnershipContent$unlock()
#
## Below is an example to define the print function
# GroupOwnershipContent$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# GroupOwnershipContent$lock()

