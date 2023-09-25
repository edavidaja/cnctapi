#' Create a new Permission
#'
#' @description
#' Defines the permission level that a user or group has been granted to a content item.
#'
#' @docType class
#' @title Permission
#' @description Permission Class
#' @format An \code{R6Class} generator object
#' @field id The identifier for this permission entry. character [optional]
#' @field content_guid The identifier of the content item. character [optional]
#' @field principal_guid The identifier of the principal (user or group) listed in the ACL. character [optional]
#' @field principal_type The type of principal. character [optional]
#' @field role The level of access that the principal has been given to this content item. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Permission <- R6::R6Class(
  "Permission",
  public = list(
    `id` = NULL,
    `content_guid` = NULL,
    `principal_guid` = NULL,
    `principal_type` = NULL,
    `role` = NULL,
    #' Initialize a new Permission class.
    #'
    #' @description
    #' Initialize a new Permission class.
    #'
    #' @param id The identifier for this permission entry.
    #' @param content_guid The identifier of the content item.
    #' @param principal_guid The identifier of the principal (user or group) listed in the ACL.
    #' @param principal_type The type of principal.
    #' @param role The level of access that the principal has been given to this content item.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `content_guid` = NULL, `principal_guid` = NULL, `principal_type` = NULL, `role` = NULL, ...) {
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!is.null(`content_guid`)) {
        if (!(is.character(`content_guid`) && length(`content_guid`) == 1)) {
          stop(paste("Error! Invalid data for `content_guid`. Must be a string:", `content_guid`))
        }
        self$`content_guid` <- `content_guid`
      }
      if (!is.null(`principal_guid`)) {
        if (!(is.character(`principal_guid`) && length(`principal_guid`) == 1)) {
          stop(paste("Error! Invalid data for `principal_guid`. Must be a string:", `principal_guid`))
        }
        self$`principal_guid` <- `principal_guid`
      }
      if (!is.null(`principal_type`)) {
        if (!(`principal_type` %in% c("user", "group"))) {
          stop(paste("Error! \"", `principal_type`, "\" cannot be assigned to `principal_type`. Must be \"user\", \"group\".", sep = ""))
        }
        if (!(is.character(`principal_type`) && length(`principal_type`) == 1)) {
          stop(paste("Error! Invalid data for `principal_type`. Must be a string:", `principal_type`))
        }
        self$`principal_type` <- `principal_type`
      }
      if (!is.null(`role`)) {
        if (!(`role` %in% c("viewer", "owner"))) {
          stop(paste("Error! \"", `role`, "\" cannot be assigned to `role`. Must be \"viewer\", \"owner\".", sep = ""))
        }
        if (!(is.character(`role`) && length(`role`) == 1)) {
          stop(paste("Error! Invalid data for `role`. Must be a string:", `role`))
        }
        self$`role` <- `role`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Permission in JSON format
    #' @export
    toJSON = function() {
      PermissionObject <- list()
      if (!is.null(self$`id`)) {
        PermissionObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`content_guid`)) {
        PermissionObject[["content_guid"]] <-
          self$`content_guid`
      }
      if (!is.null(self$`principal_guid`)) {
        PermissionObject[["principal_guid"]] <-
          self$`principal_guid`
      }
      if (!is.null(self$`principal_type`)) {
        PermissionObject[["principal_type"]] <-
          self$`principal_type`
      }
      if (!is.null(self$`role`)) {
        PermissionObject[["role"]] <-
          self$`role`
      }
      PermissionObject
    },
    #' Deserialize JSON string into an instance of Permission
    #'
    #' @description
    #' Deserialize JSON string into an instance of Permission
    #'
    #' @param input_json the JSON input
    #' @return the instance of Permission
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`content_guid`)) {
        self$`content_guid` <- this_object$`content_guid`
      }
      if (!is.null(this_object$`principal_guid`)) {
        self$`principal_guid` <- this_object$`principal_guid`
      }
      if (!is.null(this_object$`principal_type`)) {
        if (!is.null(this_object$`principal_type`) && !(this_object$`principal_type` %in% c("user", "group"))) {
          stop(paste("Error! \"", this_object$`principal_type`, "\" cannot be assigned to `principal_type`. Must be \"user\", \"group\".", sep = ""))
        }
        self$`principal_type` <- this_object$`principal_type`
      }
      if (!is.null(this_object$`role`)) {
        if (!is.null(this_object$`role`) && !(this_object$`role` %in% c("viewer", "owner"))) {
          stop(paste("Error! \"", this_object$`role`, "\" cannot be assigned to `role`. Must be \"viewer\", \"owner\".", sep = ""))
        }
        self$`role` <- this_object$`role`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Permission in JSON format
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
        if (!is.null(self$`content_guid`)) {
          sprintf(
          '"content_guid":
            "%s"
                    ',
          self$`content_guid`
          )
        },
        if (!is.null(self$`principal_guid`)) {
          sprintf(
          '"principal_guid":
            "%s"
                    ',
          self$`principal_guid`
          )
        },
        if (!is.null(self$`principal_type`)) {
          sprintf(
          '"principal_type":
            "%s"
                    ',
          self$`principal_type`
          )
        },
        if (!is.null(self$`role`)) {
          sprintf(
          '"role":
            "%s"
                    ',
          self$`role`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Permission
    #'
    #' @description
    #' Deserialize JSON string into an instance of Permission
    #'
    #' @param input_json the JSON input
    #' @return the instance of Permission
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`content_guid` <- this_object$`content_guid`
      self$`principal_guid` <- this_object$`principal_guid`
      if (!is.null(this_object$`principal_type`) && !(this_object$`principal_type` %in% c("user", "group"))) {
        stop(paste("Error! \"", this_object$`principal_type`, "\" cannot be assigned to `principal_type`. Must be \"user\", \"group\".", sep = ""))
      }
      self$`principal_type` <- this_object$`principal_type`
      if (!is.null(this_object$`role`) && !(this_object$`role` %in% c("viewer", "owner"))) {
        stop(paste("Error! \"", this_object$`role`, "\" cannot be assigned to `role`. Must be \"viewer\", \"owner\".", sep = ""))
      }
      self$`role` <- this_object$`role`
      self
    },
    #' Validate JSON input with respect to Permission
    #'
    #' @description
    #' Validate JSON input with respect to Permission and throw an exception if invalid
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
    #' @return String representation of Permission
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
# Permission$unlock()
#
## Below is an example to define the print function
# Permission$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Permission$lock()

