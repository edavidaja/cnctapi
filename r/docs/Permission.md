# connectapi2::Permission

Defines the permission level that a user or group has been granted to a content item.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The identifier for this permission entry. | [optional] [readonly] 
**content_guid** | **character** | The identifier of the content item. | [optional] [readonly] 
**principal_guid** | **character** | The identifier of the principal (user or group) listed in the ACL. | [optional] [readonly] 
**principal_type** | **character** | The type of principal. | [optional] [readonly] [Enum: [user, group]] 
**role** | **character** | The level of access that the principal has been given to this content item. | [optional] [Enum: [viewer, owner]] 


