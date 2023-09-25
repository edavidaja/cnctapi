# connectapi2::SetVanityRequest

The fields that can be specified when creating a vanity URL.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**path** | **character** | The URL path that will be assigned to this content item. HTTP requests to this path on the Connect server will be routed to the associated content item. | [optional] 
**force** | **character** | If true, and a vanity URL exists with the specified path, reassign it to the specified content item. To reassign a vanity URL, you must be an administrator, or a collaborator/owner of both content items. | [optional] 


