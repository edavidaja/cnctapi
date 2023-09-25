# connectapi2::GroupOwnershipContent


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content_guid** | **character** | The unique identifier of the content item. | [optional] 
**content_name** | **character** | The name of the content item. | [optional] 
**content_title** | **character** | The title of the content item. | [optional] 
**access_type** | **character** | The access type of the content item. | [optional] [Enum: [acl, all, logged_in]] 
**permissions** | [**array[GroupOwnershipPermission]**](GroupOwnershipPermission.md) | List of principals (users and groups) with access to the content. The owner is listed as &#x60;author&#x60; and is always present. | [optional] 


