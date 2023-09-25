# Environment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | The internal numeric identifier of this environment. | [optional] 
**guid** | **str** | The unique identifier of this environment to be used with REST API requests. | [optional] 
**created_time** | **datetime** | The timestamp (RFC3339) indicating when this environment was created. | [optional] 
**updated_time** | **datetime** | The timestamp (RFC3339) indicating when this environment was last updated. | [optional] 
**title** | **str** | A human readable title for this environment. | [optional] 
**description** | **str** | A human readable description of this environment. | [optional] [default to 'null']
**cluster_name** | **str** | The cluster identifier for this environment.   The value is always \&quot;Kubernetes\&quot; when Off Host Execution is enabled. | [optional] [default to 'Kubernetes']
**name** | **str** | The container image that will be used when executing content with this environment. | [optional] 
**environment_type** | **str** | The type of environment.  The value is always \&quot;Kubernetes\&quot; when Off Host Execution is enabled. | [optional] [default to 'Kubernetes']
**matching** | **str** | This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  &#x60;any&#x60; (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle&#x27;s manifest.  &#x60;exact&#x60; indicates the image must be explicitly asked for in the bundle&#x27;s manifest.  &#x60;none&#x60; indicates that the image should never be selected by Posit Connect. | [optional] [default to 'any']
**supervisor** | **str** | The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. | [optional] [default to 'null']
**python** | [**CreateEnvironmentInputPython**](CreateEnvironmentInputPython.md) |  | [optional] 
**quarto** | [**CreateEnvironmentInputQuarto**](CreateEnvironmentInputQuarto.md) |  | [optional] 
**r** | [**CreateEnvironmentInputR**](CreateEnvironmentInputR.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

