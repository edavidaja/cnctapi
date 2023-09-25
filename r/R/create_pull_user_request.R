#' Create a new CreatePullUserRequest
#'
#' @description
#' CreatePullUserRequest Class
#'
#' @docType class
#' @title CreatePullUserRequest
#' @description CreatePullUserRequest Class
#' @format An \code{R6Class} generator object
#' @field temp_ticket The temporary ticket used for creating a user on the Posit Connect server. It is obtained from the  <a href=\"#get-/v1/users/remote\">GET /v1/users/remote</a> endpoint. character
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreatePullUserRequest <- R6::R6Class(
  "CreatePullUserRequest",
  public = list(
    `temp_ticket` = NULL,
    #' Initialize a new CreatePullUserRequest class.
    #'
    #' @description
    #' Initialize a new CreatePullUserRequest class.
    #'
    #' @param temp_ticket The temporary ticket used for creating a user on the Posit Connect server. It is obtained from the  <a href=\"#get-/v1/users/remote\">GET /v1/users/remote</a> endpoint.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`temp_ticket`, ...) {
      if (!missing(`temp_ticket`)) {
        if (!(is.character(`temp_ticket`) && length(`temp_ticket`) == 1)) {
          stop(paste("Error! Invalid data for `temp_ticket`. Must be a string:", `temp_ticket`))
        }
        self$`temp_ticket` <- `temp_ticket`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreatePullUserRequest in JSON format
    #' @export
    toJSON = function() {
      CreatePullUserRequestObject <- list()
      if (!is.null(self$`temp_ticket`)) {
        CreatePullUserRequestObject[["temp_ticket"]] <-
          self$`temp_ticket`
      }
      CreatePullUserRequestObject
    },
    #' Deserialize JSON string into an instance of CreatePullUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreatePullUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreatePullUserRequest
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`temp_ticket`)) {
        self$`temp_ticket` <- this_object$`temp_ticket`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreatePullUserRequest in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`temp_ticket`)) {
          sprintf(
          '"temp_ticket":
            "%s"
                    ',
          self$`temp_ticket`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of CreatePullUserRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreatePullUserRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreatePullUserRequest
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`temp_ticket` <- this_object$`temp_ticket`
      self
    },
    #' Validate JSON input with respect to CreatePullUserRequest
    #'
    #' @description
    #' Validate JSON input with respect to CreatePullUserRequest and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `temp_ticket`
      if (!is.null(input_json$`temp_ticket`)) {
        if (!(is.character(input_json$`temp_ticket`) && length(input_json$`temp_ticket`) == 1)) {
          stop(paste("Error! Invalid data for `temp_ticket`. Must be a string:", input_json$`temp_ticket`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreatePullUserRequest: the required field `temp_ticket` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of CreatePullUserRequest
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
      # check if the required `temp_ticket` is null
      if (is.null(self$`temp_ticket`)) {
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
      # check if the required `temp_ticket` is null
      if (is.null(self$`temp_ticket`)) {
        invalid_fields["temp_ticket"] <- "Non-nullable required field `temp_ticket` cannot be null."
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
# CreatePullUserRequest$unlock()
#
## Below is an example to define the print function
# CreatePullUserRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreatePullUserRequest$lock()

