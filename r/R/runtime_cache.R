#' Create a new RuntimeCache
#'
#' @description
#' A cache of installed packages for a given language, version, and execution environment.
#'
#' @docType class
#' @title RuntimeCache
#' @description RuntimeCache Class
#' @format An \code{R6Class} generator object
#' @field language The runtime language of the cache. character [optional]
#' @field version The language version of the cache. character [optional]
#' @field image_name The name of the cache's execution environment. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
RuntimeCache <- R6::R6Class(
  "RuntimeCache",
  public = list(
    `language` = NULL,
    `version` = NULL,
    `image_name` = NULL,
    #' Initialize a new RuntimeCache class.
    #'
    #' @description
    #' Initialize a new RuntimeCache class.
    #'
    #' @param language The runtime language of the cache.
    #' @param version The language version of the cache.
    #' @param image_name The name of the cache's execution environment.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`language` = NULL, `version` = NULL, `image_name` = NULL, ...) {
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
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return RuntimeCache in JSON format
    #' @export
    toJSON = function() {
      RuntimeCacheObject <- list()
      if (!is.null(self$`language`)) {
        RuntimeCacheObject[["language"]] <-
          self$`language`
      }
      if (!is.null(self$`version`)) {
        RuntimeCacheObject[["version"]] <-
          self$`version`
      }
      if (!is.null(self$`image_name`)) {
        RuntimeCacheObject[["image_name"]] <-
          self$`image_name`
      }
      RuntimeCacheObject
    },
    #' Deserialize JSON string into an instance of RuntimeCache
    #'
    #' @description
    #' Deserialize JSON string into an instance of RuntimeCache
    #'
    #' @param input_json the JSON input
    #' @return the instance of RuntimeCache
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
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return RuntimeCache in JSON format
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
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of RuntimeCache
    #'
    #' @description
    #' Deserialize JSON string into an instance of RuntimeCache
    #'
    #' @param input_json the JSON input
    #' @return the instance of RuntimeCache
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`language` <- this_object$`language`
      self$`version` <- this_object$`version`
      self$`image_name` <- this_object$`image_name`
      self
    },
    #' Validate JSON input with respect to RuntimeCache
    #'
    #' @description
    #' Validate JSON input with respect to RuntimeCache and throw an exception if invalid
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
    #' @return String representation of RuntimeCache
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
# RuntimeCache$unlock()
#
## Below is an example to define the print function
# RuntimeCache$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# RuntimeCache$lock()

