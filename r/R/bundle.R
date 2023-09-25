#' Create a new Bundle
#'
#' @description
#' Content published to Posit Connect is encapsulated in a \"bundle\" that contains the source code and data necessary to execute the content. An application or report is updated by uploading a new bundle.
#'
#' @docType class
#' @title Bundle
#' @description Bundle Class
#' @format An \code{R6Class} generator object
#' @field id The identifier for this bundle. character [optional]
#' @field content_guid The identifier of the owning content. character [optional]
#' @field created_time The timestamp (RFC3339) of when this bundle was created. character [optional]
#' @field cluster_name The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field image_name The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \"viewer\" role and returned with the value `null`. character [optional]
#' @field r_version The version of R used when last restoring this bundle. A `null` value represents that R is not used by this bundle or that the bundle has not been prepared for execution.  R version is not disclosed to users with a \"viewer\" role; they receive a `null` value. character [optional]
#' @field r_environment_management Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. The `null` value represents that R is not used by this bundle or that it has not yet been determined if an R environment is required.  R environment management is not disclosed to users with a \"viewer\" role; they receive a `null` value. character [optional]
#' @field py_version The version of Python used when last restoring this bundle. A `null` value represents that Python is not used by this bundle or that the bundle has not been prepared for execution.  Python version is not disclosed to users with a \"viewer\" role; they receive a `null` value. character [optional]
#' @field py_environment_management Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. The `null` value represents that Python is not used by this bundle or that it has not yet been determined if a Python environment is required.  Python environment management is not disclosed to users with a \"viewer\" role; they receive a `null` value. character [optional]
#' @field quarto_version The version of Quarto used when last restoring this bundle. A `null` value represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \"viewer\" role; they receive a `null` value. character [optional]
#' @field active Indicates if this bundle is active for the owning content. character [optional]
#' @field size On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file. integer [optional]
#' @field metadata  \link{BundleMetadata} [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Bundle <- R6::R6Class(
  "Bundle",
  public = list(
    `id` = NULL,
    `content_guid` = NULL,
    `created_time` = NULL,
    `cluster_name` = NULL,
    `image_name` = NULL,
    `r_version` = NULL,
    `r_environment_management` = NULL,
    `py_version` = NULL,
    `py_environment_management` = NULL,
    `quarto_version` = NULL,
    `active` = NULL,
    `size` = NULL,
    `metadata` = NULL,
    #' Initialize a new Bundle class.
    #'
    #' @description
    #' Initialize a new Bundle class.
    #'
    #' @param id The identifier for this bundle.
    #' @param content_guid The identifier of the owning content.
    #' @param created_time The timestamp (RFC3339) of when this bundle was created.
    #' @param cluster_name The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param image_name The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \"viewer\" role and returned with the value `null`.
    #' @param r_version The version of R used when last restoring this bundle. A `null` value represents that R is not used by this bundle or that the bundle has not been prepared for execution.  R version is not disclosed to users with a \"viewer\" role; they receive a `null` value.
    #' @param r_environment_management Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. The `null` value represents that R is not used by this bundle or that it has not yet been determined if an R environment is required.  R environment management is not disclosed to users with a \"viewer\" role; they receive a `null` value.
    #' @param py_version The version of Python used when last restoring this bundle. A `null` value represents that Python is not used by this bundle or that the bundle has not been prepared for execution.  Python version is not disclosed to users with a \"viewer\" role; they receive a `null` value.
    #' @param py_environment_management Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. The `null` value represents that Python is not used by this bundle or that it has not yet been determined if a Python environment is required.  Python environment management is not disclosed to users with a \"viewer\" role; they receive a `null` value.
    #' @param quarto_version The version of Quarto used when last restoring this bundle. A `null` value represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \"viewer\" role; they receive a `null` value.
    #' @param active Indicates if this bundle is active for the owning content.
    #' @param size On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file.
    #' @param metadata metadata
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `content_guid` = NULL, `created_time` = NULL, `cluster_name` = NULL, `image_name` = NULL, `r_version` = NULL, `r_environment_management` = NULL, `py_version` = NULL, `py_environment_management` = NULL, `quarto_version` = NULL, `active` = NULL, `size` = NULL, `metadata` = NULL, ...) {
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
      if (!is.null(`r_environment_management`)) {
        if (!(is.logical(`r_environment_management`) && length(`r_environment_management`) == 1)) {
          stop(paste("Error! Invalid data for `r_environment_management`. Must be a boolean:", `r_environment_management`))
        }
        self$`r_environment_management` <- `r_environment_management`
      }
      if (!is.null(`py_version`)) {
        if (!(is.character(`py_version`) && length(`py_version`) == 1)) {
          stop(paste("Error! Invalid data for `py_version`. Must be a string:", `py_version`))
        }
        self$`py_version` <- `py_version`
      }
      if (!is.null(`py_environment_management`)) {
        if (!(is.logical(`py_environment_management`) && length(`py_environment_management`) == 1)) {
          stop(paste("Error! Invalid data for `py_environment_management`. Must be a boolean:", `py_environment_management`))
        }
        self$`py_environment_management` <- `py_environment_management`
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
          stop(paste("Error! Invalid data for `size`. Must be an integer:", `size`))
        }
        self$`size` <- `size`
      }
      if (!is.null(`metadata`)) {
        stopifnot(R6::is.R6(`metadata`))
        self$`metadata` <- `metadata`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Bundle in JSON format
    #' @export
    toJSON = function() {
      BundleObject <- list()
      if (!is.null(self$`id`)) {
        BundleObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`content_guid`)) {
        BundleObject[["content_guid"]] <-
          self$`content_guid`
      }
      if (!is.null(self$`created_time`)) {
        BundleObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`cluster_name`)) {
        BundleObject[["cluster_name"]] <-
          self$`cluster_name`
      }
      if (!is.null(self$`image_name`)) {
        BundleObject[["image_name"]] <-
          self$`image_name`
      }
      if (!is.null(self$`r_version`)) {
        BundleObject[["r_version"]] <-
          self$`r_version`
      }
      if (!is.null(self$`r_environment_management`)) {
        BundleObject[["r_environment_management"]] <-
          self$`r_environment_management`
      }
      if (!is.null(self$`py_version`)) {
        BundleObject[["py_version"]] <-
          self$`py_version`
      }
      if (!is.null(self$`py_environment_management`)) {
        BundleObject[["py_environment_management"]] <-
          self$`py_environment_management`
      }
      if (!is.null(self$`quarto_version`)) {
        BundleObject[["quarto_version"]] <-
          self$`quarto_version`
      }
      if (!is.null(self$`active`)) {
        BundleObject[["active"]] <-
          self$`active`
      }
      if (!is.null(self$`size`)) {
        BundleObject[["size"]] <-
          self$`size`
      }
      if (!is.null(self$`metadata`)) {
        BundleObject[["metadata"]] <-
          self$`metadata`$toJSON()
      }
      BundleObject
    },
    #' Deserialize JSON string into an instance of Bundle
    #'
    #' @description
    #' Deserialize JSON string into an instance of Bundle
    #'
    #' @param input_json the JSON input
    #' @return the instance of Bundle
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
      if (!is.null(this_object$`r_environment_management`)) {
        self$`r_environment_management` <- this_object$`r_environment_management`
      }
      if (!is.null(this_object$`py_version`)) {
        self$`py_version` <- this_object$`py_version`
      }
      if (!is.null(this_object$`py_environment_management`)) {
        self$`py_environment_management` <- this_object$`py_environment_management`
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
      if (!is.null(this_object$`metadata`)) {
        `metadata_object` <- BundleMetadata$new()
        `metadata_object`$fromJSON(jsonlite::toJSON(this_object$`metadata`, auto_unbox = TRUE, digits = NA))
        self$`metadata` <- `metadata_object`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Bundle in JSON format
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
        if (!is.null(self$`r_environment_management`)) {
          sprintf(
          '"r_environment_management":
            %s
                    ',
          tolower(self$`r_environment_management`)
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
        if (!is.null(self$`py_environment_management`)) {
          sprintf(
          '"py_environment_management":
            %s
                    ',
          tolower(self$`py_environment_management`)
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
        },
        if (!is.null(self$`metadata`)) {
          sprintf(
          '"metadata":
          %s
          ',
          jsonlite::toJSON(self$`metadata`$toJSON(), auto_unbox = TRUE, digits = NA)
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Bundle
    #'
    #' @description
    #' Deserialize JSON string into an instance of Bundle
    #'
    #' @param input_json the JSON input
    #' @return the instance of Bundle
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`content_guid` <- this_object$`content_guid`
      self$`created_time` <- this_object$`created_time`
      self$`cluster_name` <- this_object$`cluster_name`
      self$`image_name` <- this_object$`image_name`
      self$`r_version` <- this_object$`r_version`
      self$`r_environment_management` <- this_object$`r_environment_management`
      self$`py_version` <- this_object$`py_version`
      self$`py_environment_management` <- this_object$`py_environment_management`
      self$`quarto_version` <- this_object$`quarto_version`
      self$`active` <- this_object$`active`
      self$`size` <- this_object$`size`
      self$`metadata` <- BundleMetadata$new()$fromJSON(jsonlite::toJSON(this_object$`metadata`, auto_unbox = TRUE, digits = NA))
      self
    },
    #' Validate JSON input with respect to Bundle
    #'
    #' @description
    #' Validate JSON input with respect to Bundle and throw an exception if invalid
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
    #' @return String representation of Bundle
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
# Bundle$unlock()
#
## Below is an example to define the print function
# Bundle$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Bundle$lock()

