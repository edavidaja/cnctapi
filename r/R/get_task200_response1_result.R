#' Create a new GetTask200Response1Result
#'
#' @description
#' A value representing the result of the operation, if any. For deployment tasks, this value is `null`.
#'
#' @docType class
#' @title GetTask200Response1Result
#' @description GetTask200Response1Result Class
#' @format An \code{R6Class} generator object
#' @field type The type of data returned. character [optional]
#' @field data The data produced by this task. object [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
GetTask200Response1Result <- R6::R6Class(
  "GetTask200Response1Result",
  public = list(
    `type` = NULL,
    `data` = NULL,
    #' Initialize a new GetTask200Response1Result class.
    #'
    #' @description
    #' Initialize a new GetTask200Response1Result class.
    #'
    #' @param type The type of data returned.
    #' @param data The data produced by this task.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`type` = NULL, `data` = NULL, ...) {
      if (!is.null(`type`)) {
        if (!(is.character(`type`) && length(`type`) == 1)) {
          stop(paste("Error! Invalid data for `type`. Must be a string:", `type`))
        }
        self$`type` <- `type`
      }
      if (!is.null(`data`)) {
        self$`data` <- `data`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GetTask200Response1Result in JSON format
    #' @export
    toJSON = function() {
      GetTask200Response1ResultObject <- list()
      if (!is.null(self$`type`)) {
        GetTask200Response1ResultObject[["type"]] <-
          self$`type`
      }
      if (!is.null(self$`data`)) {
        GetTask200Response1ResultObject[["data"]] <-
          self$`data`
      }
      GetTask200Response1ResultObject
    },
    #' Deserialize JSON string into an instance of GetTask200Response1Result
    #'
    #' @description
    #' Deserialize JSON string into an instance of GetTask200Response1Result
    #'
    #' @param input_json the JSON input
    #' @return the instance of GetTask200Response1Result
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`type`)) {
        self$`type` <- this_object$`type`
      }
      if (!is.null(this_object$`data`)) {
        self$`data` <- this_object$`data`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return GetTask200Response1Result in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`type`)) {
          sprintf(
          '"type":
            "%s"
                    ',
          self$`type`
          )
        },
        if (!is.null(self$`data`)) {
          sprintf(
          '"data":
            "%s"
                    ',
          self$`data`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of GetTask200Response1Result
    #'
    #' @description
    #' Deserialize JSON string into an instance of GetTask200Response1Result
    #'
    #' @param input_json the JSON input
    #' @return the instance of GetTask200Response1Result
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`type` <- this_object$`type`
      self$`data` <- this_object$`data`
      self
    },
    #' Validate JSON input with respect to GetTask200Response1Result
    #'
    #' @description
    #' Validate JSON input with respect to GetTask200Response1Result and throw an exception if invalid
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
    #' @return String representation of GetTask200Response1Result
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
# GetTask200Response1Result$unlock()
#
## Below is an example to define the print function
# GetTask200Response1Result$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# GetTask200Response1Result$lock()

