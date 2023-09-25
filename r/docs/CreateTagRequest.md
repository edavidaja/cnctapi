# connectapi2::CreateTagRequest

The fields that can be specified when creating or updating a tag

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **character** | The name of the tag. Tags under the same parent must have a unique name and cannot be longer than 255 characters. | [optional] 
**parent_id** | **character** | The identifier for the parent tag. If there is no parent_id, the tag will be a top-level tag. | [optional] [default to &quot;null&quot;] 


