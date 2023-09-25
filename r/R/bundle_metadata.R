#' Create a new BundleMetadata
#'
#' @description
#' Metadata object associated with this bundle.
#'
#' @docType class
#' @title BundleMetadata
#' @description BundleMetadata Class
#' @format An \code{R6Class} generator object
#' @field source Source for this bundle. `null` for uploaded bundles, or `git` for bundles fetched from a git repository. character [optional]
#' @field source_repo Git repository URL for this bundle. `null` for bundles that were not fetched from a git repository. character [optional]
#' @field source_branch Git repository branch name for this bundle. `null` for bundles that were not fetched from a git repository. character [optional]
#' @field source_commit Git commit ID (hash) for this bundle. `null` for bundles that were not fetched from a git repository. character [optional]
#' @field archive_md5 MD5 hash of the archive file for this bundle. `null` for bundles uploaded before this field was added. character [optional]
#' @field archive_sha1 SHA1 hash of the archive file for this bundle. `null` for bundles uploaded before this field was added. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BundleMetadata <- R6::R6Class(
  "BundleMetadata",
  public = list(
    `source` = NULL,
    `source_repo` = NULL,
    `source_branch` = NULL,
    `source_commit` = NULL,
    `archive_md5` = NULL,
    `archive_sha1` = NULL,
    #' Initialize a new BundleMetadata class.
    #'
    #' @description
    #' Initialize a new BundleMetadata class.
    #'
    #' @param source Source for this bundle. `null` for uploaded bundles, or `git` for bundles fetched from a git repository.
    #' @param source_repo Git repository URL for this bundle. `null` for bundles that were not fetched from a git repository.
    #' @param source_branch Git repository branch name for this bundle. `null` for bundles that were not fetched from a git repository.
    #' @param source_commit Git commit ID (hash) for this bundle. `null` for bundles that were not fetched from a git repository.
    #' @param archive_md5 MD5 hash of the archive file for this bundle. `null` for bundles uploaded before this field was added.
    #' @param archive_sha1 SHA1 hash of the archive file for this bundle. `null` for bundles uploaded before this field was added.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`source` = NULL, `source_repo` = NULL, `source_branch` = NULL, `source_commit` = NULL, `archive_md5` = NULL, `archive_sha1` = NULL, ...) {
      if (!is.null(`source`)) {
        if (!(is.character(`source`) && length(`source`) == 1)) {
          stop(paste("Error! Invalid data for `source`. Must be a string:", `source`))
        }
        self$`source` <- `source`
      }
      if (!is.null(`source_repo`)) {
        if (!(is.character(`source_repo`) && length(`source_repo`) == 1)) {
          stop(paste("Error! Invalid data for `source_repo`. Must be a string:", `source_repo`))
        }
        self$`source_repo` <- `source_repo`
      }
      if (!is.null(`source_branch`)) {
        if (!(is.character(`source_branch`) && length(`source_branch`) == 1)) {
          stop(paste("Error! Invalid data for `source_branch`. Must be a string:", `source_branch`))
        }
        self$`source_branch` <- `source_branch`
      }
      if (!is.null(`source_commit`)) {
        if (!(is.character(`source_commit`) && length(`source_commit`) == 1)) {
          stop(paste("Error! Invalid data for `source_commit`. Must be a string:", `source_commit`))
        }
        self$`source_commit` <- `source_commit`
      }
      if (!is.null(`archive_md5`)) {
        if (!(is.character(`archive_md5`) && length(`archive_md5`) == 1)) {
          stop(paste("Error! Invalid data for `archive_md5`. Must be a string:", `archive_md5`))
        }
        self$`archive_md5` <- `archive_md5`
      }
      if (!is.null(`archive_sha1`)) {
        if (!(is.character(`archive_sha1`) && length(`archive_sha1`) == 1)) {
          stop(paste("Error! Invalid data for `archive_sha1`. Must be a string:", `archive_sha1`))
        }
        self$`archive_sha1` <- `archive_sha1`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BundleMetadata in JSON format
    #' @export
    toJSON = function() {
      BundleMetadataObject <- list()
      if (!is.null(self$`source`)) {
        BundleMetadataObject[["source"]] <-
          self$`source`
      }
      if (!is.null(self$`source_repo`)) {
        BundleMetadataObject[["source_repo"]] <-
          self$`source_repo`
      }
      if (!is.null(self$`source_branch`)) {
        BundleMetadataObject[["source_branch"]] <-
          self$`source_branch`
      }
      if (!is.null(self$`source_commit`)) {
        BundleMetadataObject[["source_commit"]] <-
          self$`source_commit`
      }
      if (!is.null(self$`archive_md5`)) {
        BundleMetadataObject[["archive_md5"]] <-
          self$`archive_md5`
      }
      if (!is.null(self$`archive_sha1`)) {
        BundleMetadataObject[["archive_sha1"]] <-
          self$`archive_sha1`
      }
      BundleMetadataObject
    },
    #' Deserialize JSON string into an instance of BundleMetadata
    #'
    #' @description
    #' Deserialize JSON string into an instance of BundleMetadata
    #'
    #' @param input_json the JSON input
    #' @return the instance of BundleMetadata
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`source`)) {
        self$`source` <- this_object$`source`
      }
      if (!is.null(this_object$`source_repo`)) {
        self$`source_repo` <- this_object$`source_repo`
      }
      if (!is.null(this_object$`source_branch`)) {
        self$`source_branch` <- this_object$`source_branch`
      }
      if (!is.null(this_object$`source_commit`)) {
        self$`source_commit` <- this_object$`source_commit`
      }
      if (!is.null(this_object$`archive_md5`)) {
        self$`archive_md5` <- this_object$`archive_md5`
      }
      if (!is.null(this_object$`archive_sha1`)) {
        self$`archive_sha1` <- this_object$`archive_sha1`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return BundleMetadata in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`source`)) {
          sprintf(
          '"source":
            "%s"
                    ',
          self$`source`
          )
        },
        if (!is.null(self$`source_repo`)) {
          sprintf(
          '"source_repo":
            "%s"
                    ',
          self$`source_repo`
          )
        },
        if (!is.null(self$`source_branch`)) {
          sprintf(
          '"source_branch":
            "%s"
                    ',
          self$`source_branch`
          )
        },
        if (!is.null(self$`source_commit`)) {
          sprintf(
          '"source_commit":
            "%s"
                    ',
          self$`source_commit`
          )
        },
        if (!is.null(self$`archive_md5`)) {
          sprintf(
          '"archive_md5":
            "%s"
                    ',
          self$`archive_md5`
          )
        },
        if (!is.null(self$`archive_sha1`)) {
          sprintf(
          '"archive_sha1":
            "%s"
                    ',
          self$`archive_sha1`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of BundleMetadata
    #'
    #' @description
    #' Deserialize JSON string into an instance of BundleMetadata
    #'
    #' @param input_json the JSON input
    #' @return the instance of BundleMetadata
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`source` <- this_object$`source`
      self$`source_repo` <- this_object$`source_repo`
      self$`source_branch` <- this_object$`source_branch`
      self$`source_commit` <- this_object$`source_commit`
      self$`archive_md5` <- this_object$`archive_md5`
      self$`archive_sha1` <- this_object$`archive_sha1`
      self
    },
    #' Validate JSON input with respect to BundleMetadata
    #'
    #' @description
    #' Validate JSON input with respect to BundleMetadata and throw an exception if invalid
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
    #' @return String representation of BundleMetadata
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
# BundleMetadata$unlock()
#
## Below is an example to define the print function
# BundleMetadata$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# BundleMetadata$lock()

