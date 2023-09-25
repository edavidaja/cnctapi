# connectapi2::DeleteRuntimeCacheRequest

Fields that describe the runtime cache to delete.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**language** | **character** | The language of the target cache; either \&quot;R\&quot; or \&quot;Python\&quot;. | [optional] 
**version** | **character** | The version of the target cache. | [optional] 
**image_name** | **character** | The execution environment of the target cache; either \&quot;Local\&quot; or an image name or identifier. | [optional] 
**dry_run** | **character** | When true, check input but do not delete cache. | [optional] [default to FALSE] 


