#' Create a new BundleV1Exp
#'
#' @description
#' Content published to Posit Connect is encapsulated in a \"bundle\" that contains the source code and data necessary to execute the content. An application or report is updated by uploading a new bundle.
#'
#' @docType class
#' @title BundleV1Exp
#' @description BundleV1Exp Class
#' @format An \code{R6Class} generator object
#' @field id The identifier for this bundle. character [optional]
#' @field content_guid The identifier of the owning content. character [optional]
#' @field created_time The timestamp (RFC3339) of when this bundle was created. character [optional]
#' @field cluster_name The location where this content bundle runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field image_name The location where content this content bundle runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field r_version The version of the R interpreter used when last restoring this bundle. The value `null` represents that an R interpreter is not used by this bundle or that the R package environment has not been successfully restored.  R version is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field py_version The version of the Python interpreter used when last restoring this bundle.  The value `null` represents that a Python interpreter is not used by this bundle or that the Python package environment has not been successfully restored.  Python version is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field quarto_version The version of the Quarto interpreter used when last restoring this bundle. The value `null` represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field active Indicates if this bundle is active for the owning content. character [optional]
#' @field size On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file. numeric [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BundleV1Exp <- R6::R6Class(
  "BundleV1Exp",
  public = list(
    `id` = NULL,
    `content_guid` = NULL,
    `created_time` = NULL,
    `cluster_name` = NULL,
    `image_name` = NULL,
    `r_version` = NULL,
    `py_version` = NULL,
    `quarto_version` = NULL,
    `active` = NULL,
    `size` = NULL,
    #' Initialize a new BundleV1Exp class.
    #'
    #' @description
    #' Initialize a new BundleV1Exp class.
    #'
    #' @param id The identifier for this bundle.
    #' @param content_guid The identifier of the owning content.
    #' @param created_time The timestamp (RFC3339) of when this bundle was created.
    #' @param cluster_name The location where this content bundle runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param image_name The location where content this content bundle runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param r_version The version of the R interpreter used when last restoring this bundle. The value `null` represents that an R interpreter is not used by this bundle or that the R package environment has not been successfully restored.  R version is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param py_version The version of the Python interpreter used when last restoring this bundle.  The value `null` represents that a Python interpreter is not used by this bundle or that the Python package environment has not been successfully restored.  Python version is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param quarto_version The version of the Quarto interpreter used when last restoring this bundle. The value `null` represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param active Indicates if this bundle is active for the owning content.
    #' @param size On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `content_guid` = NULL, `created_time` = NULL, `cluster_name` = NULL, `image_name` = NULL, `r_version` = NULL, `py_version` = NULL, `quarto_version` = NULL, `active` = NULL, `size` = NULL, ...) {
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!is.null(`content_guid`)) {
        if (!(is.character(`content_guid`) && length(`content_guid`) == 1)) {
          stop(paste("Error! Invalid data for `content_guid`. Must be a string:", `content_guid`))
        }
        self$`content_guid` <- `content_guid`
      }
      if (!is.null(`created_time`)) {
        if (!is.character(`created_time`)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", `created_time`))
        }
        self$`created_time` <- `created_time`
      }
      if (!is.null(`cluster_name`)) {
        if (!(is.character(`cluster_name`) && length(`cluster_name`) == 1)) {
          stop(paste("Error! Invalid data for `cluster_name`. Must be a string:", `cluster_name`))
        }
        self$`cluster_name` <- `cluster_name`
      }
      if (!is.null(`image_name`)) {
        if (!(is.character(`image_name`) && length(`image_name`) == 1)) {
          stop(paste("Error! Invalid data for `image_name`. Must be a string:", `image_name`))
        }
        self$`image_name` <- `image_name`
      }
      if (!is.null(`r_version`)) {
        if (!(is.character(`r_version`) && length(`r_version`) == 1)) {
          stop(paste("Error! Invalid data for `r_version`. Must be a string:", `r_version`))
        }
        self$`r_version` <- `r_version`
      }
      if (!is.null(`py_version`)) {
        if (!(is.character(`py_version`) && length(`py_version`) == 1)) {
          stop(paste("Error! Invalid data for `py_version`. Must be a string:", `py_version`))
        }
        self$`py_version` <- `py_version`
      }
      if (!is.null(`quarto_version`)) {
        if (!(is.character(`quarto_version`) && length(`quarto_version`) == 1)) {
          stop(paste("Error! Invalid data for `quarto_version`. Must be a string:", `quarto_version`))
        }
        self$`quarto_version` <- `quarto_version`
      }
      if (!is.null(`active`)) {
        if (!(is.logical(`active`) && length(`active`) == 1)) {
          stop(paste("Error! Invalid data for `active`. Must be a boolean:", `active`))
        }
        self$`active` <- `active`
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
    #' @return BundleV1Exp in JSON format
    #' @export
    toJSON = function() {
      BundleV1ExpObject <- list()
      if (!is.null(self$`id`)) {
        BundleV1ExpObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`content_guid`)) {
        BundleV1ExpObject[["content_guid"]] <-
          self$`content_guid`
      }
      if (!is.null(self$`created_time`)) {
        BundleV1ExpObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`cluster_name`)) {
        BundleV1ExpObject[["cluster_name"]] <-
          self$`cluster_name`
      }
      if (!is.null(self$`image_name`)) {
        BundleV1ExpObject[["image_name"]] <-
          self$`image_name`
      }
      if (!is.null(self$`r_version`)) {
        BundleV1ExpObject[["r_version"]] <-
          self$`r_version`
      }
      if (!is.null(self$`py_version`)) {
        BundleV1ExpObject[["py_version"]] <-
          self$`py_version`
      }
      if (!is.null(self$`quarto_version`)) {
        BundleV1ExpObject[["quarto_version"]] <-
          self$`quarto_version`
      }
      if (!is.null(self$`active`)) {
        BundleV1ExpObject[["active"]] <-
          self$`active`
      }
      if (!is.null(self$`size`)) {
        BundleV1ExpObject[["size"]] <-
          self$`size`
      }
      BundleV1ExpObject
    },
    #' Deserialize JSON string into an instance of BundleV1Exp
    #'
    #' @description
    #' Deserialize JSON string into an instance of BundleV1Exp
    #'
    #' @param input_json the JSON input
    #' @return the instance of BundleV1Exp
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`content_guid`)) {
        self$`content_guid` <- this_object$`content_guid`
      }
      if (!is.null(this_object$`created_time`)) {
        self$`created_time` <- this_object$`created_time`
      }
      if (!is.null(this_object$`cluster_name`)) {
        self$`cluster_name` <- this_object$`cluster_name`
      }
      if (!is.null(this_object$`image_name`)) {
        self$`image_name` <- this_object$`image_name`
      }
      if (!is.null(this_object$`r_version`)) {
        self$`r_version` <- this_object$`r_version`
      }
      if (!is.null(this_object$`py_version`)) {
        self$`py_version` <- this_object$`py_version`
      }
      if (!is.null(this_object$`quarto_version`)) {
        self$`quarto_version` <- this_object$`quarto_version`
      }
      if (!is.null(this_object$`active`)) {
        self$`active` <- this_object$`active`
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
    #' @return BundleV1Exp in JSON format
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
        if (!is.null(self$`content_guid`)) {
          sprintf(
          '"content_guid":
            "%s"
                    ',
          self$`content_guid`
          )
        },
        if (!is.null(self$`created_time`)) {
          sprintf(
          '"created_time":
            "%s"
                    ',
          self$`created_time`
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
        if (!is.null(self$`image_name`)) {
          sprintf(
          '"image_name":
            "%s"
                    ',
          self$`image_name`
          )
        },
        if (!is.null(self$`r_version`)) {
          sprintf(
          '"r_version":
            "%s"
                    ',
          self$`r_version`
          )
        },
        if (!is.null(self$`py_version`)) {
          sprintf(
          '"py_version":
            "%s"
                    ',
          self$`py_version`
          )
        },
        if (!is.null(self$`quarto_version`)) {
          sprintf(
          '"quarto_version":
            "%s"
                    ',
          self$`quarto_version`
          )
        },
        if (!is.null(self$`active`)) {
          sprintf(
          '"active":
            %s
                    ',
          tolower(self$`active`)
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
    #' Deserialize JSON string into an instance of BundleV1Exp
    #'
    #' @description
    #' Deserialize JSON string into an instance of BundleV1Exp
    #'
    #' @param input_json the JSON input
    #' @return the instance of BundleV1Exp
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`content_guid` <- this_object$`content_guid`
      self$`created_time` <- this_object$`created_time`
      self$`cluster_name` <- this_object$`cluster_name`
      self$`image_name` <- this_object$`image_name`
      self$`r_version` <- this_object$`r_version`
      self$`py_version` <- this_object$`py_version`
      self$`quarto_version` <- this_object$`quarto_version`
      self$`active` <- this_object$`active`
      self$`size` <- this_object$`size`
      self
    },
    #' Validate JSON input with respect to BundleV1Exp
    #'
    #' @description
    #' Validate JSON input with respect to BundleV1Exp and throw an exception if invalid
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
    #' @return String representation of BundleV1Exp
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
# BundleV1Exp$unlock()
#
## Below is an example to define the print function
# BundleV1Exp$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# BundleV1Exp$lock()

