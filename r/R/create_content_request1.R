#' Create a new CreateContentRequest1
#'
#' @description
#' The Content fields that can be specified when creating or updating a content item.
#'
#' @docType class
#' @title CreateContentRequest1
#' @description CreateContentRequest1 Class
#' @format An \code{R6Class} generator object
#' @field name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`). character
#' @field title The title of this content. character [optional]
#' @field description A rich description of this content. character [optional]
#' @field access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content. character [optional]
#' @field connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched Shiny application, for example, before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand. numeric [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreateContentRequest1 <- R6::R6Class(
  "CreateContentRequest1",
  public = list(
    `name` = NULL,
    `title` = NULL,
    `description` = NULL,
    `access_type` = NULL,
    `connection_timeout` = NULL,
    `read_timeout` = NULL,
    `init_timeout` = NULL,
    `idle_timeout` = NULL,
    `max_processes` = NULL,
    `min_processes` = NULL,
    `max_conns_per_process` = NULL,
    `load_factor` = NULL,
    #' Initialize a new CreateContentRequest1 class.
    #'
    #' @description
    #' Initialize a new CreateContentRequest1 class.
    #'
    #' @param name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`).
    #' @param title The title of this content.. Default to "null".
    #' @param description A rich description of this content.. Default to "".
    #' @param access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content.. Default to "acl".
    #' @param connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand.
    #' @param read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand.
    #' @param init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched Shiny application, for example, before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand.
    #' @param idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand.
    #' @param max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.
    #' @param min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.
    #' @param max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand.
    #' @param load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name`, `title` = "null", `description` = "", `access_type` = "acl", `connection_timeout` = NULL, `read_timeout` = NULL, `init_timeout` = NULL, `idle_timeout` = NULL, `max_processes` = NULL, `min_processes` = NULL, `max_conns_per_process` = NULL, `load_factor` = NULL, ...) {
      if (!missing(`name`)) {
        if (!(is.character(`name`) && length(`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", `name`))
        }
        self$`name` <- `name`
      }
      if (!is.null(`title`)) {
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
      if (!is.null(`access_type`)) {
        if (!(`access_type` %in% c("all", "logged_in", "acl"))) {
          stop(paste("Error! \"", `access_type`, "\" cannot be assigned to `access_type`. Must be \"all\", \"logged_in\", \"acl\".", sep = ""))
        }
        if (!(is.character(`access_type`) && length(`access_type`) == 1)) {
          stop(paste("Error! Invalid data for `access_type`. Must be a string:", `access_type`))
        }
        self$`access_type` <- `access_type`
      }
      if (!is.null(`connection_timeout`)) {
        if (!(is.numeric(`connection_timeout`) && length(`connection_timeout`) == 1)) {
          stop(paste("Error! Invalid data for `connection_timeout`. Must be an integer:", `connection_timeout`))
        }
        self$`connection_timeout` <- `connection_timeout`
      }
      if (!is.null(`read_timeout`)) {
        if (!(is.numeric(`read_timeout`) && length(`read_timeout`) == 1)) {
          stop(paste("Error! Invalid data for `read_timeout`. Must be an integer:", `read_timeout`))
        }
        self$`read_timeout` <- `read_timeout`
      }
      if (!is.null(`init_timeout`)) {
        if (!(is.numeric(`init_timeout`) && length(`init_timeout`) == 1)) {
          stop(paste("Error! Invalid data for `init_timeout`. Must be an integer:", `init_timeout`))
        }
        self$`init_timeout` <- `init_timeout`
      }
      if (!is.null(`idle_timeout`)) {
        if (!(is.numeric(`idle_timeout`) && length(`idle_timeout`) == 1)) {
          stop(paste("Error! Invalid data for `idle_timeout`. Must be an integer:", `idle_timeout`))
        }
        self$`idle_timeout` <- `idle_timeout`
      }
      if (!is.null(`max_processes`)) {
        if (!(is.numeric(`max_processes`) && length(`max_processes`) == 1)) {
          stop(paste("Error! Invalid data for `max_processes`. Must be an integer:", `max_processes`))
        }
        self$`max_processes` <- `max_processes`
      }
      if (!is.null(`min_processes`)) {
        if (!(is.numeric(`min_processes`) && length(`min_processes`) == 1)) {
          stop(paste("Error! Invalid data for `min_processes`. Must be an integer:", `min_processes`))
        }
        self$`min_processes` <- `min_processes`
      }
      if (!is.null(`max_conns_per_process`)) {
        if (!(is.numeric(`max_conns_per_process`) && length(`max_conns_per_process`) == 1)) {
          stop(paste("Error! Invalid data for `max_conns_per_process`. Must be an integer:", `max_conns_per_process`))
        }
        self$`max_conns_per_process` <- `max_conns_per_process`
      }
      if (!is.null(`load_factor`)) {
        if (!(is.numeric(`load_factor`) && length(`load_factor`) == 1)) {
          stop(paste("Error! Invalid data for `load_factor`. Must be a number:", `load_factor`))
        }
        self$`load_factor` <- `load_factor`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateContentRequest1 in JSON format
    #' @export
    toJSON = function() {
      CreateContentRequest1Object <- list()
      if (!is.null(self$`name`)) {
        CreateContentRequest1Object[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`title`)) {
        CreateContentRequest1Object[["title"]] <-
          self$`title`
      }
      if (!is.null(self$`description`)) {
        CreateContentRequest1Object[["description"]] <-
          self$`description`
      }
      if (!is.null(self$`access_type`)) {
        CreateContentRequest1Object[["access_type"]] <-
          self$`access_type`
      }
      if (!is.null(self$`connection_timeout`)) {
        CreateContentRequest1Object[["connection_timeout"]] <-
          self$`connection_timeout`
      }
      if (!is.null(self$`read_timeout`)) {
        CreateContentRequest1Object[["read_timeout"]] <-
          self$`read_timeout`
      }
      if (!is.null(self$`init_timeout`)) {
        CreateContentRequest1Object[["init_timeout"]] <-
          self$`init_timeout`
      }
      if (!is.null(self$`idle_timeout`)) {
        CreateContentRequest1Object[["idle_timeout"]] <-
          self$`idle_timeout`
      }
      if (!is.null(self$`max_processes`)) {
        CreateContentRequest1Object[["max_processes"]] <-
          self$`max_processes`
      }
      if (!is.null(self$`min_processes`)) {
        CreateContentRequest1Object[["min_processes"]] <-
          self$`min_processes`
      }
      if (!is.null(self$`max_conns_per_process`)) {
        CreateContentRequest1Object[["max_conns_per_process"]] <-
          self$`max_conns_per_process`
      }
      if (!is.null(self$`load_factor`)) {
        CreateContentRequest1Object[["load_factor"]] <-
          self$`load_factor`
      }
      CreateContentRequest1Object
    },
    #' Deserialize JSON string into an instance of CreateContentRequest1
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateContentRequest1
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateContentRequest1
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`name`)) {
        self$`name` <- this_object$`name`
      }
      if (!is.null(this_object$`title`)) {
        self$`title` <- this_object$`title`
      }
      if (!is.null(this_object$`description`)) {
        self$`description` <- this_object$`description`
      }
      if (!is.null(this_object$`access_type`)) {
        if (!is.null(this_object$`access_type`) && !(this_object$`access_type` %in% c("all", "logged_in", "acl"))) {
          stop(paste("Error! \"", this_object$`access_type`, "\" cannot be assigned to `access_type`. Must be \"all\", \"logged_in\", \"acl\".", sep = ""))
        }
        self$`access_type` <- this_object$`access_type`
      }
      if (!is.null(this_object$`connection_timeout`)) {
        self$`connection_timeout` <- this_object$`connection_timeout`
      }
      if (!is.null(this_object$`read_timeout`)) {
        self$`read_timeout` <- this_object$`read_timeout`
      }
      if (!is.null(this_object$`init_timeout`)) {
        self$`init_timeout` <- this_object$`init_timeout`
      }
      if (!is.null(this_object$`idle_timeout`)) {
        self$`idle_timeout` <- this_object$`idle_timeout`
      }
      if (!is.null(this_object$`max_processes`)) {
        self$`max_processes` <- this_object$`max_processes`
      }
      if (!is.null(this_object$`min_processes`)) {
        self$`min_processes` <- this_object$`min_processes`
      }
      if (!is.null(this_object$`max_conns_per_process`)) {
        self$`max_conns_per_process` <- this_object$`max_conns_per_process`
      }
      if (!is.null(this_object$`load_factor`)) {
        self$`load_factor` <- this_object$`load_factor`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateContentRequest1 in JSON format
    #' @export
    toJSONString = function() {
      jsoncontent <- c(
        if (!is.null(self$`name`)) {
          sprintf(
          '"name":
            "%s"
                    ',
          self$`name`
          )
        },
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
        if (!is.null(self$`access_type`)) {
          sprintf(
          '"access_type":
            "%s"
                    ',
          self$`access_type`
          )
        },
        if (!is.null(self$`connection_timeout`)) {
          sprintf(
          '"connection_timeout":
            %d
                    ',
          self$`connection_timeout`
          )
        },
        if (!is.null(self$`read_timeout`)) {
          sprintf(
          '"read_timeout":
            %d
                    ',
          self$`read_timeout`
          )
        },
        if (!is.null(self$`init_timeout`)) {
          sprintf(
          '"init_timeout":
            %d
                    ',
          self$`init_timeout`
          )
        },
        if (!is.null(self$`idle_timeout`)) {
          sprintf(
          '"idle_timeout":
            %d
                    ',
          self$`idle_timeout`
          )
        },
        if (!is.null(self$`max_processes`)) {
          sprintf(
          '"max_processes":
            %d
                    ',
          self$`max_processes`
          )
        },
        if (!is.null(self$`min_processes`)) {
          sprintf(
          '"min_processes":
            %d
                    ',
          self$`min_processes`
          )
        },
        if (!is.null(self$`max_conns_per_process`)) {
          sprintf(
          '"max_conns_per_process":
            %d
                    ',
          self$`max_conns_per_process`
          )
        },
        if (!is.null(self$`load_factor`)) {
          sprintf(
          '"load_factor":
            %d
                    ',
          self$`load_factor`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of CreateContentRequest1
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateContentRequest1
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateContentRequest1
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`name` <- this_object$`name`
      self$`title` <- this_object$`title`
      self$`description` <- this_object$`description`
      if (!is.null(this_object$`access_type`) && !(this_object$`access_type` %in% c("all", "logged_in", "acl"))) {
        stop(paste("Error! \"", this_object$`access_type`, "\" cannot be assigned to `access_type`. Must be \"all\", \"logged_in\", \"acl\".", sep = ""))
      }
      self$`access_type` <- this_object$`access_type`
      self$`connection_timeout` <- this_object$`connection_timeout`
      self$`read_timeout` <- this_object$`read_timeout`
      self$`init_timeout` <- this_object$`init_timeout`
      self$`idle_timeout` <- this_object$`idle_timeout`
      self$`max_processes` <- this_object$`max_processes`
      self$`min_processes` <- this_object$`min_processes`
      self$`max_conns_per_process` <- this_object$`max_conns_per_process`
      self$`load_factor` <- this_object$`load_factor`
      self
    },
    #' Validate JSON input with respect to CreateContentRequest1
    #'
    #' @description
    #' Validate JSON input with respect to CreateContentRequest1 and throw an exception if invalid
    #'
    #' @param input the JSON input
    #' @export
    validateJSON = function(input) {
      input_json <- jsonlite::fromJSON(input)
      # check the required field `name`
      if (!is.null(input_json$`name`)) {
        if (!(is.character(input_json$`name`) && length(input_json$`name`) == 1)) {
          stop(paste("Error! Invalid data for `name`. Must be a string:", input_json$`name`))
        }
      } else {
        stop(paste("The JSON input `", input, "` is invalid for CreateContentRequest1: the required field `name` is missing."))
      }
    },
    #' To string (JSON format)
    #'
    #' @description
    #' To string (JSON format)
    #'
    #' @return String representation of CreateContentRequest1
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
# CreateContentRequest1$unlock()
#
## Below is an example to define the print function
# CreateContentRequest1$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreateContentRequest1$lock()

