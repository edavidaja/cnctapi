#' Create a new AuditPagerCursors
#'
#' @description
#' Cursors that can be used for navigation
#'
#' @docType class
#' @title AuditPagerCursors
#' @description AuditPagerCursors Class
#' @format An \code{R6Class} generator object
#' @field previous A cursor ID that can be used with the `previous` query param to get the previous page of results. character
#' @field next A cursor ID that can be used with the `next` query param to get the next page of results. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AuditPagerCursors <- R6::R6Class(
  "AuditPagerCursors",
  public = list(
    `previous` = NULL,
    `next` = NULL,
    #' Initialize a new AuditPagerCursors class.
    #'
    #' @description
    #' Initialize a new AuditPagerCursors class.
    #'
    #' @param previous A cursor ID that can be used with the `previous` query param to get the previous page of results.
    #' @param next A cursor ID that can be used with the `next` query param to get the next page of results.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`previous`, `next`, ...) {
      if (!missing(`previous`)) {
        if (!(is.character(`previous`) && length(`previous`) == 1)) {
          stop(paste("Error! Invalid data for `previous`. Must be a string:", `previous`))
        }
        self$`previous` <- `previous`
      }
      if (!missing(`next`)) {
        if (!(is.character(`next`) && length(`next`) == 1)) {
          stop(paste("Error! Invalid data for `next`. Must be a string:", `next`))
        }
        self$`next` <- `next`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditPagerCursors in JSON format
    #' @export
    toJSON = function() {
      AuditPagerCursorsObject <- list()
      if (!is.null(self$`previous`)) {
        AuditPagerCursorsObject[["previous"]] <-
          self$`previous`
      }
      if (!is.null(self$`next`)) {
        AuditPagerCursorsObject[["next"]] <-
          self$`next`
      }
      AuditPagerCursorsObject
    },
    #' Deserialize JSON string into an instance of AuditPagerCursors
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditPagerCursors
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditPagerCursors
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`previous`)) {
        self$`previous` <- this_object$`previous`
      }
      if (!is.null(this_object$`next`)) {
        self$`next` <- this_object$`next`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditPagerCursors in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`previous`)) {
          sprintf(
          '"previous":
            "%s"
                    ',
          self$`previous`
          )
        },
        if (!is.null(self$`next`)) {
          sprintf(
          '"next":
            "%s"
                    ',
          self$`next`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of AuditPagerCursors
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditPagerCursors
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditPagerCursors
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`previous` <- this_object$`previous`
      self$`next` <- this_object$`next`
      self
    },
    #' Validate JSON input with respect to AuditPagerCursors
    #'
    #' @description
    #' Validate JSON input with respect to AuditPagerCursors and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `previous`
      if (!is.null(input_json$`previous`)) {
        if (!(is.character(input_json$`previous`) && length(input_json$`previous`) == 1)) {
          stop(paste("Error! Invalid data for `previous`. Must be a string:", input_json$`previous`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPagerCursors: the required field `previous` is missing."))
      }
      # check the required field `next`
      if (!is.null(input_json$`next`)) {
        if (!(is.character(input_json$`next`) && length(input_json$`next`) == 1)) {
          stop(paste("Error! Invalid data for `next`. Must be a string:", input_json$`next`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPagerCursors: the required field `next` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of AuditPagerCursors
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
# AuditPagerCursors$unlock()
#
## Below is an example to define the print function
# AuditPagerCursors$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AuditPagerCursors$lock()

