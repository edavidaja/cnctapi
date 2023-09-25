#' Create a new Tag
#'
#' @description
#' Defines a tag which is used to organize content within Connect.
#'
#' @docType class
#' @title Tag
#' @description Tag Class
#' @format An \code{R6Class} generator object
#' @field id The identifier for the tag. character [optional]
#' @field name The name of the tag. character [optional]
#' @field parent_id The identifier for the parent tag. If there is no parent_id, the tag is a top-level tag. character [optional]
#' @field created_time The timestamp (RFC3339) indicating when the tag was created. character [optional]
#' @field updated_time The timestamp (RFC3339) indicating when the tag was created. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Tag <- R6::R6Class(
  "Tag",
  public = list(
    `id` = NULL,
    `name` = NULL,
    `parent_id` = NULL,
    `created_time` = NULL,
    `updated_time` = NULL,
    #' Initialize a new Tag class.
    #'
    #' @description
    #' Initialize a new Tag class.
    #'
    #' @param id The identifier for the tag.
    #' @param name The name of the tag.
    #' @param parent_id The identifier for the parent tag. If there is no parent_id, the tag is a top-level tag.. Default to "null".
    #' @param created_time The timestamp (RFC3339) indicating when the tag was created.
    #' @param updated_time The timestamp (RFC3339) indicating when the tag was created.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `name` = NULL, `parent_id` = "null", `created_time` = NULL, `updated_time` = NULL, ...) {
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!is.null(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`parent_id`)) {
        if (!(is.character(`parent_id`) && length(`parent_id`) == 1)) {
          stop(paste("Error! Invalid data for `parent_id`. Must be a string:", `parent_id`))
        }
        self$`parent_id` <- `parent_id`
      }
      if (!is.null(`created_time`)) {
        if (!is.character(`created_time`)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", `created_time`))
        }
        self$`created_time` <- `created_time`
      }
      if (!is.null(`updated_time`)) {
        if (!is.character(`updated_time`)) {
          stop(paste("Error! Invalid data for `updated_time`. Must be a string:", `updated_time`))
        }
        self$`updated_time` <- `updated_time`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Tag in JSON format
    #' @export
    toJSON = function() {
      TagObject <- list()
      if (!is.null(self$`id`)) {
        TagObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`name`)) {
        TagObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`parent_id`)) {
        TagObject[["parent_id"]] <-
          self$`parent_id`
      }
      if (!is.null(self$`created_time`)) {
        TagObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`updated_time`)) {
        TagObject[["updated_time"]] <-
          self$`updated_time`
      }
      TagObject
    },
    #' Deserialize JSON string into an instance of Tag
    #'
    #' @description
    #' Deserialize JSON string into an instance of Tag
    #'
    #' @param input_json the JSON input
    #' @return the instance of Tag
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`parent_id`)) {
        self$`parent_id` <- this_object$`parent_id`
      }
      if (!is.null(this_object$`created_time`)) {
        self$`created_time` <- this_object$`created_time`
      }
      if (!is.null(this_object$`updated_time`)) {
        self$`updated_time` <- this_object$`updated_time`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Tag in JSON format
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
        if (!is.null(self$`name`)) {
          sprintf(
          '"name":
            "%s"
                    ',
          self$`name`
          )
        },
        if (!is.null(self$`parent_id`)) {
          sprintf(
          '"parent_id":
            "%s"
                    ',
          self$`parent_id`
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
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Tag
    #'
    #' @description
    #' Deserialize JSON string into an instance of Tag
    #'
    #' @param input_json the JSON input
    #' @return the instance of Tag
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`name` <- this_object$`name`
      self$`parent_id` <- this_object$`parent_id`
      self$`created_time` <- this_object$`created_time`
      self$`updated_time` <- this_object$`updated_time`
      self
    },
    #' Validate JSON input with respect to Tag
    #'
    #' @description
    #' Validate JSON input with respect to Tag and throw an exception if invalid
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
    #' @return String representation of Tag
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
# Tag$unlock()
#
## Below is an example to define the print function
# Tag$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Tag$lock()

