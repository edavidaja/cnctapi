#' Create a new JobItem
#'
#' @description
#' JobItem Class
#'
#' @docType class
#' @title JobItem
#' @description JobItem Class
#' @format An \code{R6Class} generator object
#' @field id The job identifier. character [optional]
#' @field ppid The job's parent process identifier. character [optional]
#' @field pid The job's process identifier. character [optional]
#' @field key The job's unique key identifier. character [optional]
#' @field remote_id The job's identifier for off-host execution configurations. character [optional]
#' @field app_id The job's parent content identifier character [optional]
#' @field variant_id The identifier of the variant owning this job. character [optional]
#' @field bundle_id The identifier of a content bundle linked to this job. character [optional]
#' @field start_time The timestamp (RFC3339) indicating when this job started. character [optional]
#' @field end_time The timestamp (RFC3339) indicating when this job finished. character [optional]
#' @field last_heartbeat_time The timestamp (RFC3339) indicating the last time  this job was observed to be running. character [optional]
#' @field queued_time The timestamp (RFC3339) indicating when this job was added to the queue to be processed. Only scheduled reports will present a value for this field. character [optional]
#' @field queue_name The name of the queue which processes the job. Only scheduled reports  will present a value for this field. character [optional]
#' @field tag A tag to identify the nature of the job. It can be one of `unknown`, `build_report`, `build_site`, `build_jupyter`, `packrat_restore`, `python_restore`, `configure_report`, `run_app`, `run_api`, `run_tensorflow` (obsolete), `run_python_api`, `run_dash_app`, `run_streamlit`, `run_bokeh_app`, `run_fastapi_app`, `run_pyshiny_app`, `render_shiny`, `run_voila_app`, `testing`, `git`, `val_py_ext_pkg`, `val_r_ext_pkg`, `val_r_install`. character [optional]
#' @field exit_code The job's exit code. Present only when job is finished. integer [optional]
#' @field status The current status of the job. It can be one of Active: `0`, Finished: `1`, Finalized: `2`. integer [optional]
#' @field hostname The name of the node which processes the job. character [optional]
#' @field cluster The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. Gives the name of the cluster when run external to the Connect host. character [optional]
#' @field image The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. References the name of the target image when content runs in a clustered environment such as Kubernetes. character [optional]
#' @field run_as The UNIX user that executed this job. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
JobItem <- R6::R6Class(
  "JobItem",
  public = list(
    `id` = NULL,
    `ppid` = NULL,
    `pid` = NULL,
    `key` = NULL,
    `remote_id` = NULL,
    `app_id` = NULL,
    `variant_id` = NULL,
    `bundle_id` = NULL,
    `start_time` = NULL,
    `end_time` = NULL,
    `last_heartbeat_time` = NULL,
    `queued_time` = NULL,
    `queue_name` = NULL,
    `tag` = NULL,
    `exit_code` = NULL,
    `status` = NULL,
    `hostname` = NULL,
    `cluster` = NULL,
    `image` = NULL,
    `run_as` = NULL,
    #' Initialize a new JobItem class.
    #'
    #' @description
    #' Initialize a new JobItem class.
    #'
    #' @param id The job identifier.
    #' @param ppid The job's parent process identifier.
    #' @param pid The job's process identifier.
    #' @param key The job's unique key identifier.
    #' @param remote_id The job's identifier for off-host execution configurations.
    #' @param app_id The job's parent content identifier
    #' @param variant_id The identifier of the variant owning this job.
    #' @param bundle_id The identifier of a content bundle linked to this job.
    #' @param start_time The timestamp (RFC3339) indicating when this job started.
    #' @param end_time The timestamp (RFC3339) indicating when this job finished.
    #' @param last_heartbeat_time The timestamp (RFC3339) indicating the last time  this job was observed to be running.
    #' @param queued_time The timestamp (RFC3339) indicating when this job was added to the queue to be processed. Only scheduled reports will present a value for this field.
    #' @param queue_name The name of the queue which processes the job. Only scheduled reports  will present a value for this field.
    #' @param tag A tag to identify the nature of the job. It can be one of `unknown`, `build_report`, `build_site`, `build_jupyter`, `packrat_restore`, `python_restore`, `configure_report`, `run_app`, `run_api`, `run_tensorflow` (obsolete), `run_python_api`, `run_dash_app`, `run_streamlit`, `run_bokeh_app`, `run_fastapi_app`, `run_pyshiny_app`, `render_shiny`, `run_voila_app`, `testing`, `git`, `val_py_ext_pkg`, `val_r_ext_pkg`, `val_r_install`.
    #' @param exit_code The job's exit code. Present only when job is finished.
    #' @param status The current status of the job. It can be one of Active: `0`, Finished: `1`, Finalized: `2`.
    #' @param hostname The name of the node which processes the job.
    #' @param cluster The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. Gives the name of the cluster when run external to the Connect host.
    #' @param image The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. References the name of the target image when content runs in a clustered environment such as Kubernetes.
    #' @param run_as The UNIX user that executed this job.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`id` = NULL, `ppid` = NULL, `pid` = NULL, `key` = NULL, `remote_id` = NULL, `app_id` = NULL, `variant_id` = NULL, `bundle_id` = NULL, `start_time` = NULL, `end_time` = NULL, `last_heartbeat_time` = NULL, `queued_time` = NULL, `queue_name` = NULL, `tag` = NULL, `exit_code` = NULL, `status` = NULL, `hostname` = NULL, `cluster` = NULL, `image` = NULL, `run_as` = NULL, ...) {
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
      if (!is.null(`ppid`)) {
        if (!(is.character(`ppid`) && length(`ppid`) == 1)) {
          stop(paste("Error! Invalid data for `ppid`. Must be a string:", `ppid`))
        }
        self$`ppid` <- `ppid`
      }
      if (!is.null(`pid`)) {
        if (!(is.character(`pid`) && length(`pid`) == 1)) {
          stop(paste("Error! Invalid data for `pid`. Must be a string:", `pid`))
        }
        self$`pid` <- `pid`
      }
      if (!is.null(`key`)) {
        if (!(is.character(`key`) && length(`key`) == 1)) {
          stop(paste("Error! Invalid data for `key`. Must be a string:", `key`))
        }
        self$`key` <- `key`
      }
      if (!is.null(`remote_id`)) {
        if (!(is.character(`remote_id`) && length(`remote_id`) == 1)) {
          stop(paste("Error! Invalid data for `remote_id`. Must be a string:", `remote_id`))
        }
        self$`remote_id` <- `remote_id`
      }
      if (!is.null(`app_id`)) {
        if (!(is.character(`app_id`) && length(`app_id`) == 1)) {
          stop(paste("Error! Invalid data for `app_id`. Must be a string:", `app_id`))
        }
        self$`app_id` <- `app_id`
      }
      if (!is.null(`variant_id`)) {
        if (!(is.character(`variant_id`) && length(`variant_id`) == 1)) {
          stop(paste("Error! Invalid data for `variant_id`. Must be a string:", `variant_id`))
        }
        self$`variant_id` <- `variant_id`
      }
      if (!is.null(`bundle_id`)) {
        if (!(is.character(`bundle_id`) && length(`bundle_id`) == 1)) {
          stop(paste("Error! Invalid data for `bundle_id`. Must be a string:", `bundle_id`))
        }
        self$`bundle_id` <- `bundle_id`
      }
      if (!is.null(`start_time`)) {
        if (!is.character(`start_time`)) {
          stop(paste("Error! Invalid data for `start_time`. Must be a string:", `start_time`))
        }
        self$`start_time` <- `start_time`
      }
      if (!is.null(`end_time`)) {
        if (!is.character(`end_time`)) {
          stop(paste("Error! Invalid data for `end_time`. Must be a string:", `end_time`))
        }
        self$`end_time` <- `end_time`
      }
      if (!is.null(`last_heartbeat_time`)) {
        if (!is.character(`last_heartbeat_time`)) {
          stop(paste("Error! Invalid data for `last_heartbeat_time`. Must be a string:", `last_heartbeat_time`))
        }
        self$`last_heartbeat_time` <- `last_heartbeat_time`
      }
      if (!is.null(`queued_time`)) {
        if (!is.character(`queued_time`)) {
          stop(paste("Error! Invalid data for `queued_time`. Must be a string:", `queued_time`))
        }
        self$`queued_time` <- `queued_time`
      }
      if (!is.null(`queue_name`)) {
        if (!(is.character(`queue_name`) && length(`queue_name`) == 1)) {
          stop(paste("Error! Invalid data for `queue_name`. Must be a string:", `queue_name`))
        }
        self$`queue_name` <- `queue_name`
      }
      if (!is.null(`tag`)) {
        if (!(is.character(`tag`) && length(`tag`) == 1)) {
          stop(paste("Error! Invalid data for `tag`. Must be a string:", `tag`))
        }
        self$`tag` <- `tag`
      }
      if (!is.null(`exit_code`)) {
        if (!(is.numeric(`exit_code`) && length(`exit_code`) == 1)) {
          stop(paste("Error! Invalid data for `exit_code`. Must be an integer:", `exit_code`))
        }
        self$`exit_code` <- `exit_code`
      }
      if (!is.null(`status`)) {
        if (!(is.numeric(`status`) && length(`status`) == 1)) {
          stop(paste("Error! Invalid data for `status`. Must be an integer:", `status`))
        }
        self$`status` <- `status`
      }
      if (!is.null(`hostname`)) {
        if (!(is.character(`hostname`) && length(`hostname`) == 1)) {
          stop(paste("Error! Invalid data for `hostname`. Must be a string:", `hostname`))
        }
        self$`hostname` <- `hostname`
      }
      if (!is.null(`cluster`)) {
        if (!(is.character(`cluster`) && length(`cluster`) == 1)) {
          stop(paste("Error! Invalid data for `cluster`. Must be a string:", `cluster`))
        }
        self$`cluster` <- `cluster`
      }
      if (!is.null(`image`)) {
        if (!(is.character(`image`) && length(`image`) == 1)) {
          stop(paste("Error! Invalid data for `image`. Must be a string:", `image`))
        }
        self$`image` <- `image`
      }
      if (!is.null(`run_as`)) {
        if (!(is.character(`run_as`) && length(`run_as`) == 1)) {
          stop(paste("Error! Invalid data for `run_as`. Must be a string:", `run_as`))
        }
        self$`run_as` <- `run_as`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return JobItem in JSON format
    #' @export
    toJSON = function() {
      JobItemObject <- list()
      if (!is.null(self$`id`)) {
        JobItemObject[["id"]] <-
          self$`id`
      }
      if (!is.null(self$`ppid`)) {
        JobItemObject[["ppid"]] <-
          self$`ppid`
      }
      if (!is.null(self$`pid`)) {
        JobItemObject[["pid"]] <-
          self$`pid`
      }
      if (!is.null(self$`key`)) {
        JobItemObject[["key"]] <-
          self$`key`
      }
      if (!is.null(self$`remote_id`)) {
        JobItemObject[["remote_id"]] <-
          self$`remote_id`
      }
      if (!is.null(self$`app_id`)) {
        JobItemObject[["app_id"]] <-
          self$`app_id`
      }
      if (!is.null(self$`variant_id`)) {
        JobItemObject[["variant_id"]] <-
          self$`variant_id`
      }
      if (!is.null(self$`bundle_id`)) {
        JobItemObject[["bundle_id"]] <-
          self$`bundle_id`
      }
      if (!is.null(self$`start_time`)) {
        JobItemObject[["start_time"]] <-
          self$`start_time`
      }
      if (!is.null(self$`end_time`)) {
        JobItemObject[["end_time"]] <-
          self$`end_time`
      }
      if (!is.null(self$`last_heartbeat_time`)) {
        JobItemObject[["last_heartbeat_time"]] <-
          self$`last_heartbeat_time`
      }
      if (!is.null(self$`queued_time`)) {
        JobItemObject[["queued_time"]] <-
          self$`queued_time`
      }
      if (!is.null(self$`queue_name`)) {
        JobItemObject[["queue_name"]] <-
          self$`queue_name`
      }
      if (!is.null(self$`tag`)) {
        JobItemObject[["tag"]] <-
          self$`tag`
      }
      if (!is.null(self$`exit_code`)) {
        JobItemObject[["exit_code"]] <-
          self$`exit_code`
      }
      if (!is.null(self$`status`)) {
        JobItemObject[["status"]] <-
          self$`status`
      }
      if (!is.null(self$`hostname`)) {
        JobItemObject[["hostname"]] <-
          self$`hostname`
      }
      if (!is.null(self$`cluster`)) {
        JobItemObject[["cluster"]] <-
          self$`cluster`
      }
      if (!is.null(self$`image`)) {
        JobItemObject[["image"]] <-
          self$`image`
      }
      if (!is.null(self$`run_as`)) {
        JobItemObject[["run_as"]] <-
          self$`run_as`
      }
      JobItemObject
    },
    #' Deserialize JSON string into an instance of JobItem
    #'
    #' @description
    #' Deserialize JSON string into an instance of JobItem
    #'
    #' @param input_json the JSON input
    #' @return the instance of JobItem
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      if (!is.null(this_object$`ppid`)) {
        self$`ppid` <- this_object$`ppid`
      }
      if (!is.null(this_object$`pid`)) {
        self$`pid` <- this_object$`pid`
      }
      if (!is.null(this_object$`key`)) {
        self$`key` <- this_object$`key`
      }
      if (!is.null(this_object$`remote_id`)) {
        self$`remote_id` <- this_object$`remote_id`
      }
      if (!is.null(this_object$`app_id`)) {
        self$`app_id` <- this_object$`app_id`
      }
      if (!is.null(this_object$`variant_id`)) {
        self$`variant_id` <- this_object$`variant_id`
      }
      if (!is.null(this_object$`bundle_id`)) {
        self$`bundle_id` <- this_object$`bundle_id`
      }
      if (!is.null(this_object$`start_time`)) {
        self$`start_time` <- this_object$`start_time`
      }
      if (!is.null(this_object$`end_time`)) {
        self$`end_time` <- this_object$`end_time`
      }
      if (!is.null(this_object$`last_heartbeat_time`)) {
        self$`last_heartbeat_time` <- this_object$`last_heartbeat_time`
      }
      if (!is.null(this_object$`queued_time`)) {
        self$`queued_time` <- this_object$`queued_time`
      }
      if (!is.null(this_object$`queue_name`)) {
        self$`queue_name` <- this_object$`queue_name`
      }
      if (!is.null(this_object$`tag`)) {
        self$`tag` <- this_object$`tag`
      }
      if (!is.null(this_object$`exit_code`)) {
        self$`exit_code` <- this_object$`exit_code`
      }
      if (!is.null(this_object$`status`)) {
        self$`status` <- this_object$`status`
      }
      if (!is.null(this_object$`hostname`)) {
        self$`hostname` <- this_object$`hostname`
      }
      if (!is.null(this_object$`cluster`)) {
        self$`cluster` <- this_object$`cluster`
      }
      if (!is.null(this_object$`image`)) {
        self$`image` <- this_object$`image`
      }
      if (!is.null(this_object$`run_as`)) {
        self$`run_as` <- this_object$`run_as`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return JobItem in JSON format
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
        if (!is.null(self$`ppid`)) {
          sprintf(
          '"ppid":
            "%s"
                    ',
          self$`ppid`
          )
        },
        if (!is.null(self$`pid`)) {
          sprintf(
          '"pid":
            "%s"
                    ',
          self$`pid`
          )
        },
        if (!is.null(self$`key`)) {
          sprintf(
          '"key":
            "%s"
                    ',
          self$`key`
          )
        },
        if (!is.null(self$`remote_id`)) {
          sprintf(
          '"remote_id":
            "%s"
                    ',
          self$`remote_id`
          )
        },
        if (!is.null(self$`app_id`)) {
          sprintf(
          '"app_id":
            "%s"
                    ',
          self$`app_id`
          )
        },
        if (!is.null(self$`variant_id`)) {
          sprintf(
          '"variant_id":
            "%s"
                    ',
          self$`variant_id`
          )
        },
        if (!is.null(self$`bundle_id`)) {
          sprintf(
          '"bundle_id":
            "%s"
                    ',
          self$`bundle_id`
          )
        },
        if (!is.null(self$`start_time`)) {
          sprintf(
          '"start_time":
            "%s"
                    ',
          self$`start_time`
          )
        },
        if (!is.null(self$`end_time`)) {
          sprintf(
          '"end_time":
            "%s"
                    ',
          self$`end_time`
          )
        },
        if (!is.null(self$`last_heartbeat_time`)) {
          sprintf(
          '"last_heartbeat_time":
            "%s"
                    ',
          self$`last_heartbeat_time`
          )
        },
        if (!is.null(self$`queued_time`)) {
          sprintf(
          '"queued_time":
            "%s"
                    ',
          self$`queued_time`
          )
        },
        if (!is.null(self$`queue_name`)) {
          sprintf(
          '"queue_name":
            "%s"
                    ',
          self$`queue_name`
          )
        },
        if (!is.null(self$`tag`)) {
          sprintf(
          '"tag":
            "%s"
                    ',
          self$`tag`
          )
        },
        if (!is.null(self$`exit_code`)) {
          sprintf(
          '"exit_code":
            %d
                    ',
          self$`exit_code`
          )
        },
        if (!is.null(self$`status`)) {
          sprintf(
          '"status":
            %d
                    ',
          self$`status`
          )
        },
        if (!is.null(self$`hostname`)) {
          sprintf(
          '"hostname":
            "%s"
                    ',
          self$`hostname`
          )
        },
        if (!is.null(self$`cluster`)) {
          sprintf(
          '"cluster":
            "%s"
                    ',
          self$`cluster`
          )
        },
        if (!is.null(self$`image`)) {
          sprintf(
          '"image":
            "%s"
                    ',
          self$`image`
          )
        },
        if (!is.null(self$`run_as`)) {
          sprintf(
          '"run_as":
            "%s"
                    ',
          self$`run_as`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of JobItem
    #'
    #' @description
    #' Deserialize JSON string into an instance of JobItem
    #'
    #' @param input_json the JSON input
    #' @return the instance of JobItem
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`id` <- this_object$`id`
      self$`ppid` <- this_object$`ppid`
      self$`pid` <- this_object$`pid`
      self$`key` <- this_object$`key`
      self$`remote_id` <- this_object$`remote_id`
      self$`app_id` <- this_object$`app_id`
      self$`variant_id` <- this_object$`variant_id`
      self$`bundle_id` <- this_object$`bundle_id`
      self$`start_time` <- this_object$`start_time`
      self$`end_time` <- this_object$`end_time`
      self$`last_heartbeat_time` <- this_object$`last_heartbeat_time`
      self$`queued_time` <- this_object$`queued_time`
      self$`queue_name` <- this_object$`queue_name`
      self$`tag` <- this_object$`tag`
      self$`exit_code` <- this_object$`exit_code`
      self$`status` <- this_object$`status`
      self$`hostname` <- this_object$`hostname`
      self$`cluster` <- this_object$`cluster`
      self$`image` <- this_object$`image`
      self$`run_as` <- this_object$`run_as`
      self
    },
    #' Validate JSON input with respect to JobItem
    #'
    #' @description
    #' Validate JSON input with respect to JobItem and throw an exception if invalid
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
    #' @return String representation of JobItem
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
# JobItem$unlock()
#
## Below is an example to define the print function
# JobItem$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# JobItem$lock()

