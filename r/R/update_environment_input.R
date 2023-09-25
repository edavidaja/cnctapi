#' Create a new UpdateEnvironmentInput
#'
#' @description
#' The fields that can be specified when updating an environment.
#'
#' @docType class
#' @title UpdateEnvironmentInput
#' @description UpdateEnvironmentInput Class
#' @format An \code{R6Class} generator object
#' @field title A human readable title for this environment. character
#' @field description A human readable description of this environment. character [optional]
#' @field matching This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  `any` (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle's manifest.  `exact` indicates the image must be explicitly asked for in the bundle's manifest.  `none` indicates that the image should never be selected by Posit Connect. character [optional]
#' @field supervisor The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. character [optional]
#' @field python  \link{CreateEnvironmentInputPython} [optional]
#' @field quarto  \link{CreateEnvironmentInputQuarto} [optional]
#' @field r  \link{CreateEnvironmentInputR} [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UpdateEnvironmentInput <- R6::R6Class(
  "UpdateEnvironmentInput",
  public = list(
    `title` = NULL,
    `description` = NULL,
    `matching` = NULL,
    `supervisor` = NULL,
    `python` = NULL,
    `quarto` = NULL,
    `r` = NULL,
    #' Initialize a new UpdateEnvironmentInput class.
    #'
    #' @description
    #' Initialize a new UpdateEnvironmentInput class.
    #'
    #' @param title A human readable title for this environment.
    #' @param description A human readable description of this environment.. Default to "null".
    #' @param matching This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  `any` (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle's manifest.  `exact` indicates the image must be explicitly asked for in the bundle's manifest.  `none` indicates that the image should never be selected by Posit Connect.. Default to "null".
    #' @param supervisor The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment.. Default to "null".
    #' @param python python
    #' @param quarto quarto
    #' @param r r
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`title`, `description` = "null", `matching` = "null", `supervisor` = "null", `python` = NULL, `quarto` = NULL, `r` = NULL, ...) {
      if (!missing(`title`)) {
        if (!(is.character(`title`) && length(`title`) == 1)) {
          stop(paste("Error! Invalid data for `title`. Must be a string:", `title`))
        }
        self$`title` <- `title`
      }
      if (!is.null(`description`)) {
        if (!(is.character(`description`) && length(`description`) == 1)) {
          stop(paste("Error! Invalid data for `description`. Must be a string:", `description`))
        }
        self$`description` <- `description`
      }
      if (!is.null(`matching`)) {
        if (!(`matching` %in% c("any", "exact", "none"))) {
          stop(paste("Error! \"", `matching`, "\" cannot be assigned to `matching`. Must be \"any\", \"exact\", \"none\".", sep = ""))
        }
        if (!(is.character(`matching`) && length(`matching`) == 1)) {
          stop(paste("Error! Invalid data for `matching`. Must be a string:", `matching`))
        }
        self$`matching` <- `matching`
      }
      if (!is.null(`supervisor`)) {
        if (!(is.character(`supervisor`) && length(`supervisor`) == 1)) {
          stop(paste("Error! Invalid data for `supervisor`. Must be a string:", `supervisor`))
        }
        self$`supervisor` <- `supervisor`
      }
      if (!is.null(`python`)) {
        stopifnot(R6::is.R6(`python`))
        self$`python` <- `python`
      }
      if (!is.null(`quarto`)) {
        stopifnot(R6::is.R6(`quarto`))
        self$`quarto` <- `quarto`
      }
      if (!is.null(`r`)) {
        stopifnot(R6::is.R6(`r`))
        self$`r` <- `r`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateEnvironmentInput in JSON format
    #' @export
    toJSON = function() {
      UpdateEnvironmentInputObject <- list()
      if (!is.null(self$`title`)) {
        UpdateEnvironmentInputObject[["title"]] <-
          self$`title`
      }
      if (!is.null(self$`description`)) {
        UpdateEnvironmentInputObject[["description"]] <-
          self$`description`
      }
      if (!is.null(self$`matching`)) {
        UpdateEnvironmentInputObject[["matching"]] <-
          self$`matching`
      }
      if (!is.null(self$`supervisor`)) {
        UpdateEnvironmentInputObject[["supervisor"]] <-
          self$`supervisor`
      }
      if (!is.null(self$`python`)) {
        UpdateEnvironmentInputObject[["python"]] <-
          self$`python`$toJSON()
      }
      if (!is.null(self$`quarto`)) {
        UpdateEnvironmentInputObject[["quarto"]] <-
          self$`quarto`$toJSON()
      }
      if (!is.null(self$`r`)) {
        UpdateEnvironmentInputObject[["r"]] <-
          self$`r`$toJSON()
      }
      UpdateEnvironmentInputObject
    },
    #' Deserialize JSON string into an instance of UpdateEnvironmentInput
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateEnvironmentInput
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateEnvironmentInput
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`title`)) {
        self$`title` <- this_object$`title`
      }
      if (!is.null(this_object$`description`)) {
        self$`description` <- this_object$`description`
      }
      if (!is.null(this_object$`matching`)) {
        if (!is.null(this_object$`matching`) && !(this_object$`matching` %in% c("any", "exact", "none"))) {
          stop(paste("Error! \"", this_object$`matching`, "\" cannot be assigned to `matching`. Must be \"any\", \"exact\", \"none\".", sep = ""))
        }
        self$`matching` <- this_object$`matching`
      }
      if (!is.null(this_object$`supervisor`)) {
        self$`supervisor` <- this_object$`supervisor`
      }
      if (!is.null(this_object$`python`)) {
        `python_object` <- CreateEnvironmentInputPython$new()
        `python_object`$fromJSON(jsonlite::toJSON(this_object$`python`, auto_unbox = TRUE, digits = NA))
        self$`python` <- `python_object`
      }
      if (!is.null(this_object$`quarto`)) {
        `quarto_object` <- CreateEnvironmentInputQuarto$new()
        `quarto_object`$fromJSON(jsonlite::toJSON(this_object$`quarto`, auto_unbox = TRUE, digits = NA))
        self$`quarto` <- `quarto_object`
      }
      if (!is.null(this_object$`r`)) {
        `r_object` <- CreateEnvironmentInputR$new()
        `r_object`$fromJSON(jsonlite::toJSON(this_object$`r`, auto_unbox = TRUE, digits = NA))
        self$`r` <- `r_object`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return UpdateEnvironmentInput in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`title`)) {
          sprintf(
          '"title":
            "%s"
                    ',
          self$`title`
          )
        },
        if (!is.null(self$`description`)) {
          sprintf(
          '"description":
            "%s"
                    ',
          self$`description`
          )
        },
        if (!is.null(self$`matching`)) {
          sprintf(
          '"matching":
            "%s"
                    ',
          self$`matching`
          )
        },
        if (!is.null(self$`supervisor`)) {
          sprintf(
          '"supervisor":
            "%s"
                    ',
          self$`supervisor`
          )
        },
        if (!is.null(self$`python`)) {
          sprintf(
          '"python":
          %s
          ',
          jsonlite::toJSON(self$`python`$toJSON(), auto_unbox = TRUE, digits = NA)
          )
        },
        if (!is.null(self$`quarto`)) {
          sprintf(
          '"quarto":
          %s
          ',
          jsonlite::toJSON(self$`quarto`$toJSON(), auto_unbox = TRUE, digits = NA)
          )
        },
        if (!is.null(self$`r`)) {
          sprintf(
          '"r":
          %s
          ',
          jsonlite::toJSON(self$`r`$toJSON(), auto_unbox = TRUE, digits = NA)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of UpdateEnvironmentInput
    #'
    #' @description
    #' Deserialize JSON string into an instance of UpdateEnvironmentInput
    #'
    #' @param input_json the JSON input
    #' @return the instance of UpdateEnvironmentInput
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`title` <- this_object$`title`
      self$`description` <- this_object$`description`
      if (!is.null(this_object$`matching`) && !(this_object$`matching` %in% c("any", "exact", "none"))) {
        stop(paste("Error! \"", this_object$`matching`, "\" cannot be assigned to `matching`. Must be \"any\", \"exact\", \"none\".", sep = ""))
      }
      self$`matching` <- this_object$`matching`
      self$`supervisor` <- this_object$`supervisor`
      self$`python` <- CreateEnvironmentInputPython$new()$fromJSON(jsonlite::toJSON(this_object$`python`, auto_unbox = TRUE, digits = NA))
      self$`quarto` <- CreateEnvironmentInputQuarto$new()$fromJSON(jsonlite::toJSON(this_object$`quarto`, auto_unbox = TRUE, digits = NA))
      self$`r` <- CreateEnvironmentInputR$new()$fromJSON(jsonlite::toJSON(this_object$`r`, auto_unbox = TRUE, digits = NA))
      self
    },
    #' Validate JSON input with respect to UpdateEnvironmentInput
    #'
    #' @description
    #' Validate JSON input with respect to UpdateEnvironmentInput and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `title`
      if (!is.null(input_json$`title`)) {
        if (!(is.character(input_json$`title`) && length(input_json$`title`) == 1)) {
          stop(paste("Error! Invalid data for `title`. Must be a string:", input_json$`title`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for UpdateEnvironmentInput: the required field `title` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of UpdateEnvironmentInput
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
      # check if the required `title` is null
      if (is.null(self$`title`)) {
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
      # check if the required `title` is null
      if (is.null(self$`title`)) {
        invalid_fields["title"] <- "Non-nullable required field `title` cannot be null."
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
# UpdateEnvironmentInput$unlock()
#
## Below is an example to define the print function
# UpdateEnvironmentInput$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# UpdateEnvironmentInput$lock()

