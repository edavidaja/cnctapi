# Bundle

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | The identifier for this bundle. | [optional] 
**content_guid** | **str** | The identifier of the owning content. | [optional] 
**created_time** | **datetime** | The timestamp (RFC3339) of when this bundle was created. | [optional] 
**cluster_name** | **str** | The location where this content runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**image_name** | **str** | The location where content this content runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] 
**r_version** | **str** | The version of R used when last restoring this bundle. A &#x60;null&#x60; value represents that R is not used by this bundle or that the bundle has not been prepared for execution.  R version is not disclosed to users with a \&quot;viewer\&quot; role; they receive a &#x60;null&#x60; value. | [optional] 
**r_environment_management** | **bool** | Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. The &#x60;null&#x60; value represents that R is not used by this bundle or that it has not yet been determined if an R environment is required.  R environment management is not disclosed to users with a \&quot;viewer\&quot; role; they receive a &#x60;null&#x60; value. | [optional] 
**py_version** | **str** | The version of Python used when last restoring this bundle. A &#x60;null&#x60; value represents that Python is not used by this bundle or that the bundle has not been prepared for execution.  Python version is not disclosed to users with a \&quot;viewer\&quot; role; they receive a &#x60;null&#x60; value. | [optional] 
**py_environment_management** | **bool** | Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. The &#x60;null&#x60; value represents that Python is not used by this bundle or that it has not yet been determined if a Python environment is required.  Python environment management is not disclosed to users with a \&quot;viewer\&quot; role; they receive a &#x60;null&#x60; value. | [optional] 
**quarto_version** | **str** | The version of Quarto used when last restoring this bundle. A &#x60;null&#x60; value represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \&quot;viewer\&quot; role; they receive a &#x60;null&#x60; value. | [optional] 
**active** | **bool** | Indicates if this bundle is active for the owning content. | [optional] 
**size** | **int** | On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file. | [optional] 
**metadata** | [**BundleMetadata**](BundleMetadata.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

