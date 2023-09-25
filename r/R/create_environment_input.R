#' Create a new CreateEnvironmentInput
#'
#' @description
#' The fields that can be specified when creating an environment.
#'
#' @docType class
#' @title CreateEnvironmentInput
#' @description CreateEnvironmentInput Class
#' @format An \code{R6Class} generator object
#' @field title A human readable title for this environment. character
#' @field description A human readable description of this environment. character [optional]
#' @field cluster_name The cluster identifier for this environment.   The value must be \"Kubernetes\" when Off Host Execution is enabled. character
#' @field name The container image that will be used when executing content with this environment. character
#' @field matching This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  `any` (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle's manifest.  `exact` indicates the image must be explicitly asked for in the bundle's manifest.  `none` indicates that the image should never be selected by Posit Connect. character [optional]
#' @field supervisor The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. character [optional]
#' @field python  \link{CreateEnvironmentInputPython} [optional]
#' @field quarto  \link{CreateEnvironmentInputQuarto} [optional]
#' @field r  \link{CreateEnvironmentInputR} [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreateEnvironmentInput <- R6::R6Class(
  "CreateEnvironmentInput",
  public = list(
    `title` = NULL,
    `description` = NULL,
    `cluster_name` = NULL,
    `name` = NULL,
    `matching` = NULL,
    `supervisor` = NULL,
    `python` = NULL,
    `quarto` = NULL,
    `r` = NULL,
    #' Initialize a new CreateEnvironmentInput class.
    #'
    #' @description
    #' Initialize a new CreateEnvironmentInput class.
    #'
    #' @param title A human readable title for this environment.
    #' @param cluster_name The cluster identifier for this environment.   The value must be \"Kubernetes\" when Off Host Execution is enabled.
    #' @param name The container image that will be used when executing content with this environment.
    #' @param description A human readable description of this environment.. Default to "null".
    #' @param matching This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  `any` (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle's manifest.  `exact` indicates the image must be explicitly asked for in the bundle's manifest.  `none` indicates that the image should never be selected by Posit Connect.. Default to "any".
    #' @param supervisor The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment.. Default to "null".
    #' @param python python
    #' @param quarto quarto
    #' @param r r
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`title`, `cluster_name`, `name`, `description` = "null", `matching` = "any", `supervisor` = "null", `python` = NULL, `quarto` = NULL, `r` = NULL, ...) {
      if (!missing(`title`)) {
        if (!(is.character(`title`) && length(`title`) == 1)) {
          stop(paste("Error! Invalid data for `title`. Must be a string:", `title`))
        }
        self$`title` <- `title`
      }
      if (!missing(`cluster_name`)) {
        if (!(is.character(`cluster_name`) && length(`cluster_name`) == 1)) {
          stop(paste("Error! Invalid data for `cluster_name`. Must be a string:", `cluster_name`))
        }
        self$`cluster_name` <- `cluster_name`
      }
      if (!missing(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
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
    #' @return CreateEnvironmentInput in JSON format
    #' @export
    toJSON = function() {
      CreateEnvironmentInputObject <- list()
      if (!is.null(self$`title`)) {
        CreateEnvironmentInputObject[["title"]] <-
          self$`title`
      }
      if (!is.null(self$`description`)) {
        CreateEnvironmentInputObject[["description"]] <-
          self$`description`
      }
      if (!is.null(self$`cluster_name`)) {
        CreateEnvironmentInputObject[["cluster_name"]] <-
          self$`cluster_name`
      }
      if (!is.null(self$`name`)) {
        CreateEnvironmentInputObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`matching`)) {
        CreateEnvironmentInputObject[["matching"]] <-
          self$`matching`
      }
      if (!is.null(self$`supervisor`)) {
        CreateEnvironmentInputObject[["supervisor"]] <-
          self$`supervisor`
      }
      if (!is.null(self$`python`)) {
        CreateEnvironmentInputObject[["python"]] <-
          self$`python`$toJSON()
      }
      if (!is.null(self$`quarto`)) {
        CreateEnvironmentInputObject[["quarto"]] <-
          self$`quarto`$toJSON()
      }
      if (!is.null(self$`r`)) {
        CreateEnvironmentInputObject[["r"]] <-
          self$`r`$toJSON()
      }
      CreateEnvironmentInputObject
    },
    #' Deserialize JSON string into an instance of CreateEnvironmentInput
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateEnvironmentInput
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateEnvironmentInput
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`title`)) {
        self$`title` <- this_object$`title`
      }
      if (!is.null(this_object$`description`)) {
        self$`description` <- this_object$`description`
      }
      if (!is.null(this_object$`cluster_name`)) {
        self$`cluster_name` <- this_object$`cluster_name`
      }
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
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
    #' @return CreateEnvironmentInput in JSON format
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
        if (!is.null(self$`cluster_name`)) {
          sprintf(
          '"cluster_name":
            "%s"
                    ',
          self$`cluster_name`
          )
        },
        if (!is.null(self$`name`)) {
          sprintf(
          '"name":
            "%s"
                    ',
          self$`name`
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
    #' Deserialize JSON string into an instance of CreateEnvironmentInput
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateEnvironmentInput
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateEnvironmentInput
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`title` <- this_object$`title`
      self$`description` <- this_object$`description`
      self$`cluster_name` <- this_object$`cluster_name`
      self$`name` <- this_object$`name`
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
    #' Validate JSON input with respect to CreateEnvironmentInput
    #'
    #' @description
    #' Validate JSON input with respect to CreateEnvironmentInput and throw an exception if invalid
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
        stop(paste("The JSON input `", input, "` is invalid for CreateEnvironmentInput: the required field `title` is missing."))
      }
      # check the required field `cluster_name`
      if (!is.null(input_json$`cluster_name`)) {
        if (!(is.character(input_json$`cluster_name`) && length(input_json$`cluster_name`) == 1)) {
          stop(paste("Error! Invalid data for `cluster_name`. Must be a string:", input_json$`cluster_name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreateEnvironmentInput: the required field `cluster_name` is missing."))
      }
      # check the required field `name`
      if (!is.null(input_json$`name`)) {
        if (!(is.character(input_json$`name`) && length(input_json$`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", input_json$`name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreateEnvironmentInput: the required field `name` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of CreateEnvironmentInput
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

      # check if the required `cluster_name` is null
      if (is.null(self$`cluster_name`)) {
        return(FALSE)
      }

      # check if the required `name` is null
      if (is.null(self$`name`)) {
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

      # check if the required `cluster_name` is null
      if (is.null(self$`cluster_name`)) {
        invalid_fields["cluster_name"] <- "Non-nullable required field `cluster_name` cannot be null."
      }

      # check if the required `name` is null
      if (is.null(self$`name`)) {
        invalid_fields["name"] <- "Non-nullable required field `name` cannot be null."
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
# CreateEnvironmentInput$unlock()
#
## Below is an example to define the print function
# CreateEnvironmentInput$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreateEnvironmentInput$lock()

