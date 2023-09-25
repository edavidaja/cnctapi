#' Create a new BuildContentBundle200Response
#'
#' @description
#' Identifies the task that can be used to track the progress of a build operation.
#'
#' @docType class
#' @title BuildContentBundle200Response
#' @description BuildContentBundle200Response Class
#' @format An \code{R6Class} generator object
#' @field task_id Identifier for the created build task. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BuildContentBundle200Response <- R6::R6Class(
  "BuildContentBundle200Response",
  public = list(
    `task_id` = NULL,
    #' Initialize a new BuildContentBundle200Response class.
    #'
    #' @description
    #' Initialize a new BuildContentBundle200Response class.
    #'
    #' @param task_id Identifier for the created build task.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`task_id` = NULL, ...) {
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
    #' @return BuildContentBundle200Response in JSON format
    #' @export
    toJSON = function() {
      BuildContentBundle200ResponseObject <- list()
      if (!is.null(self$`task_id`)) {
        BuildContentBundle200ResponseObject[["task_id"]] <-
          self$`task_id`
      }
      BuildContentBundle200ResponseObject
    },
    #' Deserialize JSON string into an instance of BuildContentBundle200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of BuildContentBundle200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of BuildContentBundle200Response
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
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
    #' @return BuildContentBundle200Response in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
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
    #' Deserialize JSON string into an instance of BuildContentBundle200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of BuildContentBundle200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of BuildContentBundle200Response
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`task_id` <- this_object$`task_id`
      self
    },
    #' Validate JSON input with respect to BuildContentBundle200Response
    #'
    #' @description
    #' Validate JSON input with respect to BuildContentBundle200Response and throw an exception if invalid
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
    #' @return String representation of BuildContentBundle200Response
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
# BuildContentBundle200Response$unlock()
#
## Below is an example to define the print function
# BuildContentBundle200Response$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# BuildContentBundle200Response$lock()

