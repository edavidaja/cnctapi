# CreateEnvironmentInput

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **str** | A human readable title for this environment. | 
**description** | **str** | A human readable description of this environment. | [optional] [default to 'null']
**cluster_name** | **str** | The cluster identifier for this environment.   The value must be \&quot;Kubernetes\&quot; when Off Host Execution is enabled. | 
**name** | **str** | The container image that will be used when executing content with this environment. | 
**matching** | **str** | This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  &#x60;any&#x60; (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle&#x27;s manifest.  &#x60;exact&#x60; indicates the image must be explicitly asked for in the bundle&#x27;s manifest.  &#x60;none&#x60; indicates that the image should never be selected by Posit Connect. | [optional] [default to 'any']
**supervisor** | **str** | The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. | [optional] [default to 'null']
**python** | [**CreateEnvironmentInputPython**](CreateEnvironmentInputPython.md) |  | [optional] 
**quarto** | [**CreateEnvironmentInputQuarto**](CreateEnvironmentInputQuarto.md) |  | [optional] 
**r** | [**CreateEnvironmentInputR**](CreateEnvironmentInputR.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

