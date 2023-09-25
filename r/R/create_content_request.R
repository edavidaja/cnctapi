#' Create a new CreateContentRequest
#'
#' @description
#' The Content fields that can be specified when creating a content item.
#'
#' @docType class
#' @title CreateContentRequest
#' @description CreateContentRequest Class
#' @format An \code{R6Class} generator object
#' @field name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`). character [optional]
#' @field title The title of this content. character [optional]
#' @field description A rich description of this content. character [optional]
#' @field access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content. character [optional]
#' @field connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.  The value cannot be greater than `Scheduler.MaxProcessesLimit`. integer [optional]
#' @field min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.  The value cannot be greater than `Scheduler.MinProcessesLimit`. integer [optional]
#' @field max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.  The valid range is between 0.0 and 1.0. numeric [optional]
#' @field cpu_request The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used.  The value cannot be greater than `Scheduler.MaxCPURequest`, or than the effective `cpu_limit`. numeric [optional]
#' @field cpu_limit The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used.  The value cannot be greater than `Scheduler.MaxCPULimit`, or less than the effective `cpu_request`. numeric [optional]
#' @field memory_request The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used.  The value cannot be greater than `Scheduler.MaxMemoryRequest`, or than the effective `memory_limit`. integer [optional]
#' @field memory_limit The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used.  The value cannot be greater than `Scheduler.MaxMemoryLimit`, or less than the effective `memory_request`. integer [optional]
#' @field run_as The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.   Only administrators can change this value. character [optional]
#' @field run_as_current_user Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value. character [optional]
#' @field default_image_name The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution. character [optional]
#' @field default_r_environment_management Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled. character [optional]
#' @field default_py_environment_management Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled. character [optional]
#' @field service_account_name The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
CreateContentRequest <- R6::R6Class(
  "CreateContentRequest",
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
    `cpu_request` = NULL,
    `cpu_limit` = NULL,
    `memory_request` = NULL,
    `memory_limit` = NULL,
    `run_as` = NULL,
    `run_as_current_user` = NULL,
    `default_image_name` = NULL,
    `default_r_environment_management` = NULL,
    `default_py_environment_management` = NULL,
    `service_account_name` = NULL,
    #' Initialize a new CreateContentRequest class.
    #'
    #' @description
    #' Initialize a new CreateContentRequest class.
    #'
    #' @param name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`).. Default to "".
    #' @param title The title of this content.. Default to "null".
    #' @param description A rich description of this content.. Default to "".
    #' @param access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content.. Default to "acl".
    #' @param connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand.
    #' @param read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand.
    #' @param init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand.
    #' @param idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand.
    #' @param max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.  The value cannot be greater than `Scheduler.MaxProcessesLimit`.
    #' @param min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.  The value cannot be greater than `Scheduler.MinProcessesLimit`.
    #' @param max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand.
    #' @param load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.  The valid range is between 0.0 and 1.0.
    #' @param cpu_request The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used.  The value cannot be greater than `Scheduler.MaxCPURequest`, or than the effective `cpu_limit`.
    #' @param cpu_limit The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used.  The value cannot be greater than `Scheduler.MaxCPULimit`, or less than the effective `cpu_request`.
    #' @param memory_request The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used.  The value cannot be greater than `Scheduler.MaxMemoryRequest`, or than the effective `memory_limit`.
    #' @param memory_limit The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used.  The value cannot be greater than `Scheduler.MaxMemoryLimit`, or less than the effective `memory_request`.
    #' @param run_as The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.   Only administrators can change this value.. Default to "null".
    #' @param run_as_current_user Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value.. Default to FALSE.
    #' @param default_image_name The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution.
    #' @param default_r_environment_management Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.. Default to FALSE.
    #' @param default_py_environment_management Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.. Default to FALSE.
    #' @param service_account_name The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value.. Default to "null".
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`name` = "", `title` = "null", `description` = "", `access_type` = "acl", `connection_timeout` = NULL, `read_timeout` = NULL, `init_timeout` = NULL, `idle_timeout` = NULL, `max_processes` = NULL, `min_processes` = NULL, `max_conns_per_process` = NULL, `load_factor` = NULL, `cpu_request` = NULL, `cpu_limit` = NULL, `memory_request` = NULL, `memory_limit` = NULL, `run_as` = "null", `run_as_current_user` = FALSE, `default_image_name` = NULL, `default_r_environment_management` = FALSE, `default_py_environment_management` = FALSE, `service_account_name` = "null", ...) {
      if (!is.null(`name`)) {
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
      if (!is.null(`cpu_request`)) {
        if (!(is.numeric(`cpu_request`) && length(`cpu_request`) == 1)) {
          stop(paste("Error! Invalid data for `cpu_request`. Must be a number:", `cpu_request`))
        }
        self$`cpu_request` <- `cpu_request`
      }
      if (!is.null(`cpu_limit`)) {
        if (!(is.numeric(`cpu_limit`) && length(`cpu_limit`) == 1)) {
          stop(paste("Error! Invalid data for `cpu_limit`. Must be a number:", `cpu_limit`))
        }
        self$`cpu_limit` <- `cpu_limit`
      }
      if (!is.null(`memory_request`)) {
        if (!(is.numeric(`memory_request`) && length(`memory_request`) == 1)) {
          stop(paste("Error! Invalid data for `memory_request`. Must be an integer:", `memory_request`))
        }
        self$`memory_request` <- `memory_request`
      }
      if (!is.null(`memory_limit`)) {
        if (!(is.numeric(`memory_limit`) && length(`memory_limit`) == 1)) {
          stop(paste("Error! Invalid data for `memory_limit`. Must be an integer:", `memory_limit`))
        }
        self$`memory_limit` <- `memory_limit`
      }
      if (!is.null(`run_as`)) {
        if (!(is.character(`run_as`) && length(`run_as`) == 1)) {
          stop(paste("Error! Invalid data for `run_as`. Must be a string:", `run_as`))
        }
        self$`run_as` <- `run_as`
      }
      if (!is.null(`run_as_current_user`)) {
        if (!(is.logical(`run_as_current_user`) && length(`run_as_current_user`) == 1)) {
          stop(paste("Error! Invalid data for `run_as_current_user`. Must be a boolean:", `run_as_current_user`))
        }
        self$`run_as_current_user` <- `run_as_current_user`
      }
      if (!is.null(`default_image_name`)) {
        if (!(is.character(`default_image_name`) && length(`default_image_name`) == 1)) {
          stop(paste("Error! Invalid data for `default_image_name`. Must be a string:", `default_image_name`))
        }
        self$`default_image_name` <- `default_image_name`
      }
      if (!is.null(`default_r_environment_management`)) {
        if (!(is.logical(`default_r_environment_management`) && length(`default_r_environment_management`) == 1)) {
          stop(paste("Error! Invalid data for `default_r_environment_management`. Must be a boolean:", `default_r_environment_management`))
        }
        self$`default_r_environment_management` <- `default_r_environment_management`
      }
      if (!is.null(`default_py_environment_management`)) {
        if (!(is.logical(`default_py_environment_management`) && length(`default_py_environment_management`) == 1)) {
          stop(paste("Error! Invalid data for `default_py_environment_management`. Must be a boolean:", `default_py_environment_management`))
        }
        self$`default_py_environment_management` <- `default_py_environment_management`
      }
      if (!is.null(`service_account_name`)) {
        if (!(is.character(`service_account_name`) && length(`service_account_name`) == 1)) {
          stop(paste("Error! Invalid data for `service_account_name`. Must be a string:", `service_account_name`))
        }
        self$`service_account_name` <- `service_account_name`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateContentRequest in JSON format
    #' @export
    toJSON = function() {
      CreateContentRequestObject <- list()
      if (!is.null(self$`name`)) {
        CreateContentRequestObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`title`)) {
        CreateContentRequestObject[["title"]] <-
          self$`title`
      }
      if (!is.null(self$`description`)) {
        CreateContentRequestObject[["description"]] <-
          self$`description`
      }
      if (!is.null(self$`access_type`)) {
        CreateContentRequestObject[["access_type"]] <-
          self$`access_type`
      }
      if (!is.null(self$`connection_timeout`)) {
        CreateContentRequestObject[["connection_timeout"]] <-
          self$`connection_timeout`
      }
      if (!is.null(self$`read_timeout`)) {
        CreateContentRequestObject[["read_timeout"]] <-
          self$`read_timeout`
      }
      if (!is.null(self$`init_timeout`)) {
        CreateContentRequestObject[["init_timeout"]] <-
          self$`init_timeout`
      }
      if (!is.null(self$`idle_timeout`)) {
        CreateContentRequestObject[["idle_timeout"]] <-
          self$`idle_timeout`
      }
      if (!is.null(self$`max_processes`)) {
        CreateContentRequestObject[["max_processes"]] <-
          self$`max_processes`
      }
      if (!is.null(self$`min_processes`)) {
        CreateContentRequestObject[["min_processes"]] <-
          self$`min_processes`
      }
      if (!is.null(self$`max_conns_per_process`)) {
        CreateContentRequestObject[["max_conns_per_process"]] <-
          self$`max_conns_per_process`
      }
      if (!is.null(self$`load_factor`)) {
        CreateContentRequestObject[["load_factor"]] <-
          self$`load_factor`
      }
      if (!is.null(self$`cpu_request`)) {
        CreateContentRequestObject[["cpu_request"]] <-
          self$`cpu_request`
      }
      if (!is.null(self$`cpu_limit`)) {
        CreateContentRequestObject[["cpu_limit"]] <-
          self$`cpu_limit`
      }
      if (!is.null(self$`memory_request`)) {
        CreateContentRequestObject[["memory_request"]] <-
          self$`memory_request`
      }
      if (!is.null(self$`memory_limit`)) {
        CreateContentRequestObject[["memory_limit"]] <-
          self$`memory_limit`
      }
      if (!is.null(self$`run_as`)) {
        CreateContentRequestObject[["run_as"]] <-
          self$`run_as`
      }
      if (!is.null(self$`run_as_current_user`)) {
        CreateContentRequestObject[["run_as_current_user"]] <-
          self$`run_as_current_user`
      }
      if (!is.null(self$`default_image_name`)) {
        CreateContentRequestObject[["default_image_name"]] <-
          self$`default_image_name`
      }
      if (!is.null(self$`default_r_environment_management`)) {
        CreateContentRequestObject[["default_r_environment_management"]] <-
          self$`default_r_environment_management`
      }
      if (!is.null(self$`default_py_environment_management`)) {
        CreateContentRequestObject[["default_py_environment_management"]] <-
          self$`default_py_environment_management`
      }
      if (!is.null(self$`service_account_name`)) {
        CreateContentRequestObject[["service_account_name"]] <-
          self$`service_account_name`
      }
      CreateContentRequestObject
    },
    #' Deserialize JSON string into an instance of CreateContentRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateContentRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateContentRequest
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
      if (!is.null(this_object$`cpu_request`)) {
        self$`cpu_request` <- this_object$`cpu_request`
      }
      if (!is.null(this_object$`cpu_limit`)) {
        self$`cpu_limit` <- this_object$`cpu_limit`
      }
      if (!is.null(this_object$`memory_request`)) {
        self$`memory_request` <- this_object$`memory_request`
      }
      if (!is.null(this_object$`memory_limit`)) {
        self$`memory_limit` <- this_object$`memory_limit`
      }
      if (!is.null(this_object$`run_as`)) {
        self$`run_as` <- this_object$`run_as`
      }
      if (!is.null(this_object$`run_as_current_user`)) {
        self$`run_as_current_user` <- this_object$`run_as_current_user`
      }
      if (!is.null(this_object$`default_image_name`)) {
        self$`default_image_name` <- this_object$`default_image_name`
      }
      if (!is.null(this_object$`default_r_environment_management`)) {
        self$`default_r_environment_management` <- this_object$`default_r_environment_management`
      }
      if (!is.null(this_object$`default_py_environment_management`)) {
        self$`default_py_environment_management` <- this_object$`default_py_environment_management`
      }
      if (!is.null(this_object$`service_account_name`)) {
        self$`service_account_name` <- this_object$`service_account_name`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return CreateContentRequest in JSON format
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
        },
        if (!is.null(self$`cpu_request`)) {
          sprintf(
          '"cpu_request":
            %d
                    ',
          self$`cpu_request`
          )
        },
        if (!is.null(self$`cpu_limit`)) {
          sprintf(
          '"cpu_limit":
            %d
                    ',
          self$`cpu_limit`
          )
        },
        if (!is.null(self$`memory_request`)) {
          sprintf(
          '"memory_request":
            %d
                    ',
          self$`memory_request`
          )
        },
        if (!is.null(self$`memory_limit`)) {
          sprintf(
          '"memory_limit":
            %d
                    ',
          self$`memory_limit`
          )
        },
        if (!is.null(self$`run_as`)) {
          sprintf(
          '"run_as":
            "%s"
                    ',
          self$`run_as`
          )
        },
        if (!is.null(self$`run_as_current_user`)) {
          sprintf(
          '"run_as_current_user":
            %s
                    ',
          tolower(self$`run_as_current_user`)
          )
        },
        if (!is.null(self$`default_image_name`)) {
          sprintf(
          '"default_image_name":
            "%s"
                    ',
          self$`default_image_name`
          )
        },
        if (!is.null(self$`default_r_environment_management`)) {
          sprintf(
          '"default_r_environment_management":
            %s
                    ',
          tolower(self$`default_r_environment_management`)
          )
        },
        if (!is.null(self$`default_py_environment_management`)) {
          sprintf(
          '"default_py_environment_management":
            %s
                    ',
          tolower(self$`default_py_environment_management`)
          )
        },
        if (!is.null(self$`service_account_name`)) {
          sprintf(
          '"service_account_name":
            "%s"
                    ',
          self$`service_account_name`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of CreateContentRequest
    #'
    #' @description
    #' Deserialize JSON string into an instance of CreateContentRequest
    #'
    #' @param input_json the JSON input
    #' @return the instance of CreateContentRequest
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
      self$`cpu_request` <- this_object$`cpu_request`
      self$`cpu_limit` <- this_object$`cpu_limit`
      self$`memory_request` <- this_object$`memory_request`
      self$`memory_limit` <- this_object$`memory_limit`
      self$`run_as` <- this_object$`run_as`
      self$`run_as_current_user` <- this_object$`run_as_current_user`
      self$`default_image_name` <- this_object$`default_image_name`
      self$`default_r_environment_management` <- this_object$`default_r_environment_management`
      self$`default_py_environment_management` <- this_object$`default_py_environment_management`
      self$`service_account_name` <- this_object$`service_account_name`
      self
    },
    #' Validate JSON input with respect to CreateContentRequest
    #'
    #' @description
    #' Validate JSON input with respect to CreateContentRequest and throw an exception if invalid
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
    #' @return String representation of CreateContentRequest
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
# CreateContentRequest$unlock()
#
## Below is an example to define the print function
# CreateContentRequest$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# CreateContentRequest$lock()

