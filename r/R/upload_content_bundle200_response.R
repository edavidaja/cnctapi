#' Create a new UploadContentBundle200Response
#'
#' @description
#' Describes the bundle created by a just-completed upload.
#'
#' @docType class
#' @title UploadContentBundle200Response
#' @description UploadContentBundle200Response Class
#' @format An \code{R6Class} generator object
#' @field bundle_id Identifier for the newly created bundle. character [optional]
#' @field size The number of bytes received. numeric [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UploadContentBundle200Response <- R6::R6Class(
  "UploadContentBundle200Response",
  public = list(
    `bundle_id` = NULL,
    `size` = NULL,
    #' Initialize a new UploadContentBundle200Response class.
    #'
    #' @description
    #' Initialize a new UploadContentBundle200Response class.
    #'
    #' @param bundle_id Identifier for the newly created bundle.
    #' @param size The number of bytes received.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`bundle_id` = NULL, `size` = NULL, ...) {
      if (!is.null(`bundle_id`)) {
        if (!(is.character(`bundle_id`) && length(`bundle_id`) == 1)) {
          stop(paste("Error! Invalid data for `bundle_id`. Must be a string:", `bundle_id`))
        }
        self$`bundle_id` <- `bundle_id`
      }
      if (!is.null(`size`)) {
        if (!(is.numeric(`size`) && length(`size`) == 1)) {
          stop(paste("Error! Invalid data for `size`. Must be a number:", `size`))
        }
        self$`size` <- `size`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UploadContentBundle200Response in JSON format
    #' @export
    toJSON = function() {
      UploadContentBundle200ResponseObject <- list()
      if (!is.null(self$`bundle_id`)) {
        UploadContentBundle200ResponseObject[["bundle_id"]] <-
          self$`bundle_id`
      }
      if (!is.null(self$`size`)) {
        UploadContentBundle200ResponseObject[["size"]] <-
          self$`size`
      }
      UploadContentBundle200ResponseObject
    },
    #' Deserialize JSON string into an instance of UploadContentBundle200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of UploadContentBundle200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of UploadContentBundle200Response
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`bundle_id`)) {
        self$`bundle_id` <- this_object$`bundle_id`
      }
      if (!is.null(this_object$`size`)) {
        self$`size` <- this_object$`size`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UploadContentBundle200Response in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`bundle_id`)) {
          sprintf(
          '"bundle_id":
            "%s"
                    ',
          self$`bundle_id`
          )
        },
        if (!is.null(self$`size`)) {
          sprintf(
          '"size":
            %d
                    ',
          self$`size`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UploadContentBundle200Response
    #'
    #' @description
    #' Deserialize JSON string into an instance of UploadContentBundle200Response
    #'
    #' @param input_json the JSON input
    #' @return the instance of UploadContentBundle200Response
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`bundle_id` <- this_object$`bundle_id`
      self$`size` <- this_object$`size`
      self
    },
    #' Validate JSON input with respect to UploadContentBundle200Response
    #'
    #' @description
    #' Validate JSON input with respect to UploadContentBundle200Response and throw an exception if invalid
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
    #' @return String representation of UploadContentBundle200Response
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
# UploadContentBundle200Response$unlock()
#
## Below is an example to define the print function
# UploadContentBundle200Response$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UploadContentBundle200Response$lock()

