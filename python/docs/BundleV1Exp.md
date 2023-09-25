# BundleV1Exp

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | The identifier for this bundle. | [optional] 
**content_guid** | **str** | The identifier of the owning content. | [optional] 
**created_time** | **datetime** | The timestamp (RFC3339) of when this bundle was created. | [optional] 
**cluster_name** | **str** | The location where this content bundle runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**image_name** | **str** | The location where content this content bundle runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**r_version** | **str** | The version of the R interpreter used when last restoring this bundle. The value &#x60;null&#x60; represents that an R interpreter is not used by this bundle or that the R package environment has not been successfully restored.  R version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**py_version** | **str** | The version of the Python interpreter used when last restoring this bundle.  The value &#x60;null&#x60; represents that a Python interpreter is not used by this bundle or that the Python package environment has not been successfully restored.  Python version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**quarto_version** | **str** | The version of the Quarto interpreter used when last restoring this bundle. The value &#x60;null&#x60; represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**active** | **bool** | Indicates if this bundle is active for the owning content. | [optional] 
**size** | **float** | On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

