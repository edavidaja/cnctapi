# connectapi2::Environment

The environment object represents an execution environment available to Posit Connect when Off Host Execution is enabled. Posit Connect will select from this set of available execution environments when looking for a compatible environment to use for running a piece of content.  The `name` field of each environment is a reference to a container image that will be used when running the content on Kubernetes.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The internal numeric identifier of this environment. | [optional] [readonly] 
**guid** | **character** | The unique identifier of this environment to be used with REST API requests. | [optional] [readonly] 
**created_time** | **character** | The timestamp (RFC3339) indicating when this environment was created. | [optional] [readonly] 
**updated_time** | **character** | The timestamp (RFC3339) indicating when this environment was last updated. | [optional] [readonly] 
**title** | **character** | A human readable title for this environment. | [optional] 
**description** | **character** | A human readable description of this environment. | [optional] [default to &quot;null&quot;] 
**cluster_name** | **character** | The cluster identifier for this environment.   The value is always \&quot;Kubernetes\&quot; when Off Host Execution is enabled. | [optional] [readonly] [default to &quot;Kubernetes&quot;] 
**name** | **character** | The container image that will be used when executing content with this environment. | [optional] [readonly] 
**environment_type** | **character** | The type of environment.  The value is always \&quot;Kubernetes\&quot; when Off Host Execution is enabled. | [optional] [readonly] [default to &quot;Kubernetes&quot;] 
**matching** | **character** | This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  &#x60;any&#x60; (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle&#39;s manifest.  &#x60;exact&#x60; indicates the image must be explicitly asked for in the bundle&#39;s manifest.  &#x60;none&#x60; indicates that the image should never be selected by Posit Connect. | [optional] [default to &quot;any&quot;] [Enum: [any, exact, none]] 
**supervisor** | **character** | The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. | [optional] [default to &quot;null&quot;] 
**python** | [**CreateEnvironmentInputPython**](CreateEnvironmentInput_python.md) |  | [optional] 
**quarto** | [**CreateEnvironmentInputQuarto**](CreateEnvironmentInput_quarto.md) |  | [optional] 
**r** | [**CreateEnvironmentInputR**](CreateEnvironmentInput_r.md) |  | [optional] 


