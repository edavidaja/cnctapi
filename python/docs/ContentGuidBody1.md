# ContentGuidBody1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (&#x60;\&quot;-\&quot;&#x60;), and underscores (&#x60;\&quot;_\&quot;&#x60;). | [default to '']
**title** | **str** | The title of this content. | [optional] [default to 'null']
**description** | **str** | A rich description of this content. | [optional] [default to '']
**access_type** | **str** | Access type describes how this content manages its viewers. The value &#x60;all&#x60; is the most permissive; any visitor to Posit Connect will be able to view this content. The value &#x60;logged_in&#x60; indicates that all Posit Connect accounts may view the content. The &#x60;acl&#x60; value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content. | [optional] [default to 'acl']
**connection_timeout** | **int** | Maximum number of seconds allowed without data sent or received across a client connection. A value of &#x60;0&#x60; means connections will never time-out (not recommended). When &#x60;null&#x60;, the default &#x60;Scheduler.ConnectionTimeout&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**read_timeout** | **int** | Maximum number of seconds allowed without data received from a client connection. A value of &#x60;0&#x60; means a lack of client (browser) interaction never causes the connection to close. When &#x60;null&#x60;, the default &#x60;Scheduler.ReadTimeout&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**init_timeout** | **int** | The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched Shiny application, for example, before this threshold has elapsed. When &#x60;null&#x60;, the default &#x60;Scheduler.InitTimeout&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**idle_timeout** | **int** | The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When &#x60;null&#x60;, the default &#x60;Scheduler.IdleTimeout&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**max_processes** | **int** | Specifies the total number of concurrent processes allowed for a single interactive application. When &#x60;null&#x60;, the default &#x60;Scheduler.MaxProcesses&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**min_processes** | **int** | Specifies the minimum number of concurrent processes allowed for a single interactive application. When &#x60;null&#x60;, the default &#x60;Scheduler.MinProcesses&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**max_conns_per_process** | **int** | Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When &#x60;null&#x60;, the default &#x60;Scheduler.MaxConnsPerProcess&#x60; is used. Applies only to content types that are executed on demand. | [optional] 
**load_factor** | **float** | Controls how aggressively new processes are spawned. When &#x60;null&#x60;, the default &#x60;Scheduler.LoadFactor&#x60; is used. Applies only to content types that are executed on demand. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

