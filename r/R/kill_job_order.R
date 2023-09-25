#' Create a new KillJobOrder
#'
#' @description
#' KillJobOrder Class
#'
#' @docType class
#' @title KillJobOrder
#' @description KillJobOrder Class
#' @format An \code{R6Class} generator object
#' @field guid The unique identifier for the registered kill order. character [optional]
#' @field app_id The identifier for this job's parent content. integer [optional]
#' @field app_guid The unique identifier for this job's content. character [optional]
#' @field job_id The job's id integer [optional]
#' @field job_key The job's unique key identifier. character [optional]
#' @field result A short message describing the end result. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
KillJobOrder <- R6::R6Class(
  "KillJobOrder",
  public = list(
    `guid` = NULL,
    `app_id` = NULL,
    `app_guid` = NULL,
    `job_id` = NULL,
    `job_key` = NULL,
    `result` = NULL,
    #' Initialize a new KillJobOrder class.
    #'
    #' @description
    #' Initialize a new KillJobOrder class.
    #'
    #' @param guid The unique identifier for the registered kill order.
    #' @param app_id The identifier for this job's parent content.
    #' @param app_guid The unique identifier for this job's content.
    #' @param job_id The job's id
    #' @param job_key The job's unique key identifier.
    #' @param result A short message describing the end result.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid` = NULL, `app_id` = NULL, `app_guid` = NULL, `job_id` = NULL, `job_key` = NULL, `result` = NULL, ...) {
      if (!is.null(`guid`)) {
        if (!(is.character(`guid`) && length(`guid`) == 1)) {
          stop(paste("Error! Invalid data for `guid`. Must be a string:", `guid`))
        }
        self$`guid` <- `guid`
      }
      if (!is.null(`app_id`)) {
        if (!(is.numeric(`app_id`) && length(`app_id`) == 1)) {
          stop(paste("Error! Invalid data for `app_id`. Must be an integer:", `app_id`))
        }
        self$`app_id` <- `app_id`
      }
      if (!is.null(`app_guid`)) {
        if (!(is.character(`app_guid`) && length(`app_guid`) == 1)) {
          stop(paste("Error! Invalid data for `app_guid`. Must be a string:", `app_guid`))
        }
        self$`app_guid` <- `app_guid`
      }
      if (!is.null(`job_id`)) {
        if (!(is.numeric(`job_id`) && length(`job_id`) == 1)) {
          stop(paste("Error! Invalid data for `job_id`. Must be an integer:", `job_id`))
        }
        self$`job_id` <- `job_id`
      }
      if (!is.null(`job_key`)) {
        if (!(is.character(`job_key`) && length(`job_key`) == 1)) {
          stop(paste("Error! Invalid data for `job_key`. Must be a string:", `job_key`))
        }
        self$`job_key` <- `job_key`
      }
      if (!is.null(`result`)) {
        if (!(is.character(`result`) && length(`result`) == 1)) {
          stop(paste("Error! Invalid data for `result`. Must be a string:", `result`))
        }
        self$`result` <- `result`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return KillJobOrder in JSON format
    #' @export
    toJSON = function() {
      KillJobOrderObject <- list()
      if (!is.null(self$`guid`)) {
        KillJobOrderObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`app_id`)) {
        KillJobOrderObject[["app_id"]] <-
          self$`app_id`
      }
      if (!is.null(self$`app_guid`)) {
        KillJobOrderObject[["app_guid"]] <-
          self$`app_guid`
      }
      if (!is.null(self$`job_id`)) {
        KillJobOrderObject[["job_id"]] <-
          self$`job_id`
      }
      if (!is.null(self$`job_key`)) {
        KillJobOrderObject[["job_key"]] <-
          self$`job_key`
      }
      if (!is.null(self$`result`)) {
        KillJobOrderObject[["result"]] <-
          self$`result`
      }
      KillJobOrderObject
    },
    #' Deserialize JSON string into an instance of KillJobOrder
    #'
    #' @description
    #' Deserialize JSON string into an instance of KillJobOrder
    #'
    #' @param input_json the JSON input
    #' @return the instance of KillJobOrder
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`guid`)) {
        self$`guid` <- this_object$`guid`
      }
      if (!is.null(this_object$`app_id`)) {
        self$`app_id` <- this_object$`app_id`
      }
      if (!is.null(this_object$`app_guid`)) {
        self$`app_guid` <- this_object$`app_guid`
      }
      if (!is.null(this_object$`job_id`)) {
        self$`job_id` <- this_object$`job_id`
      }
      if (!is.null(this_object$`job_key`)) {
        self$`job_key` <- this_object$`job_key`
      }
      if (!is.null(this_object$`result`)) {
        self$`result` <- this_object$`result`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return KillJobOrder in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`guid`)) {
          sprintf(
          '"guid":
            "%s"
                    ',
          self$`guid`
          )
        },
        if (!is.null(self$`app_id`)) {
          sprintf(
          '"app_id":
            %d
                    ',
          self$`app_id`
          )
        },
        if (!is.null(self$`app_guid`)) {
          sprintf(
          '"app_guid":
            "%s"
                    ',
          self$`app_guid`
          )
        },
        if (!is.null(self$`job_id`)) {
          sprintf(
          '"job_id":
            %d
                    ',
          self$`job_id`
          )
        },
        if (!is.null(self$`job_key`)) {
          sprintf(
          '"job_key":
            "%s"
                    ',
          self$`job_key`
          )
        },
        if (!is.null(self$`result`)) {
          sprintf(
          '"result":
            "%s"
                    ',
          self$`result`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of KillJobOrder
    #'
    #' @description
    #' Deserialize JSON string into an instance of KillJobOrder
    #'
    #' @param input_json the JSON input
    #' @return the instance of KillJobOrder
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`guid` <- this_object$`guid`
      self$`app_id` <- this_object$`app_id`
      self$`app_guid` <- this_object$`app_guid`
      self$`job_id` <- this_object$`job_id`
      self$`job_key` <- this_object$`job_key`
      self$`result` <- this_object$`result`
      self
    },
    #' Validate JSON input with respect to KillJobOrder
    #'
    #' @description
    #' Validate JSON input with respect to KillJobOrder and throw an exception if invalid
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
    #' @return String representation of KillJobOrder
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
# KillJobOrder$unlock()
#
## Below is an example to define the print function
# KillJobOrder$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# KillJobOrder$lock()

