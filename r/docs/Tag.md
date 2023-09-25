# connectapi2::Tag

Defines a tag which is used to organize content within Connect.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The identifier for the tag. | [optional] [readonly] 
**name** | **character** | The name of the tag. | [optional] 
**parent_id** | **character** | The identifier for the parent tag. If there is no parent_id, the tag is a top-level tag. | [optional] [default to &quot;null&quot;] 
**created_time** | **character** | The timestamp (RFC3339) indicating when the tag was created. | [optional] [readonly] 
**updated_time** | **character** | The timestamp (RFC3339) indicating when the tag was created. | [optional] [readonly] 


