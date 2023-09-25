# GroupsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddGroupMember**](GroupsApi.md#AddGroupMember) | **POST** /v1/groups/{group_guid}/members | Add a group member
[**CreateGroup**](GroupsApi.md#CreateGroup) | **POST** /v1/groups | Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
[**CreateRemoteGroup**](GroupsApi.md#CreateRemoteGroup) | **PUT** /v1/groups | Create a group using details from a remote authentication provider (LDAP) 
[**DeleteGroup**](GroupsApi.md#DeleteGroup) | **DELETE** /v1/groups/{guid} | Delete a group
[**GetGroup**](GroupsApi.md#GetGroup) | **GET** /v1/groups/{guid} | Get group details
[**GetGroupMembers**](GroupsApi.md#GetGroupMembers) | **GET** /v1/groups/{group_guid}/members | Get group member details
[**GetGroupOwnership**](GroupsApi.md#GetGroupOwnership) | **GET** /v1/experimental/groups/{guid}/content | List content for which a group with given GUID has access to
[**GetGroups**](GroupsApi.md#GetGroups) | **GET** /v1/groups | List or search for group details
[**RemoveGroupMember**](GroupsApi.md#RemoveGroupMember) | **DELETE** /v1/groups/{group_guid}/members/{user_guid} | Remove a group member
[**SearchRemoteGroups**](GroupsApi.md#SearchRemoteGroups) | **GET** /v1/groups/remote | Search for group details from a remote provider
[**UpdateGroup**](GroupsApi.md#UpdateGroup) | **POST** /v1/groups/{guid} | Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 


# **AddGroupMember**
> AddGroupMember(group_guid, user)

Add a group member

This endpoint adds a user to a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to modify a group you do   not own.

### Example
```R
library(connectapi2)

# Add a group member
#
# prepare function argument(s)
var_group_guid <- "group_guid_example" # character | The group's unique identifier
var_user <- addGroupMember_request$new("user_guid_example") # AddGroupMemberRequest | The user to add as a member

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group_guid** | **character**| The group&#39;s unique identifier | 
 **user** | [**AddGroupMemberRequest**](AddGroupMemberRequest.md)| The user to add as a member | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | This response is returned only when the user was successfully added to the group. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **CreateGroup**
> Group CreateGroup(group)

Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 

This endpoint creates the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to create   groups.

### Example
```R
library(connectapi2)

# Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
#
# prepare function argument(s)
var_group <- createGroup_request$new("name_example", "unique_id_example") # CreateGroupRequest | The new group values.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group** | [**CreateGroupRequest**](CreateGroupRequest.md)| The new group values. | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The group object |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **CreateRemoteGroup**
> Group CreateRemoteGroup(request)

Create a group using details from a remote authentication provider (LDAP) 

This endpoint creates the given group on the Posit Connect server.  - This endpoint is used only for LDAP authentication. Password,   PAM, SAML, OAuth2 and Proxied authentication providers should   use the    <a href=\"#post-/v1/groups\">POST /v1/groups</a>   endpoint. - Publisher or administrator access is required to access this   endpoint. - Group members will be automatically populated from the LDAP server.  #### Group Creation Workflow on LDAP  The API lets you identify an existing group in the LDAP system and create a corresponding group on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/groups/remote\">GET /v1/groups/remote</a>   endpoint. This endpoint will return a list of potential   matching groups in LDAP. A group that does not exist in   Posit Connect will lack a `guid`. Note the `temp_ticket`   for the desired group. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding group on Posit Connect.  The [Create a Group from LDAP](../cookbook/groups/#create-group-ldap) recipe in the API Cookbook has sample code using this workflow.

### Example
```R
library(connectapi2)

# Create a group using details from a remote authentication provider (LDAP) 
#
# prepare function argument(s)
var_request <- createRemoteGroup_request$new("temp_ticket_example") # CreateRemoteGroupRequest | The request body needed for creating a group on the Posit Connect server.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**CreateRemoteGroupRequest**](CreateRemoteGroupRequest.md)| The request body needed for creating a group on the Posit Connect server. | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The group object |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeleteGroup**
> DeleteGroup(guid)

Delete a group

Delete the given group.  - This endpoint can be used only when groups are enabled in   Posit Connnect and will return an error otherwise. - Administrator access is required to delete a group you do   not own.

### Example
```R
library(connectapi2)

# Delete a group
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The group's unique identifier

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The group&#39;s unique identifier | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | This response is returned only when the group was successfully removed. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetGroup**
> Group GetGroup(guid)

Get group details

Get detailed information on a specific group.  This endpoint is available only when groups are enabled in Posit Connect.

### Example
```R
library(connectapi2)

# Get group details
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The group's unique identifier

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The group&#39;s unique identifier | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested group details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetGroupMembers**
> GroupMembers GetGroupMembers(group_guid)

Get group member details

This endpoint gets the group member details. Group member enumeration is currently not supported for LDAP.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled.

### Example
```R
library(connectapi2)

# Get group member details
#
# prepare function argument(s)
var_group_guid <- "group_guid_example" # character | The group's unique identifier

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group_guid** | **character**| The group&#39;s unique identifier | 

### Return type

[**GroupMembers**](GroupMembers.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested group member details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetGroupOwnership**
> array[GroupOwnershipContent] GetGroupOwnership(guid)

List content for which a group with given GUID has access to

This endpoint takes a group GUID and returns a list of content items with access control lists that the given group is listed on. This includes content accessible only by specific users or groups that include the given group, as well as content accessible by anyone or only logged-in users that includes the given group as a collaborator.

### Example
```R
library(connectapi2)

# List content for which a group with given GUID has access to
#
# prepare function argument(s)
var_guid <- "guid_example" # character | 

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**|  | 

### Return type

[**array[GroupOwnershipContent]**](GroupOwnershipContent.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | List of ownership details for each content item to which the requested group has access. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetGroups**
> Groups GetGroups(prefix = var.prefix, page_number = 1, page_size = 20, asc_order = TRUE)

List or search for group details

This endpoint lists or searches for local groups.  - For a `prefix` search, results are sorted based on   similarity to the `prefix`. A `prefix` search ignores   `asc_order`. The first page of results will always be   returned. - The `prefix` can also be an exact match for the   group's DN (for LDAP) or the auth provider's unique ID   for the group, if any. - For a non-`prefix` search, results are sorted by group name.  This endpoint is available only when groups are enabled in Posit Connect and it will return an error otherwise.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.

### Example
```R
library(connectapi2)

# List or search for group details
#
# prepare function argument(s)
var_prefix <- "prefix_example" # character | Filters groups by prefix (group name). The filter is case insensitive. (Optional)
var_page_number <- 1 # integer | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. For a `prefix` search, the first page of results will always be returned. (Optional)
var_page_size <- 20 # integer | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough groups to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (Optional)
var_asc_order <- TRUE # character | Whether or not to return the groups in ascending order, sorted by name. For a `prefix` search, results are sorted first by exact match, then by increasing word length. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **character**| Filters groups by prefix (group name). The filter is case insensitive. | [optional] 
 **page_number** | **integer**| The page to return relative to the given &#x60;page_size&#x60;. If &#x60;page_number&#x60; is 0 or negative, an error will be returned. For a &#x60;prefix&#x60; search, the first page of results will always be returned. | [optional] [default to 1]
 **page_size** | **integer**| The number of items to include in each page. This parameter is \&quot;best effort\&quot; since there may not be enough groups to honor the request. If &#x60;page_size&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]
 **asc_order** | **character**| Whether or not to return the groups in ascending order, sorted by name. For a &#x60;prefix&#x60; search, results are sorted first by exact match, then by increasing word length. | [optional] [default to TRUE]

### Return type

[**Groups**](Groups.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The search results |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **RemoveGroupMember**
> RemoveGroupMember(group_guid, user_guid)

Remove a group member

This endpoint removes a user from a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to remove a user from a   group you do not own, but no special access is needed to   remove yourself from a group.

### Example
```R
library(connectapi2)

# Remove a group member
#
# prepare function argument(s)
var_group_guid <- "group_guid_example" # character | The group's unique identifier
var_user_guid <- "user_guid_example" # character | The group member's unique identifier

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group_guid** | **character**| The group&#39;s unique identifier | 
 **user_guid** | **character**| The group member&#39;s unique identifier | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | This response is returned only when the user was successfully removed from the group. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **SearchRemoteGroups**
> GroupRemoteSearch SearchRemoteGroups(prefix, limit = 20)

Search for group details from a remote provider

This endpoint is used to support operations against groups not managed by Connect, such as  <a href=\"#post-/v1/groups\">creating LDAP groups</a> See <a href=\"#get-/v1/groups\">GET /v1/groups</a> for listing groups on Posit Connect.  This endpoint searches for groups on Posit Connect and on your LDAP system.  Results are sorted based on similarity to the `prefix`.  - This endpoint can be used only by LDAP authentication and   will return an error otherwise. - Publisher or administrator access is required to access this   endpoint.

### Example
```R
library(connectapi2)

# Search for group details from a remote provider
#
# prepare function argument(s)
var_prefix <- "prefix_example" # character | Search groups by prefix. `prefix` is case insensitive.
var_limit <- 20 # integer | The maximum number of groups to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **character**| Search groups by prefix. &#x60;prefix&#x60; is case insensitive. | 
 **limit** | **integer**| The maximum number of groups to include in the results. If &#x60;limit&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]

### Return type

[**GroupRemoteSearch**](GroupRemoteSearch.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The search results. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateGroup**
> Group UpdateGroup(guid, group)

Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 

This endpoint modifies the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to modify   groups.

### Example
```R
library(connectapi2)

# Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The group's unique identifier
var_group <- updateGroup_request$new("name_example", "owner_guid_example") # UpdateGroupRequest | The new group name and/or owner.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The group&#39;s unique identifier | 
 **group** | [**UpdateGroupRequest**](UpdateGroupRequest.md)| The new group name and/or owner. | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The group object |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

