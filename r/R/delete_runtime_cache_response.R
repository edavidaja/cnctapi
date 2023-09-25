#' Create a new DeleteRuntimeCacheResponse
#'
#' @description
#' DeleteRuntimeCacheResponse Class
#'
#' @docType class
#' @title DeleteRuntimeCacheResponse
#' @description DeleteRuntimeCacheResponse Class
#' @format An \code{R6Class} generator object
#' @field language The runtime language of the target cache. character [optional]
#' @field version The language version of the target cache. character [optional]
#' @field image_name The name of the target cache's execution environment. character [optional]
#' @field task_id The identifier for the created deployment task. Always `null` for dry-run requests. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
DeleteRuntimeCacheResponse <- R6::R6Class(
  "DeleteRuntimeCacheResponse",
  public = list(
    `language` = NULL,
    `version` = NULL,
    `image_name` = NULL,
    `task_id` = NULL,
    #' Initialize a new DeleteRuntimeCacheResponse class.
    #'
    #' @description
    #' Initialize a new DeleteRuntimeCacheResponse class.
    #'
    #' @param language The runtime language of the target cache.
    #' @param version The language version of the target cache.
    #' @param image_name The name of the target cache's execution environment.
    #' @param task_id The identifier for the created deployment task. Always `null` for dry-run requests.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`language` = NULL, `version` = NULL, `image_name` = NULL, `task_id` = NULL, ...) {
      if (!is.null(`language`)) {
        if (!(is.character(`language`) && length(`language`) == 1)) {
          stop(paste("Error! Invalid data for `language`. Must be a string:", `language`))
        }
        self$`language` <- `language`
      }
      if (!is.null(`version`)) {
        if (!(is.character(`version`) && length(`version`) == 1)) {
          stop(paste("Error! Invalid data for `version`. Must be a string:", `version`))
        }
        self$`version` <- `version`
      }
      if (!is.null(`image_name`)) {
        if (!(is.character(`image_name`) && length(`image_name`) == 1)) {
          stop(paste("Error! Invalid data for `image_name`. Must be a string:", `image_name`))
        }
        self$`image_name` <- `image_name`
      }
      if (!is.null(`task_id`)) {
        if (!(is.character(`task_id`) && length(`task_id`) == 1)) {
          stop(paste("Error! Invalid data for `task_id`. Must be a string:", `task_id`))
        }
        self$`task_id` <- `task_id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return DeleteRuntimeCacheResponse in JSON format
    #' @export
    toJSON = function() {
      DeleteRuntimeCacheResponseObject <- list()
      if (!is.null(self$`language`)) {
        DeleteRuntimeCacheResponseObject[["language"]] <-
          self$`language`
      }
      if (!is.null(self$`version`)) {
        DeleteRuntimeCacheResponseObject[["version"]] <-
          self$`version`
      }
      if (!is.null(self$`image_name`)) {
        DeleteRuntimeCacheResponseObject[["image_name"]] <-
          self$`image_name`
      }
      if (!is.null(self$`task_id`)) {
        DeleteRuntimeCacheResponseObject[["task_id"]] <-
          self$`task_id`
      }
      DeleteRuntimeCacheResponseObject
    },
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheResponse
    #'
    #' @description
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of DeleteRuntimeCacheResponse
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`language`)) {
        self$`language` <- this_object$`language`
      }
      if (!is.null(this_object$`version`)) {
        self$`version` <- this_object$`version`
      }
      if (!is.null(this_object$`image_name`)) {
        self$`image_name` <- this_object$`image_name`
      }
      if (!is.null(this_object$`task_id`)) {
        self$`task_id` <- this_object$`task_id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return DeleteRuntimeCacheResponse in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`language`)) {
          sprintf(
          '"language":
            "%s"
                    ',
          self$`language`
          )
        },
        if (!is.null(self$`version`)) {
          sprintf(
          '"version":
            "%s"
                    ',
          self$`version`
          )
        },
        if (!is.null(self$`image_name`)) {
          sprintf(
          '"image_name":
            "%s"
                    ',
          self$`image_name`
          )
        },
        if (!is.null(self$`task_id`)) {
          sprintf(
          '"task_id":
            "%s"
                    ',
          self$`task_id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheResponse
    #'
    #' @description
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheResponse
    #'
    #' @param input_json the JSON input
    #' @return the instance of DeleteRuntimeCacheResponse
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`language` <- this_object$`language`
      self$`version` <- this_object$`version`
      self$`image_name` <- this_object$`image_name`
      self$`task_id` <- this_object$`task_id`
      self
    },
    #' Validate JSON input with respect to DeleteRuntimeCacheResponse
    #'
    #' @description
    #' Validate JSON input with respect to DeleteRuntimeCacheResponse and throw an exception if invalid
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
    #' @return String representation of DeleteRuntimeCacheResponse
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
# DeleteRuntimeCacheResponse$unlock()
#
## Below is an example to define the print function
# DeleteRuntimeCacheResponse$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# DeleteRuntimeCacheResponse$lock()

