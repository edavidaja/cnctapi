# connectapi2::AddContentPermissionRequest

The fields that can be specified when creating or updating a content permission item.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**principal_guid** | **character** | The identifier of the principal (user or group). | [optional] [readonly] 
**principal_type** | **character** | The type of principal. | [optional] [readonly] [Enum: [user, group]] 
**role** | **character** | The level of access that the principal has been given to this content item. | [optional] [Enum: [viewer, owner]] 


