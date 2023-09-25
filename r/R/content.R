#' Create a new Content
#'
#' @description
#' The content object models all the \"things\" you may deploy to Posit Connect. This includes Shiny applications, R Markdown documents, Jupyter notebooks, Plumber APIs, FastAPI and Flask APIs, Python apps, plots, and pins.  The `app_mode` field specifies the type of content represented by this item and defines its runtime model.  * Active content, such as apps and APIs, executes on demand as requests arrive. * Reports render from source to output HTML. This rendering can occur based on a schedule or when explicitly triggered. It is *not* on each visit. Viewers of this type of content see a previously rendered result. * Static content is presented to viewers in its deployed form.  The fields `bundle_id`, `app_mode`, `content_category`, `parameterized`, `cluster_name`, `image_name`, `r_version`, `r_environment_management`, `py_version`, `py_environment_management`, and `quarto_version` are computed as a consequence of a <a href=\"#post-/v1/content/-guid-/deploy\">POST /v1/content/{guid}/deploy</a> deployment operation.
#'
#' @docType class
#' @title Content
#' @description Content Class
#' @format An \code{R6Class} generator object
#' @field guid The unique identifier of this content item. character [optional]
#' @field name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`). character [optional]
#' @field title The title of this content. character [optional]
#' @field description A rich description of this content. character [optional]
#' @field access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content. character [optional]
#' @field connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand. integer [optional]
#' @field load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand. numeric [optional]
#' @field cpu_request The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used. numeric [optional]
#' @field cpu_limit The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used. numeric [optional]
#' @field memory_request The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used. integer [optional]
#' @field memory_limit The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used. integer [optional]
#' @field created_time The timestamp (RFC3339) indicating when this content was created. character [optional]
#' @field last_deployed_time The timestamp (RFC3339) indicating when this content last had a successful bundle deployment performed. character [optional]
#' @field bundle_id The identifier for the active deployment bundle. Automatically assigned upon the successful deployment of that bundle. character [optional]
#' @field app_mode The runtime model for this content. Has a value of `unknown` before data is deployed to this item. Automatically assigned upon the first successful bundle deployment.  Valid values are:  * `api` - R code defining a [Plumber API](https://www.rplumber.io/). * `jupyter-static` - A [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/). * `python-api` - Python code defining a WSGI API (such as [Flask](https://palletsprojects.com/p/flask/)) * `python-bokeh` - Python code defining a [Bokeh application](https://bokeh.org/). * `python-dash` - Python code defining a [Dash application](https://dash.plotly.com/). * `python-fastapi` - Python code defining an ASGI API (such as [FastAPI](https://fastapi.tiangolo.com/)) * `python-streamlit` - Python code defining a [Streamlit application](https://streamlit.io/). * `python-shiny` - Python code defining a [Shiny application](https://shiny.rstudio.com/py/). * `quarto-shiny` - A [Quarto](https://quarto.org/) document with a Shiny runtime. * `quarto-static` - A [Quarto](https://quarto.org/) document or site. * `rmd-shiny` - An [R Markdown](https://rmarkdown.rstudio.com/) document with a Shiny runtime. * `rmd-static` - An [R Markdown](https://rmarkdown.rstudio.com/) document or site. * `shiny` - R code defining a [Shiny application](https://shiny.rstudio.com/). * `static` - Content deployed without source; often HTML and plots. * `tensorflow-saved-model` - A TensorFlow Model API (obsolete). * `unknown` - No known runtime model. character [optional]
#' @field content_category Describes the specialization of the content runtime model. Automatically assigned upon the first successful bundle deployment.  The `content_category` field refines the type of content specified by `app_mode`. It is empty by default. The rsconnect R package may assign a value when analyzing your content and building its manifest and bundle. Plots (images created in the RStudio IDE and presented in the \"Plots\" pane) have an `app_mode` of `static` and receive a `content_category` of `plot` to distinguish them from other HTML documents. Pinned static data sets have an `app_mode` of `static` and a `content_category` of `pin`. Multi-document R Markdown sites have an `app_mode` of `rmd-static` and a `content_category` of `site`. character [optional]
#' @field parameterized True when R Markdown rendered content allows parameter configuration. Automatically assigned upon the first successful bundle deployment. Applies only to content with an `app_mode` of `rmd-static`. character [optional]
#' @field cluster_name The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host. A `null` value is returned when the client does not have sufficient rights to see this information. character [optional]
#' @field image_name The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes. A `null` value is returned when the client does not have sufficient rights to see this information. character [optional]
#' @field default_image_name The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  A `null` value is returned when the client does not have sufficient rights to see this information.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution. character [optional]
#' @field default_r_environment_management Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled. character [optional]
#' @field default_py_environment_management Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled. character [optional]
#' @field service_account_name The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value. character [optional]
#' @field r_version The of R interpreter associated with this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle. character [optional]
#' @field r_environment_management Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle. character [optional]
#' @field py_version The version of Python associated with this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle. character [optional]
#' @field py_environment_management Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle. character [optional]
#' @field quarto_version The version of Quarto associated with this content. A `null` represents that Quarto is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle. character [optional]
#' @field run_as The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.  Only administrators can change this value. character [optional]
#' @field run_as_current_user Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value. character [optional]
#' @field owner_guid The unique identifier of the user who created this content item. Automatically assigned when the content is created. character [optional]
#' @field content_url The URL associated with this content. Computed from the associated vanity URL or GUID for this content. character [optional]
#' @field dashboard_url The URL within the Connect dashboard where this content can be configured. Computed from the GUID for this content. character [optional]
#' @field role The relationship of the accessing user to this content. A value of `owner` is returned for the content owner. `editor` indicates a collaborator. The `viewer` value is given to users who are permitted to view the content. A `none` role is returned for administrators who cannot view the content but are permitted to view its configuration. Computed at the time of the request. character [optional]
#' @field id The internal numeric identifier of this content item. character [optional]
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Content <- R6::R6Class(
  "Content",
  public = list(
    `guid` = NULL,
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
    `created_time` = NULL,
    `last_deployed_time` = NULL,
    `bundle_id` = NULL,
    `app_mode` = NULL,
    `content_category` = NULL,
    `parameterized` = NULL,
    `cluster_name` = NULL,
    `image_name` = NULL,
    `default_image_name` = NULL,
    `default_r_environment_management` = NULL,
    `default_py_environment_management` = NULL,
    `service_account_name` = NULL,
    `r_version` = NULL,
    `r_environment_management` = NULL,
    `py_version` = NULL,
    `py_environment_management` = NULL,
    `quarto_version` = NULL,
    `run_as` = NULL,
    `run_as_current_user` = NULL,
    `owner_guid` = NULL,
    `content_url` = NULL,
    `dashboard_url` = NULL,
    `role` = NULL,
    `id` = NULL,
    #' Initialize a new Content class.
    #'
    #' @description
    #' Initialize a new Content class.
    #'
    #' @param guid The unique identifier of this content item.
    #' @param name A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`).. Default to "".
    #' @param title The title of this content.. Default to "null".
    #' @param description A rich description of this content.. Default to "".
    #' @param access_type Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content.. Default to "acl".
    #' @param connection_timeout Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand.
    #' @param read_timeout Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand.
    #' @param init_timeout The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand.
    #' @param idle_timeout The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand.
    #' @param max_processes Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.
    #' @param min_processes Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.
    #' @param max_conns_per_process Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand.
    #' @param load_factor Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.
    #' @param cpu_request The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used.
    #' @param cpu_limit The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used.
    #' @param memory_request The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used.
    #' @param memory_limit The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used.
    #' @param created_time The timestamp (RFC3339) indicating when this content was created.
    #' @param last_deployed_time The timestamp (RFC3339) indicating when this content last had a successful bundle deployment performed.
    #' @param bundle_id The identifier for the active deployment bundle. Automatically assigned upon the successful deployment of that bundle.
    #' @param app_mode The runtime model for this content. Has a value of `unknown` before data is deployed to this item. Automatically assigned upon the first successful bundle deployment.  Valid values are:  * `api` - R code defining a [Plumber API](https://www.rplumber.io/). * `jupyter-static` - A [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/). * `python-api` - Python code defining a WSGI API (such as [Flask](https://palletsprojects.com/p/flask/)) * `python-bokeh` - Python code defining a [Bokeh application](https://bokeh.org/). * `python-dash` - Python code defining a [Dash application](https://dash.plotly.com/). * `python-fastapi` - Python code defining an ASGI API (such as [FastAPI](https://fastapi.tiangolo.com/)) * `python-streamlit` - Python code defining a [Streamlit application](https://streamlit.io/). * `python-shiny` - Python code defining a [Shiny application](https://shiny.rstudio.com/py/). * `quarto-shiny` - A [Quarto](https://quarto.org/) document with a Shiny runtime. * `quarto-static` - A [Quarto](https://quarto.org/) document or site. * `rmd-shiny` - An [R Markdown](https://rmarkdown.rstudio.com/) document with a Shiny runtime. * `rmd-static` - An [R Markdown](https://rmarkdown.rstudio.com/) document or site. * `shiny` - R code defining a [Shiny application](https://shiny.rstudio.com/). * `static` - Content deployed without source; often HTML and plots. * `tensorflow-saved-model` - A TensorFlow Model API (obsolete). * `unknown` - No known runtime model.
    #' @param content_category Describes the specialization of the content runtime model. Automatically assigned upon the first successful bundle deployment.  The `content_category` field refines the type of content specified by `app_mode`. It is empty by default. The rsconnect R package may assign a value when analyzing your content and building its manifest and bundle. Plots (images created in the RStudio IDE and presented in the \"Plots\" pane) have an `app_mode` of `static` and receive a `content_category` of `plot` to distinguish them from other HTML documents. Pinned static data sets have an `app_mode` of `static` and a `content_category` of `pin`. Multi-document R Markdown sites have an `app_mode` of `rmd-static` and a `content_category` of `site`.
    #' @param parameterized True when R Markdown rendered content allows parameter configuration. Automatically assigned upon the first successful bundle deployment. Applies only to content with an `app_mode` of `rmd-static`.
    #' @param cluster_name The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host. A `null` value is returned when the client does not have sufficient rights to see this information.
    #' @param image_name The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes. A `null` value is returned when the client does not have sufficient rights to see this information.
    #' @param default_image_name The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  A `null` value is returned when the client does not have sufficient rights to see this information.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution.. Default to "null".
    #' @param default_r_environment_management Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.. Default to FALSE.
    #' @param default_py_environment_management Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.. Default to FALSE.
    #' @param service_account_name The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value.. Default to "null".
    #' @param r_version The of R interpreter associated with this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.
    #' @param r_environment_management Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.
    #' @param py_version The version of Python associated with this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.
    #' @param py_environment_management Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.
    #' @param quarto_version The version of Quarto associated with this content. A `null` represents that Quarto is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.
    #' @param run_as The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.  Only administrators can change this value.. Default to "null".
    #' @param run_as_current_user Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value.. Default to FALSE.
    #' @param owner_guid The unique identifier of the user who created this content item. Automatically assigned when the content is created.
    #' @param content_url The URL associated with this content. Computed from the associated vanity URL or GUID for this content.
    #' @param dashboard_url The URL within the Connect dashboard where this content can be configured. Computed from the GUID for this content.
    #' @param role The relationship of the accessing user to this content. A value of `owner` is returned for the content owner. `editor` indicates a collaborator. The `viewer` value is given to users who are permitted to view the content. A `none` role is returned for administrators who cannot view the content but are permitted to view its configuration. Computed at the time of the request.
    #' @param id The internal numeric identifier of this content item.
    #' @param ... Other optional arguments.
    #' @export
    initialize = function(`guid` = NULL, `name` = "", `title` = "null", `description` = "", `access_type` = "acl", `connection_timeout` = NULL, `read_timeout` = NULL, `init_timeout` = NULL, `idle_timeout` = NULL, `max_processes` = NULL, `min_processes` = NULL, `max_conns_per_process` = NULL, `load_factor` = NULL, `cpu_request` = NULL, `cpu_limit` = NULL, `memory_request` = NULL, `memory_limit` = NULL, `created_time` = NULL, `last_deployed_time` = NULL, `bundle_id` = NULL, `app_mode` = NULL, `content_category` = NULL, `parameterized` = NULL, `cluster_name` = NULL, `image_name` = NULL, `default_image_name` = "null", `default_r_environment_management` = FALSE, `default_py_environment_management` = FALSE, `service_account_name` = "null", `r_version` = NULL, `r_environment_management` = NULL, `py_version` = NULL, `py_environment_management` = NULL, `quarto_version` = NULL, `run_as` = "null", `run_as_current_user` = FALSE, `owner_guid` = NULL, `content_url` = NULL, `dashboard_url` = NULL, `role` = NULL, `id` = NULL, ...) {
      if (!is.null(`guid`)) {
        if (!(is.character(`guid`) && length(`guid`) == 1)) {
          stop(paste("Error! Invalid data for `guid`. Must be a string:", `guid`))
        }
        self$`guid` <- `guid`
      }
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
      if (!is.null(`created_time`)) {
        if (!is.character(`created_time`)) {
          stop(paste("Error! Invalid data for `created_time`. Must be a string:", `created_time`))
        }
        self$`created_time` <- `created_time`
      }
      if (!is.null(`last_deployed_time`)) {
        if (!is.character(`last_deployed_time`)) {
          stop(paste("Error! Invalid data for `last_deployed_time`. Must be a string:", `last_deployed_time`))
        }
        self$`last_deployed_time` <- `last_deployed_time`
      }
      if (!is.null(`bundle_id`)) {
        if (!(is.character(`bundle_id`) && length(`bundle_id`) == 1)) {
          stop(paste("Error! Invalid data for `bundle_id`. Must be a string:", `bundle_id`))
        }
        self$`bundle_id` <- `bundle_id`
      }
      if (!is.null(`app_mode`)) {
        if (!(`app_mode` %in% c("api", "jupyter-static", "python-api", "python-bokeh", "python-dash", "python-streamlit", "quarto-shiny", "quarto-static", "rmd-shiny", "rmd-static", "shiny", "static", "tensorflow-saved-model", "unknown"))) {
          stop(paste("Error! \"", `app_mode`, "\" cannot be assigned to `app_mode`. Must be \"api\", \"jupyter-static\", \"python-api\", \"python-bokeh\", \"python-dash\", \"python-streamlit\", \"quarto-shiny\", \"quarto-static\", \"rmd-shiny\", \"rmd-static\", \"shiny\", \"static\", \"tensorflow-saved-model\", \"unknown\".", sep = ""))
        }
        if (!(is.character(`app_mode`) && length(`app_mode`) == 1)) {
          stop(paste("Error! Invalid data for `app_mode`. Must be a string:", `app_mode`))
        }
        self$`app_mode` <- `app_mode`
      }
      if (!is.null(`content_category`)) {
        if (!(is.character(`content_category`) && length(`content_category`) == 1)) {
          stop(paste("Error! Invalid data for `content_category`. Must be a string:", `content_category`))
        }
        self$`content_category` <- `content_category`
      }
      if (!is.null(`parameterized`)) {
        if (!(is.logical(`parameterized`) && length(`parameterized`) == 1)) {
          stop(paste("Error! Invalid data for `parameterized`. Must be a boolean:", `parameterized`))
        }
        self$`parameterized` <- `parameterized`
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
      if (!is.null(`owner_guid`)) {
        if (!(is.character(`owner_guid`) && length(`owner_guid`) == 1)) {
          stop(paste("Error! Invalid data for `owner_guid`. Must be a string:", `owner_guid`))
        }
        self$`owner_guid` <- `owner_guid`
      }
      if (!is.null(`content_url`)) {
        if (!(is.character(`content_url`) && length(`content_url`) == 1)) {
          stop(paste("Error! Invalid data for `content_url`. Must be a string:", `content_url`))
        }
        self$`content_url` <- `content_url`
      }
      if (!is.null(`dashboard_url`)) {
        if (!(is.character(`dashboard_url`) && length(`dashboard_url`) == 1)) {
          stop(paste("Error! Invalid data for `dashboard_url`. Must be a string:", `dashboard_url`))
        }
        self$`dashboard_url` <- `dashboard_url`
      }
      if (!is.null(`role`)) {
        if (!(`role` %in% c("owner", "editor", "viewer", "none"))) {
          stop(paste("Error! \"", `role`, "\" cannot be assigned to `role`. Must be \"owner\", \"editor\", \"viewer\", \"none\".", sep = ""))
        }
        if (!(is.character(`role`) && length(`role`) == 1)) {
          stop(paste("Error! Invalid data for `role`. Must be a string:", `role`))
        }
        self$`role` <- `role`
      }
      if (!is.null(`id`)) {
        if (!(is.character(`id`) && length(`id`) == 1)) {
          stop(paste("Error! Invalid data for `id`. Must be a string:", `id`))
        }
        self$`id` <- `id`
      }
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Content in JSON format
    #' @export
    toJSON = function() {
      ContentObject <- list()
      if (!is.null(self$`guid`)) {
        ContentObject[["guid"]] <-
          self$`guid`
      }
      if (!is.null(self$`name`)) {
        ContentObject[["name"]] <-
          self$`name`
      }
      if (!is.null(self$`title`)) {
        ContentObject[["title"]] <-
          self$`title`
      }
      if (!is.null(self$`description`)) {
        ContentObject[["description"]] <-
          self$`description`
      }
      if (!is.null(self$`access_type`)) {
        ContentObject[["access_type"]] <-
          self$`access_type`
      }
      if (!is.null(self$`connection_timeout`)) {
        ContentObject[["connection_timeout"]] <-
          self$`connection_timeout`
      }
      if (!is.null(self$`read_timeout`)) {
        ContentObject[["read_timeout"]] <-
          self$`read_timeout`
      }
      if (!is.null(self$`init_timeout`)) {
        ContentObject[["init_timeout"]] <-
          self$`init_timeout`
      }
      if (!is.null(self$`idle_timeout`)) {
        ContentObject[["idle_timeout"]] <-
          self$`idle_timeout`
      }
      if (!is.null(self$`max_processes`)) {
        ContentObject[["max_processes"]] <-
          self$`max_processes`
      }
      if (!is.null(self$`min_processes`)) {
        ContentObject[["min_processes"]] <-
          self$`min_processes`
      }
      if (!is.null(self$`max_conns_per_process`)) {
        ContentObject[["max_conns_per_process"]] <-
          self$`max_conns_per_process`
      }
      if (!is.null(self$`load_factor`)) {
        ContentObject[["load_factor"]] <-
          self$`load_factor`
      }
      if (!is.null(self$`cpu_request`)) {
        ContentObject[["cpu_request"]] <-
          self$`cpu_request`
      }
      if (!is.null(self$`cpu_limit`)) {
        ContentObject[["cpu_limit"]] <-
          self$`cpu_limit`
      }
      if (!is.null(self$`memory_request`)) {
        ContentObject[["memory_request"]] <-
          self$`memory_request`
      }
      if (!is.null(self$`memory_limit`)) {
        ContentObject[["memory_limit"]] <-
          self$`memory_limit`
      }
      if (!is.null(self$`created_time`)) {
        ContentObject[["created_time"]] <-
          self$`created_time`
      }
      if (!is.null(self$`last_deployed_time`)) {
        ContentObject[["last_deployed_time"]] <-
          self$`last_deployed_time`
      }
      if (!is.null(self$`bundle_id`)) {
        ContentObject[["bundle_id"]] <-
          self$`bundle_id`
      }
      if (!is.null(self$`app_mode`)) {
        ContentObject[["app_mode"]] <-
          self$`app_mode`
      }
      if (!is.null(self$`content_category`)) {
        ContentObject[["content_category"]] <-
          self$`content_category`
      }
      if (!is.null(self$`parameterized`)) {
        ContentObject[["parameterized"]] <-
          self$`parameterized`
      }
      if (!is.null(self$`cluster_name`)) {
        ContentObject[["cluster_name"]] <-
          self$`cluster_name`
      }
      if (!is.null(self$`image_name`)) {
        ContentObject[["image_name"]] <-
          self$`image_name`
      }
      if (!is.null(self$`default_image_name`)) {
        ContentObject[["default_image_name"]] <-
          self$`default_image_name`
      }
      if (!is.null(self$`default_r_environment_management`)) {
        ContentObject[["default_r_environment_management"]] <-
          self$`default_r_environment_management`
      }
      if (!is.null(self$`default_py_environment_management`)) {
        ContentObject[["default_py_environment_management"]] <-
          self$`default_py_environment_management`
      }
      if (!is.null(self$`service_account_name`)) {
        ContentObject[["service_account_name"]] <-
          self$`service_account_name`
      }
      if (!is.null(self$`r_version`)) {
        ContentObject[["r_version"]] <-
          self$`r_version`
      }
      if (!is.null(self$`r_environment_management`)) {
        ContentObject[["r_environment_management"]] <-
          self$`r_environment_management`
      }
      if (!is.null(self$`py_version`)) {
        ContentObject[["py_version"]] <-
          self$`py_version`
      }
      if (!is.null(self$`py_environment_management`)) {
        ContentObject[["py_environment_management"]] <-
          self$`py_environment_management`
      }
      if (!is.null(self$`quarto_version`)) {
        ContentObject[["quarto_version"]] <-
          self$`quarto_version`
      }
      if (!is.null(self$`run_as`)) {
        ContentObject[["run_as"]] <-
          self$`run_as`
      }
      if (!is.null(self$`run_as_current_user`)) {
        ContentObject[["run_as_current_user"]] <-
          self$`run_as_current_user`
      }
      if (!is.null(self$`owner_guid`)) {
        ContentObject[["owner_guid"]] <-
          self$`owner_guid`
      }
      if (!is.null(self$`content_url`)) {
        ContentObject[["content_url"]] <-
          self$`content_url`
      }
      if (!is.null(self$`dashboard_url`)) {
        ContentObject[["dashboard_url"]] <-
          self$`dashboard_url`
      }
      if (!is.null(self$`role`)) {
        ContentObject[["role"]] <-
          self$`role`
      }
      if (!is.null(self$`id`)) {
        ContentObject[["id"]] <-
          self$`id`
      }
      ContentObject
    },
    #' Deserialize JSON string into an instance of Content
    #'
    #' @description
    #' Deserialize JSON string into an instance of Content
    #'
    #' @param input_json the JSON input
    #' @return the instance of Content
    #' @export
    fromJSON = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      if (!is.null(this_object$`guid`)) {
        self$`guid` <- this_object$`guid`
      }
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
      if (!is.null(this_object$`created_time`)) {
        self$`created_time` <- this_object$`created_time`
      }
      if (!is.null(this_object$`last_deployed_time`)) {
        self$`last_deployed_time` <- this_object$`last_deployed_time`
      }
      if (!is.null(this_object$`bundle_id`)) {
        self$`bundle_id` <- this_object$`bundle_id`
      }
      if (!is.null(this_object$`app_mode`)) {
        if (!is.null(this_object$`app_mode`) && !(this_object$`app_mode` %in% c("api", "jupyter-static", "python-api", "python-bokeh", "python-dash", "python-streamlit", "quarto-shiny", "quarto-static", "rmd-shiny", "rmd-static", "shiny", "static", "tensorflow-saved-model", "unknown"))) {
          stop(paste("Error! \"", this_object$`app_mode`, "\" cannot be assigned to `app_mode`. Must be \"api\", \"jupyter-static\", \"python-api\", \"python-bokeh\", \"python-dash\", \"python-streamlit\", \"quarto-shiny\", \"quarto-static\", \"rmd-shiny\", \"rmd-static\", \"shiny\", \"static\", \"tensorflow-saved-model\", \"unknown\".", sep = ""))
        }
        self$`app_mode` <- this_object$`app_mode`
      }
      if (!is.null(this_object$`content_category`)) {
        self$`content_category` <- this_object$`content_category`
      }
      if (!is.null(this_object$`parameterized`)) {
        self$`parameterized` <- this_object$`parameterized`
      }
      if (!is.null(this_object$`cluster_name`)) {
        self$`cluster_name` <- this_object$`cluster_name`
      }
      if (!is.null(this_object$`image_name`)) {
        self$`image_name` <- this_object$`image_name`
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
      if (!is.null(this_object$`run_as`)) {
        self$`run_as` <- this_object$`run_as`
      }
      if (!is.null(this_object$`run_as_current_user`)) {
        self$`run_as_current_user` <- this_object$`run_as_current_user`
      }
      if (!is.null(this_object$`owner_guid`)) {
        self$`owner_guid` <- this_object$`owner_guid`
      }
      if (!is.null(this_object$`content_url`)) {
        self$`content_url` <- this_object$`content_url`
      }
      if (!is.null(this_object$`dashboard_url`)) {
        self$`dashboard_url` <- this_object$`dashboard_url`
      }
      if (!is.null(this_object$`role`)) {
        if (!is.null(this_object$`role`) && !(this_object$`role` %in% c("owner", "editor", "viewer", "none"))) {
          stop(paste("Error! \"", this_object$`role`, "\" cannot be assigned to `role`. Must be \"owner\", \"editor\", \"viewer\", \"none\".", sep = ""))
        }
        self$`role` <- this_object$`role`
      }
      if (!is.null(this_object$`id`)) {
        self$`id` <- this_object$`id`
      }
      self
    },
    #' To JSON string
    #'
    #' @description
    #' To JSON String
    #'
    #' @return Content in JSON format
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
        if (!is.null(self$`created_time`)) {
          sprintf(
          '"created_time":
            "%s"
                    ',
          self$`created_time`
          )
        },
        if (!is.null(self$`last_deployed_time`)) {
          sprintf(
          '"last_deployed_time":
            "%s"
                    ',
          self$`last_deployed_time`
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
        if (!is.null(self$`app_mode`)) {
          sprintf(
          '"app_mode":
            "%s"
                    ',
          self$`app_mode`
          )
        },
        if (!is.null(self$`content_category`)) {
          sprintf(
          '"content_category":
            "%s"
                    ',
          self$`content_category`
          )
        },
        if (!is.null(self$`parameterized`)) {
          sprintf(
          '"parameterized":
            %s
                    ',
          tolower(self$`parameterized`)
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
        if (!is.null(self$`owner_guid`)) {
          sprintf(
          '"owner_guid":
            "%s"
                    ',
          self$`owner_guid`
          )
        },
        if (!is.null(self$`content_url`)) {
          sprintf(
          '"content_url":
            "%s"
                    ',
          self$`content_url`
          )
        },
        if (!is.null(self$`dashboard_url`)) {
          sprintf(
          '"dashboard_url":
            "%s"
                    ',
          self$`dashboard_url`
          )
        },
        if (!is.null(self$`role`)) {
          sprintf(
          '"role":
            "%s"
                    ',
          self$`role`
          )
        },
        if (!is.null(self$`id`)) {
          sprintf(
          '"id":
            "%s"
                    ',
          self$`id`
          )
        }
      )
      jsoncontent <- paste(jsoncontent, collapse = ",")
      json_string <- as.character(jsonlite::minify(paste("{", jsoncontent, "}", sep = "")))
    },
    #' Deserialize JSON string into an instance of Content
    #'
    #' @description
    #' Deserialize JSON string into an instance of Content
    #'
    #' @param input_json the JSON input
    #' @return the instance of Content
    #' @export
    fromJSONString = function(input_json) {
      this_object <- jsonlite::fromJSON(input_json)
      self$`guid` <- this_object$`guid`
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
      self$`created_time` <- this_object$`created_time`
      self$`last_deployed_time` <- this_object$`last_deployed_time`
      self$`bundle_id` <- this_object$`bundle_id`
      if (!is.null(this_object$`app_mode`) && !(this_object$`app_mode` %in% c("api", "jupyter-static", "python-api", "python-bokeh", "python-dash", "python-streamlit", "quarto-shiny", "quarto-static", "rmd-shiny", "rmd-static", "shiny", "static", "tensorflow-saved-model", "unknown"))) {
        stop(paste("Error! \"", this_object$`app_mode`, "\" cannot be assigned to `app_mode`. Must be \"api\", \"jupyter-static\", \"python-api\", \"python-bokeh\", \"python-dash\", \"python-streamlit\", \"quarto-shiny\", \"quarto-static\", \"rmd-shiny\", \"rmd-static\", \"shiny\", \"static\", \"tensorflow-saved-model\", \"unknown\".", sep = ""))
      }
      self$`app_mode` <- this_object$`app_mode`
      self$`content_category` <- this_object$`content_category`
      self$`parameterized` <- this_object$`parameterized`
      self$`cluster_name` <- this_object$`cluster_name`
      self$`image_name` <- this_object$`image_name`
      self$`default_image_name` <- this_object$`default_image_name`
      self$`default_r_environment_management` <- this_object$`default_r_environment_management`
      self$`default_py_environment_management` <- this_object$`default_py_environment_management`
      self$`service_account_name` <- this_object$`service_account_name`
      self$`r_version` <- this_object$`r_version`
      self$`r_environment_management` <- this_object$`r_environment_management`
      self$`py_version` <- this_object$`py_version`
      self$`py_environment_management` <- this_object$`py_environment_management`
      self$`quarto_version` <- this_object$`quarto_version`
      self$`run_as` <- this_object$`run_as`
      self$`run_as_current_user` <- this_object$`run_as_current_user`
      self$`owner_guid` <- this_object$`owner_guid`
      self$`content_url` <- this_object$`content_url`
      self$`dashboard_url` <- this_object$`dashboard_url`
      if (!is.null(this_object$`role`) && !(this_object$`role` %in% c("owner", "editor", "viewer", "none"))) {
        stop(paste("Error! \"", this_object$`role`, "\" cannot be assigned to `role`. Must be \"owner\", \"editor\", \"viewer\", \"none\".", sep = ""))
      }
      self$`role` <- this_object$`role`
      self$`id` <- this_object$`id`
      self
    },
    #' Validate JSON input with respect to Content
    #'
    #' @description
    #' Validate JSON input with respect to Content and throw an exception if invalid
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
    #' @return String representation of Content
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
# Content$unlock()
#
## Below is an example to define the print function
# Content$set("public", "print", function(...) {
#   print(jsonlite::prettify(self$toJSONString()))
#   invisible(self)
# })
## Uncomment below to lock the class to prevent modifications to the method or field
# Content$lock()

