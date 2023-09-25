# connectapi2::BundleV1Exp

Content published to Posit Connect is encapsulated in a \"bundle\" that contains the source code and data necessary to execute the content. An application or report is updated by uploading a new bundle.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The identifier for this bundle. | [optional] [readonly] 
**content_guid** | **character** | The identifier of the owning content. | [optional] [readonly] 
**created_time** | **character** | The timestamp (RFC3339) of when this bundle was created. | [optional] [readonly] 
**cluster_name** | **character** | The location where this content bundle runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. Gives the name of the cluster when run external to the Connect host.  Cluster name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] [readonly] 
**image_name** | **character** | The location where content this content bundle runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string \&quot;Local\&quot;. References the name of the target image when content runs in a clustered environment such as Kubernetes.  Image name is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] [readonly] 
**r_version** | **character** | The version of the R interpreter used when last restoring this bundle. The value &#x60;null&#x60; represents that an R interpreter is not used by this bundle or that the R package environment has not been successfully restored.  R version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] [readonly] 
**py_version** | **character** | The version of the Python interpreter used when last restoring this bundle.  The value &#x60;null&#x60; represents that a Python interpreter is not used by this bundle or that the Python package environment has not been successfully restored.  Python version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] [readonly] 
**quarto_version** | **character** | The version of the Quarto interpreter used when last restoring this bundle. The value &#x60;null&#x60; represents that Quarto is not used by this bundle or that the bundle has not been successfully prepared for execution.  Quarto version is not disclosed to users with a \&quot;viewer\&quot; role and returned with the value &#x60;null&#x60;. | [optional] [readonly] 
**active** | **character** | Indicates if this bundle is active for the owning content. | [optional] [readonly] 
**size** | **numeric** | On-disk size in bytes of the tar.gz file associated with this bundle. Zero when there is no on-disk file. | [optional] [readonly] 


