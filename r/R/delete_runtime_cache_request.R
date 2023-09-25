#' Create a new DeleteRuntimeCacheRequest
#'
#' @description
#' Fields that describe the runtime cache to delete.
#'
#' @docType class
#' @title DeleteRuntimeCacheRequest
#' @description DeleteRuntimeCacheRequest Class
#' @format An \code{R6Class} generator object
#' @field language The language of the target cache; either \"R\" or \"Python\". character [optional]
#' @field version The version of the target cache. character [optional]
#' @field image_name The execution environment of the target cache; either \"Local\" or an image name or identifier. character [optional]
#' @field dry_run When true, check input but do not delete cache. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
DeleteRuntimeCacheRequest <- R6::R6Class(
  "DeleteRuntimeCacheRequest",
  public = list(
    `language` = NULL,
    `version` = NULL,
    `image_name` = NULL,
    `dry_run` = NULL,
    #' Initialize a new DeleteRuntimeCacheRequest class.
    #'
    #' @description
    #' Initialize a new DeleteRuntimeCacheRequest class.
    #'
    #' @param language The language of the target cache; either \"R\" or \"Python\".
    #' @param version The version of the target cache.
    #' @param image_name The execution environment of the target cache; either \"Local\" or an image name or identifier.
    #' @param dry_run When true, check input but do not delete cache.. Default to FALSE.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`language` = NULL, `version` = NULL, `image_name` = NULL, `dry_run` = FALSE, ...) {
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
      if (!is.null(`dry_run`)) {
        if (!(is.logical(`dry_run`) && length(`dry_run`) == 1)) {
          stop(paste("Error! Invalid data for `dry_run`. Must be a boolean:", `dry_run`))
        }
        self$`dry_run` <- `dry_run`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return DeleteRuntimeCacheRequest in JSON format
    #' @export
    toJSON = function() {
      DeleteRuntimeCacheRequestObject <- list()
      if (!is.null(self$`language`)) {
        DeleteRuntimeCacheRequestObject[["language"]] <-
          self$`language`
      }
      if (!is.null(self$`version`)) {
        DeleteRuntimeCacheRequestObject[["version"]] <-
          self$`version`
      }
      if (!is.null(self$`image_name`)) {
        DeleteRuntimeCacheRequestObject[["image_name"]] <-
          self$`image_name`
      }
      if (!is.null(self$`dry_run`)) {
        DeleteRuntimeCacheRequestObject[["dry_run"]] <-
          self$`dry_run`
      }
      DeleteRuntimeCacheRequestObject
    },
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of DeleteRuntimeCacheRequest
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
      if (!is.null(this_object$`dry_run`)) {
        self$`dry_run` <- this_object$`dry_run`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return DeleteRuntimeCacheRequest in JSON format
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
        if (!is.null(self$`dry_run`)) {
          sprintf(
          '"dry_run":
            %s
                    ',
          tolower(self$`dry_run`)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of DeleteRuntimeCacheRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of DeleteRuntimeCacheRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`language` <- this_object$`language`
      self$`version` <- this_object$`version`
      self$`image_name` <- this_object$`image_name`
      self$`dry_run` <- this_object$`dry_run`
      self
    },
    #' Validate JSON input with respect to DeleteRuntimeCacheRequest
    #'
    #' @description
    #' Validate JSON input with respect to DeleteRuntimeCacheRequest and throw an exception if invalid
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
    #' @return String representation of DeleteRuntimeCacheRequest
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
# DeleteRuntimeCacheRequest$unlock()
#
## Below is an example to define the print function
# DeleteRuntimeCacheRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# DeleteRuntimeCacheRequest$lock()

