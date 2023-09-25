#' Create a new AddContentPermissionRequest
#'
#' @description
#' The fields that can be specified when creating or updating a content permission item.
#'
#' @docType class
#' @title AddContentPermissionRequest
#' @description AddContentPermissionRequest Class
#' @format An \code{R6Class} generator object
#' @field principal_guid The identifier of the principal (user or group). character [optional]
#' @field principal_type The type of principal. character [optional]
#' @field role The level of access that the principal has been given to this content item. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AddContentPermissionRequest <- R6::R6Class(
  "AddContentPermissionRequest",
  public = list(
    `principal_guid` = NULL,
    `principal_type` = NULL,
    `role` = NULL,
    #' Initialize a new AddContentPermissionRequest class.
    #'
    #' @description
    #' Initialize a new AddContentPermissionRequest class.
    #'
    #' @param principal_guid The identifier of the principal (user or group).
    #' @param principal_type The type of principal.
    #' @param role The level of access that the principal has been given to this content item.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`principal_guid` = NULL, `principal_type` = NULL, `role` = NULL, ...) {
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
    #' @return AddContentPermissionRequest in JSON format
    #' @export
    toJSON = function() {
      AddContentPermissionRequestObject <- list()
      if (!is.null(self$`principal_guid`)) {
        AddContentPermissionRequestObject[["principal_guid"]] <-
          self$`principal_guid`
      }
      if (!is.null(self$`principal_type`)) {
        AddContentPermissionRequestObject[["principal_type"]] <-
          self$`principal_type`
      }
      if (!is.null(self$`role`)) {
        AddContentPermissionRequestObject[["role"]] <-
          self$`role`
      }
      AddContentPermissionRequestObject
    },
    #' Deserialize JSON string into an instance of AddContentPermissionRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddContentPermissionRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddContentPermissionRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
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
    #' @return AddContentPermissionRequest in JSON format
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
    #' Deserialize JSON string into an instance of AddContentPermissionRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of AddContentPermissionRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of AddContentPermissionRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
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
    #' Validate JSON input with respect to AddContentPermissionRequest
    #'
    #' @description
    #' Validate JSON input with respect to AddContentPermissionRequest and throw an exception if invalid
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
    #' @return String representation of AddContentPermissionRequest
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
# AddContentPermissionRequest$unlock()
#
## Below is an example to define the print function
# AddContentPermissionRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AddContentPermissionRequest$lock()

