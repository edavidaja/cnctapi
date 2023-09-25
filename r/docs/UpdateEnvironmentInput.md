# connectapi2::UpdateEnvironmentInput

The fields that can be specified when updating an environment.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**title** | **character** | A human readable title for this environment. | 
**description** | **character** | A human readable description of this environment. | [optional] [default to &quot;null&quot;] 
**matching** | **character** | This field indicates how environments can be considered for selection when Posit Connect is choosing a compatible environment to use when executing content.  &#x60;any&#x60; (the default) indicates that the image can be selected by Connect automatically,   _or_ targeted in the bundle&#39;s manifest.  &#x60;exact&#x60; indicates the image must be explicitly asked for in the bundle&#39;s manifest.  &#x60;none&#x60; indicates that the image should never be selected by Posit Connect. | [optional] [default to &quot;null&quot;] [Enum: [any, exact, none]] 
**supervisor** | **character** | The path to the script or command that should be used as the [program supervisor](https://docs.posit.co/helm/rstudio-connect/kubernetes-howto/appendices/content_images.html#per-image-supervisors) when executing content with this environment. | [optional] [default to &quot;null&quot;] 
**python** | [**CreateEnvironmentInputPython**](CreateEnvironmentInput_python.md) |  | [optional] 
**quarto** | [**CreateEnvironmentInputQuarto**](CreateEnvironmentInput_quarto.md) |  | [optional] 
**r** | [**CreateEnvironmentInputR**](CreateEnvironmentInput_r.md) |  | [optional] 


