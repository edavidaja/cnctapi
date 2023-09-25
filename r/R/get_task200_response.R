#' Create a new GetTask200Response
#'
#' @description
#' The task tracks the output and status of some operation being performed by Posit Connect. It is most commonly used to contain details about the progress of a deployment operation.
#'
#' @docType class
#' @title GetTask200Response
#' @description GetTask200Response Class
#' @format An \code{R6Class} generator object
#' @field id The identifier for this task. character [optional]
#' @field output An array containing lines of output produced by the task. The initial line of output is dictated by the `first` input parameter. The offset of the last output line is indicated by the `last` response field. list(character) [optional]
#' @field finished Indicates that a task has completed. character [optional]
#' @field code Numeric indication as to the cause of an error. Non-zero when an error has occured. integer [optional]
#' @field error Description of the error. An empty string when no error has occurred. character [optional]
#' @field last The total number of output lines produced so far. Use as the value to `first` in the next request to only fetch output lines beyond what you have already received. integer [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
GetTask200Response <- R6::R6Class(
  "GetTask200Response",
  public = list(
    `id` = NULL,
    `output` = NULL,
    `finished` = NULL,
    `code` = NULL,
    `error` = NULL,
    `last` = NULL,
    #' Initialize a new GetTask200Response class.
    #'
    #' @description
    #' Initialize a new GetTask200Response class.
    #'
    #' @param id The identifier for this task.
    #' @param output An array containing lines of output produced by the task. The initial line of output is dictated by the `first` input parameter. The offset of the last output line is indicated by the `last` response field.
    #' @param finished Indicates that a task has completed.
    #' @param code Numeric indication as to the cause of an error. Non-zero when an error has occured.
    #' @param error Description of the error. An empty string when no error has occurred.
    #' @param last The total number of output lines produced so far. Use as the value to `first` in the next request to only fetch output lines beyond what you have already received.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `output` = NULL, `finished` = NULL, `code` = NULL, `error` = NULL, `last` = NULL, ...) {
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!is.null(`output`)) {
        stopifnot(is.vector(`output`), length(`output`) != 0)
        sapply(`output`, function(x) stopifnot(is.character(x)))
        self$`output` <- `output`
      }
      if (!is.null(`finished`)) {
        if (!(is.logical(`finished`) && length(`finished`) == 1)) {
          stop(paste("Error! Invalid data for `finished`. Must be a boolean:", `finished`))
        }
        self$`finished` <- `finished`
      }
      if (!is.null(`code`)) {
        if (!(is.numeric(`code`) && length(`code`) == 1)) {
          stop(paste("Error! Invalid data for `code`. Must be an integer:", `code`))
        }
        self$`code` <- `code`
      }
      if (!is.null(`error`)) {
        if (!(is.character(`error`) && length(`error`) == 1)) {
          stop(paste("Error! Invalid data for `error`. Must be a string:", `error`))
        }
        self$`error` <- `error`
      }
      if (!is.null(`last`)) {
        if (!(is.numeric(`last`) && length(`last`) == 1)) {
          stop(paste("Error! Invalid data for `last`. Must be an integer:", `last`))
        }
        self$`last` <- `last`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GetTask200Response in JSON format
    #' @export
    toJSON = function() {
      GetTask200ResponseObject <- list()
      if (!is.null(self$`id`)) {
        GetTask200ResponseObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`output`)) {
        GetTask200ResponseObject[["output"]] <-
          self$`output`
      }
      if (!is.null(self$`finished`)) {
        GetTask200ResponseObject[["finished"]] <-
          self$`finished`
      }
      if (!is.null(self$`code`)) {
        GetTask200ResponseObject[["code"]] <-
          self$`code`
      }
      if (!is.null(self$`error`)) {
        GetTask200ResponseObject[["error"]] <-
          self$`error`
      }
      if (!is.null(self$`last`)) {
        GetTask200ResponseObject[["last"]] <-
          self$`last`
      }
      GetTask200ResponseObject
    },
    #' Deserialize JSON string into an instance of GetTask200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of GetTask200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of GetTask200Response
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`output`)) {
        self$`output` <- ApiClient$new()$deserializeObj(this_object$`output`, "array[character]", loadNamespace("connectapi2"))
      }
      if (!is.null(this_object$`finished`)) {
        self$`finished` <- this_object$`finished`
      }
      if (!is.null(this_object$`code`)) {
        self$`code` <- this_object$`code`
      }
      if (!is.null(this_object$`error`)) {
        self$`error` <- this_object$`error`
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
    #' @return GetTask200Response in JSON format
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
        if (!is.null(self$`output`)) {
          sprintf(
          '"output":
             [%s]
          ',
          paste(unlist(lapply(self$`output`, function(x) paste0('"', x, '"'))), collapse = ",")
          )
        },
        if (!is.null(self$`finished`)) {
          sprintf(
          '"finished":
            %s
                    ',
          tolower(self$`finished`)
          )
        },
        if (!is.null(self$`code`)) {
          sprintf(
          '"code":
            %d
                    ',
          self$`code`
          )
        },
        if (!is.null(self$`error`)) {
          sprintf(
          '"error":
            "%s"
                    ',
          self$`error`
          )
        },
        if (!is.null(self$`last`)) {
          sprintf(
          '"last":
            %d
                    ',
          self$`last`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of GetTask200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of GetTask200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of GetTask200Response
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`output` <- ApiClient$new()$deserializeObj(this_object$`output`, "array[character]", loadNamespace("connectapi2"))
      self$`finished` <- this_object$`finished`
      self$`code` <- this_object$`code`
      self$`error` <- this_object$`error`
      self$`last` <- this_object$`last`
      self
    },
    #' Validate JSON input with respect to GetTask200Response
    #'
    #' @description
    #' Validate JSON input with respect to GetTask200Response and throw an exception if invalid
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
    #' @return String representation of GetTask200Response
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
# GetTask200Response$unlock()
#
## Below is an example to define the print function
# GetTask200Response$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# GetTask200Response$lock()

