#' Create a new GroupOwnershipPermission
#'
#' @description
#' GroupOwnershipPermission Class
#'
#' @docType class
#' @title GroupOwnershipPermission
#' @description GroupOwnershipPermission Class
#' @format An \code{R6Class} generator object
#' @field principal_guid The identifier of the principal (user or group) with access to the content. character [optional]
#' @field principal_name The name of the principal (user or group) with access to the content. character [optional]
#' @field principal_role The role of the principal (user or group) with access to the content. character [optional]
#' @field principal_type The type of the principal (user or group) with access to the content. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
GroupOwnershipPermission <- R6::R6Class(
  "GroupOwnershipPermission",
  public = list(
    `principal_guid` = NULL,
    `principal_name` = NULL,
    `principal_role` = NULL,
    `principal_type` = NULL,
    #' Initialize a new GroupOwnershipPermission class.
    #'
    #' @description
    #' Initialize a new GroupOwnershipPermission class.
    #'
    #' @param principal_guid The identifier of the principal (user or group) with access to the content.
    #' @param principal_name The name of the principal (user or group) with access to the content.
    #' @param principal_role The role of the principal (user or group) with access to the content.
    #' @param principal_type The type of the principal (user or group) with access to the content.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`principal_guid` = NULL, `principal_name` = NULL, `principal_role` = NULL, `principal_type` = NULL, ...) {
      if (!is.null(`principal_guid`)) {
        if (!(is.character(`principal_guid`) && length(`principal_guid`) == 1)) {
          stop(paste("Error! Invalid data for `principal_guid`. Must be a string:", `principal_guid`))
        }
        self$`principal_guid` <- `principal_guid`
      }
      if (!is.null(`principal_name`)) {
        if (!(is.character(`principal_name`) && length(`principal_name`) == 1)) {
          stop(paste("Error! Invalid data for `principal_name`. Must be a string:", `principal_name`))
        }
        self$`principal_name` <- `principal_name`
      }
      if (!is.null(`principal_role`)) {
        if (!(`principal_role` %in% c("author", "viewer", "publisher"))) {
          stop(paste("Error! \"", `principal_role`, "\" cannot be assigned to `principal_role`. Must be \"author\", \"viewer\", \"publisher\".", sep = ""))
        }
        if (!(is.character(`principal_role`) && length(`principal_role`) == 1)) {
          stop(paste("Error! Invalid data for `principal_role`. Must be a string:", `principal_role`))
        }
        self$`principal_role` <- `principal_role`
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
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GroupOwnershipPermission in JSON format
    #' @export
    toJSON = function() {
      GroupOwnershipPermissionObject <- list()
      if (!is.null(self$`principal_guid`)) {
        GroupOwnershipPermissionObject[["principal_guid"]] <-
          self$`principal_guid`
      }
      if (!is.null(self$`principal_name`)) {
        GroupOwnershipPermissionObject[["principal_name"]] <-
          self$`principal_name`
      }
      if (!is.null(self$`principal_role`)) {
        GroupOwnershipPermissionObject[["principal_role"]] <-
          self$`principal_role`
      }
      if (!is.null(self$`principal_type`)) {
        GroupOwnershipPermissionObject[["principal_type"]] <-
          self$`principal_type`
      }
      GroupOwnershipPermissionObject
    },
    #' Deserialize JSON string into an instance of GroupOwnershipPermission
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupOwnershipPermission
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupOwnershipPermission
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`principal_guid`)) {
        self$`principal_guid` <- this_object$`principal_guid`
      }
      if (!is.null(this_object$`principal_name`)) {
        self$`principal_name` <- this_object$`principal_name`
      }
      if (!is.null(this_object$`principal_role`)) {
        if (!is.null(this_object$`principal_role`) && !(this_object$`principal_role` %in% c("author", "viewer", "publisher"))) {
          stop(paste("Error! \"", this_object$`principal_role`, "\" cannot be assigned to `principal_role`. Must be \"author\", \"viewer\", \"publisher\".", sep = ""))
        }
        self$`principal_role` <- this_object$`principal_role`
      }
      if (!is.null(this_object$`principal_type`)) {
        if (!is.null(this_object$`principal_type`) && !(this_object$`principal_type` %in% c("user", "group"))) {
          stop(paste("Error! \"", this_object$`principal_type`, "\" cannot be assigned to `principal_type`. Must be \"user\", \"group\".", sep = ""))
        }
        self$`principal_type` <- this_object$`principal_type`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GroupOwnershipPermission in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`principal_guid`)) {
          sprintf(
          '"principal_guid":
            "%s"
                    ',
          self$`principal_guid`
          )
        },
        if (!is.null(self$`principal_name`)) {
          sprintf(
          '"principal_name":
            "%s"
                    ',
          self$`principal_name`
          )
        },
        if (!is.null(self$`principal_role`)) {
          sprintf(
          '"principal_role":
            "%s"
                    ',
          self$`principal_role`
          )
        },
        if (!is.null(self$`principal_type`)) {
          sprintf(
          '"principal_type":
            "%s"
                    ',
          self$`principal_type`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of GroupOwnershipPermission
    #'
    #' @description
    #' Deserialize JSON string into an instance of GroupOwnershipPermission
    #'
    #' @param input_json the JSON input
    #' @return the instance of GroupOwnershipPermission
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`principal_guid` <- this_object$`principal_guid`
      self$`principal_name` <- this_object$`principal_name`
      if (!is.null(this_object$`principal_role`) && !(this_object$`principal_role` %in% c("author", "viewer", "publisher"))) {
        stop(paste("Error! \"", this_object$`principal_role`, "\" cannot be assigned to `principal_role`. Must be \"author\", \"viewer\", \"publisher\".", sep = ""))
      }
      self$`principal_role` <- this_object$`principal_role`
      if (!is.null(this_object$`principal_type`) && !(this_object$`principal_type` %in% c("user", "group"))) {
        stop(paste("Error! \"", this_object$`principal_type`, "\" cannot be assigned to `principal_type`. Must be \"user\", \"group\".", sep = ""))
      }
      self$`principal_type` <- this_object$`principal_type`
      self
    },
    #' Validate JSON input with respect to GroupOwnershipPermission
    #'
    #' @description
    #' Validate JSON input with respect to GroupOwnershipPermission and throw an exception if invalid
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
    #' @return String representation of GroupOwnershipPermission
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
# GroupOwnershipPermission$unlock()
#
## Below is an example to define the print function
# GroupOwnershipPermission$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# GroupOwnershipPermission$lock()

