#' Create a new LockUserRequest
#'
#' @description
#' LockUserRequest Class
#'
#' @docType class
#' @title LockUserRequest
#' @description LockUserRequest Class
#' @format An \code{R6Class} generator object
#' @field locked Whether or not the user should be locked. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LockUserRequest <- R6::R6Class(
  "LockUserRequest",
  public = list(
    `locked` = NULL,
    #' Initialize a new LockUserRequest class.
    #'
    #' @description
    #' Initialize a new LockUserRequest class.
    #'
    #' @param locked Whether or not the user should be locked.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`locked`, ...) {
      if (!missing(`locked`)) {
        if (!(is.logical(`locked`) && length(`locked`) == 1)) {
          stop(paste("Error! Invalid data for `locked`. Must be a boolean:", `locked`))
        }
        self$`locked` <- `locked`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LockUserRequest in JSON format
    #' @export
    toJSON = function() {
      LockUserRequestObject <- list()
      if (!is.null(self$`locked`)) {
        LockUserRequestObject[["locked"]] <-
          self$`locked`
      }
      LockUserRequestObject
    },
    #' Deserialize JSON string into an instance of LockUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of LockUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of LockUserRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`locked`)) {
        self$`locked` <- this_object$`locked`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return LockUserRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`locked`)) {
          sprintf(
          '"locked":
            %s
                    ',
          tolower(self$`locked`)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of LockUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of LockUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of LockUserRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`locked` <- this_object$`locked`
      self
    },
    #' Validate JSON input with respect to LockUserRequest
    #'
    #' @description
    #' Validate JSON input with respect to LockUserRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `locked`
      if (!is.null(input_json$`locked`)) {
        if (!(is.logical(input_json$`locked`) && length(input_json$`locked`) == 1)) {
          stop(paste("Error! Invalid data for `locked`. Must be a boolean:", input_json$`locked`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for LockUserRequest: the required field `locked` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of LockUserRequest
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
      # check if the required `locked` is null
      if (is.null(self$`locked`)) {
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
      # check if the required `locked` is null
      if (is.null(self$`locked`)) {
        invalid_fields["locked"] <- "Non-nullable required field `locked` cannot be null."
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
# LockUserRequest$unlock()
#
## Below is an example to define the print function
# LockUserRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# LockUserRequest$lock()

