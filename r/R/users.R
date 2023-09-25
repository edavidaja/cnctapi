#' Create a new Users
#'
#' @description
#' Users Class
#'
#' @docType class
#' @title Users
#' @description Users Class
#' @format An \code{R6Class} generator object
#' @field current_page The current page of results integer [optional]
#' @field total The number of users that match the given filters integer [optional]
#' @field results The users list list(\link{User}) [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Users <- R6::R6Class(
  "Users",
  public = list(
    `current_page` = NULL,
    `total` = NULL,
    `results` = NULL,
    #' Initialize a new Users class.
    #'
    #' @description
    #' Initialize a new Users class.
    #'
    #' @param current_page The current page of results
    #' @param total The number of users that match the given filters
    #' @param results The users list
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`current_page` = NULL, `total` = NULL, `results` = NULL, ...) {
      if (!is.null(`current_page`)) {
        if (!(is.numeric(`current_page`) && length(`current_page`) == 1)) {
          stop(paste("Error! Invalid data for `current_page`. Must be an integer:", `current_page`))
        }
        self$`current_page` <- `current_page`
      }
      if (!is.null(`total`)) {
        if (!(is.numeric(`total`) && length(`total`) == 1)) {
          stop(paste("Error! Invalid data for `total`. Must be an integer:", `total`))
        }
        self$`total` <- `total`
      }
      if (!is.null(`results`)) {
        stopifnot(is.vector(`results`), length(`results`) != 0)
        sapply(`results`, function(x) stopifnot(R6::is.R6(x)))
        self$`results` <- `results`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Users in JSON format
    #' @export
    toJSON = function() {
      UsersObject <- list()
      if (!is.null(self$`current_page`)) {
        UsersObject[["current_page"]] <-
          self$`current_page`
      }
      if (!is.null(self$`total`)) {
        UsersObject[["total"]] <-
          self$`total`
      }
      if (!is.null(self$`results`)) {
        UsersObject[["results"]] <-
          lapply(self$`results`, function(x) x$toJSON())
      }
      UsersObject
    },
    #' Deserialize JSON string into an instance of Users
    #'
    #' @description
    #' Deserialize JSON string into an instance of Users
    #'
    #' @param input_json the JSON input
    #' @return the instance of Users
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`current_page`)) {
        self$`current_page` <- this_object$`current_page`
      }
      if (!is.null(this_object$`total`)) {
        self$`total` <- this_object$`total`
      }
      if (!is.null(this_object$`results`)) {
        self$`results` <- ApiClient$new()$deserializeObj(this_object$`results`, "array[User]", loadNamespace("connectapi2"))
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Users in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`current_page`)) {
          sprintf(
          '"current_page":
            %d
                    ',
          self$`current_page`
          )
        },
        if (!is.null(self$`total`)) {
          sprintf(
          '"total":
            %d
                    ',
          self$`total`
          )
        },
        if (!is.null(self$`results`)) {
          sprintf(
          '"results":
          [%s]
',
          paste(sapply(self$`results`, function(x) jsonlite::toJSON(x$toJSON(), auto_unbox = TRUE, digits = NA)), collapse = ",")
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Users
    #'
    #' @description
    #' Deserialize JSON string into an instance of Users
    #'
    #' @param input_json the JSON input
    #' @return the instance of Users
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`current_page` <- this_object$`current_page`
      self$`total` <- this_object$`total`
      self$`results` <- ApiClient$new()$deserializeObj(this_object$`results`, "array[User]", loadNamespace("connectapi2"))
      self
    },
    #' Validate JSON input with respect to Users
    #'
    #' @description
    #' Validate JSON input with respect to Users and throw an exception if invalid
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
    #' @return String representation of Users
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
      if (self$`current_page` < 0) {
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
      if (self$`current_page` < 0) {
        invalid_fields["current_page"] <- "Invalid value for `current_page`, must be bigger than or equal to 0."
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
# Users$unlock()
#
## Below is an example to define the print function
# Users$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Users$lock()

