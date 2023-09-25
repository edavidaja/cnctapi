#' Create a new AuditPager
#'
#' @description
#' Paging object that can be used for navigation
#'
#' @docType class
#' @title AuditPager
#' @description AuditPager Class
#' @format An \code{R6Class} generator object
#' @field cursors  \link{AuditPagerCursors}
#' @field first A full URL of the first page of results.  It will be `null` if the current response represents the first page of results. character
#' @field previous A full URL of the previous page of results when the curent request was made.  It will be `null` if the current response represents the first page of results. character
#' @field next A full URL of the next page of results when the current request was made.  It will be `null` if the current response represents the last page of results. character
#' @field last A full URL of the last page of results.  It will be `null` if the current response represents the last page of results. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
AuditPager <- R6::R6Class(
  "AuditPager",
  public = list(
    `cursors` = NULL,
    `first` = NULL,
    `previous` = NULL,
    `next` = NULL,
    `last` = NULL,
    #' Initialize a new AuditPager class.
    #'
    #' @description
    #' Initialize a new AuditPager class.
    #'
    #' @param cursors cursors
    #' @param first A full URL of the first page of results.  It will be `null` if the current response represents the first page of results.
    #' @param previous A full URL of the previous page of results when the curent request was made.  It will be `null` if the current response represents the first page of results.
    #' @param next A full URL of the next page of results when the current request was made.  It will be `null` if the current response represents the last page of results.
    #' @param last A full URL of the last page of results.  It will be `null` if the current response represents the last page of results.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`cursors`, `first`, `previous`, `next`, `last`, ...) {
      if (!missing(`cursors`)) {
        stopifnot(R6::is.R6(`cursors`))
        self$`cursors` <- `cursors`
      }
      if (!missing(`first`)) {
        if (!(is.character(`first`) && length(`first`) == 1)) {
          stop(paste("Error! Invalid data for `first`. Must be a string:", `first`))
        }
        self$`first` <- `first`
      }
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
      if (!missing(`last`)) {
        if (!(is.character(`last`) && length(`last`) == 1)) {
          stop(paste("Error! Invalid data for `last`. Must be a string:", `last`))
        }
        self$`last` <- `last`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditPager in JSON format
    #' @export
    toJSON = function() {
      AuditPagerObject <- list()
      if (!is.null(self$`cursors`)) {
        AuditPagerObject[["cursors"]] <-
          self$`cursors`$toJSON()
      }
      if (!is.null(self$`first`)) {
        AuditPagerObject[["first"]] <-
          self$`first`
      }
      if (!is.null(self$`previous`)) {
        AuditPagerObject[["previous"]] <-
          self$`previous`
      }
      if (!is.null(self$`next`)) {
        AuditPagerObject[["next"]] <-
          self$`next`
      }
      if (!is.null(self$`last`)) {
        AuditPagerObject[["last"]] <-
          self$`last`
      }
      AuditPagerObject
    },
    #' Deserialize JSON string into an instance of AuditPager
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditPager
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditPager
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`cursors`)) {
        `cursors_object` <- AuditPagerCursors$new()
        `cursors_object`$fromJSON(jsonlite::toJSON(this_object$`cursors`, auto_unbox = TRUE, digits = NA))
        self$`cursors` <- `cursors_object`
      }
      if (!is.null(this_object$`first`)) {
        self$`first` <- this_object$`first`
      }
      if (!is.null(this_object$`previous`)) {
        self$`previous` <- this_object$`previous`
      }
      if (!is.null(this_object$`next`)) {
        self$`next` <- this_object$`next`
      }
      if (!is.null(this_object$`last`)) {
        self$`last` <- this_object$`last`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return AuditPager in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`cursors`)) {
          sprintf(
          '"cursors":
          %s
          ',
          jsonlite::toJSON(self$`cursors`$toJSON(), auto_unbox = TRUE, digits = NA)
          )
        },
        if (!is.null(self$`first`)) {
          sprintf(
          '"first":
            "%s"
                    ',
          self$`first`
          )
        },
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
        },
        if (!is.null(self$`last`)) {
          sprintf(
          '"last":
            "%s"
                    ',
          self$`last`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of AuditPager
    #'
    #' @description
    #' Deserialize JSON string into an instance of AuditPager
    #'
    #' @param input_json the JSON input
    #' @return the instance of AuditPager
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`cursors` <- AuditPagerCursors$new()$fromJSON(jsonlite::toJSON(this_object$`cursors`, auto_unbox = TRUE, digits = NA))
      self$`first` <- this_object$`first`
      self$`previous` <- this_object$`previous`
      self$`next` <- this_object$`next`
      self$`last` <- this_object$`last`
      self
    },
    #' Validate JSON input with respect to AuditPager
    #'
    #' @description
    #' Validate JSON input with respect to AuditPager and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `cursors`
      if (!is.null(input_json$`cursors`)) {
        stopifnot(R6::is.R6(input_json$`cursors`))
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPager: the required field `cursors` is missing."))
      }
      # check the required field `first`
      if (!is.null(input_json$`first`)) {
        if (!(is.character(input_json$`first`) && length(input_json$`first`) == 1)) {
          stop(paste("Error! Invalid data for `first`. Must be a string:", input_json$`first`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPager: the required field `first` is missing."))
      }
      # check the required field `previous`
      if (!is.null(input_json$`previous`)) {
        if (!(is.character(input_json$`previous`) && length(input_json$`previous`) == 1)) {
          stop(paste("Error! Invalid data for `previous`. Must be a string:", input_json$`previous`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPager: the required field `previous` is missing."))
      }
      # check the required field `next`
      if (!is.null(input_json$`next`)) {
        if (!(is.character(input_json$`next`) && length(input_json$`next`) == 1)) {
          stop(paste("Error! Invalid data for `next`. Must be a string:", input_json$`next`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPager: the required field `next` is missing."))
      }
      # check the required field `last`
      if (!is.null(input_json$`last`)) {
        if (!(is.character(input_json$`last`) && length(input_json$`last`) == 1)) {
          stop(paste("Error! Invalid data for `last`. Must be a string:", input_json$`last`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for AuditPager: the required field `last` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of AuditPager
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
      # check if the required `cursors` is null
      if (is.null(self$`cursors`)) {
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
      # check if the required `cursors` is null
      if (is.null(self$`cursors`)) {
        invalid_fields["cursors"] <- "Non-nullable required field `cursors` cannot be null."
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
# AuditPager$unlock()
#
## Below is an example to define the print function
# AuditPager$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# AuditPager$lock()

