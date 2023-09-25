# connectapi.GroupsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_group_member**](GroupsApi.md#add_group_member) | **POST** /v1/groups/{group_guid}/members | Add a group member
[**create_group**](GroupsApi.md#create_group) | **POST** /v1/groups | Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
[**create_remote_group**](GroupsApi.md#create_remote_group) | **PUT** /v1/groups | Create a group using details from a remote authentication provider (LDAP) 
[**delete_group**](GroupsApi.md#delete_group) | **DELETE** /v1/groups/{guid} | Delete a group
[**get_group**](GroupsApi.md#get_group) | **GET** /v1/groups/{guid} | Get group details
[**get_group_members**](GroupsApi.md#get_group_members) | **GET** /v1/groups/{group_guid}/members | Get group member details
[**get_group_ownership**](GroupsApi.md#get_group_ownership) | **GET** /v1/experimental/groups/{guid}/content | List content for which a group with given GUID has access to
[**get_groups**](GroupsApi.md#get_groups) | **GET** /v1/groups | List or search for group details
[**remove_group_member**](GroupsApi.md#remove_group_member) | **DELETE** /v1/groups/{group_guid}/members/{user_guid} | Remove a group member
[**search_remote_groups**](GroupsApi.md#search_remote_groups) | **GET** /v1/groups/remote | Search for group details from a remote provider
[**update_group**](GroupsApi.md#update_group) | **POST** /v1/groups/{guid} | Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 

# **add_group_member**
> add_group_member(body, group_guid)

Add a group member

This endpoint adds a user to a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to modify a group you do   not own.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
body = connectapi.GroupGuidMembersBody() # GroupGuidMembersBody | The user to add as a member
group_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier

try:
    # Add a group member
    api_instance.add_group_member(body, group_guid)
except ApiException as e:
    print("Exception when calling GroupsApi->add_group_member: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GroupGuidMembersBody**](GroupGuidMembersBody.md)| The user to add as a member | 
 **group_guid** | [**str**](.md)| The group&#x27;s unique identifier | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_group**
> Group create_group(body)

Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 

This endpoint creates the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to create   groups.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
body = connectapi.V1GroupsBody1() # V1GroupsBody1 | The new group values.

try:
    # Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
    api_response = api_instance.create_group(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->create_group: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1GroupsBody1**](V1GroupsBody1.md)| The new group values. | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_remote_group**
> Group create_remote_group(body)

Create a group using details from a remote authentication provider (LDAP) 

This endpoint creates the given group on the Posit Connect server.  - This endpoint is used only for LDAP authentication. Password,   PAM, SAML, OAuth2 and Proxied authentication providers should   use the    <a href=\"#post-/v1/groups\">POST /v1/groups</a>   endpoint. - Publisher or administrator access is required to access this   endpoint. - Group members will be automatically populated from the LDAP server.  #### Group Creation Workflow on LDAP  The API lets you identify an existing group in the LDAP system and create a corresponding group on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/groups/remote\">GET /v1/groups/remote</a>   endpoint. This endpoint will return a list of potential   matching groups in LDAP. A group that does not exist in   Posit Connect will lack a `guid`. Note the `temp_ticket`   for the desired group. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding group on Posit Connect.  The [Create a Group from LDAP](../cookbook/groups/#create-group-ldap) recipe in the API Cookbook has sample code using this workflow.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
body = connectapi.V1GroupsBody() # V1GroupsBody | The request body needed for creating a group on the Posit Connect
server.

try:
    # Create a group using details from a remote authentication provider (LDAP) 
    api_response = api_instance.create_remote_group(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->create_remote_group: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1GroupsBody**](V1GroupsBody.md)| The request body needed for creating a group on the Posit Connect
server. | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_group**
> delete_group(guid)

Delete a group

Delete the given group.  - This endpoint can be used only when groups are enabled in   Posit Connnect and will return an error otherwise. - Administrator access is required to delete a group you do   not own.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier

try:
    # Delete a group
    api_instance.delete_group(guid)
except ApiException as e:
    print("Exception when calling GroupsApi->delete_group: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The group&#x27;s unique identifier | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_group**
> Group get_group(guid)

Get group details

Get detailed information on a specific group.  This endpoint is available only when groups are enabled in Posit Connect.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier

try:
    # Get group details
    api_response = api_instance.get_group(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->get_group: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The group&#x27;s unique identifier | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_group_members**
> GroupMembers get_group_members(group_guid)

Get group member details

This endpoint gets the group member details. Group member enumeration is currently not supported for LDAP.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
group_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier

try:
    # Get group member details
    api_response = api_instance.get_group_members(group_guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->get_group_members: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group_guid** | [**str**](.md)| The group&#x27;s unique identifier | 

### Return type

[**GroupMembers**](GroupMembers.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_group_ownership**
> GroupOwnership get_group_ownership(guid)

List content for which a group with given GUID has access to

This endpoint takes a group GUID and returns a list of content items with access control lists that the given group is listed on. This includes content accessible only by specific users or groups that include the given group, as well as content accessible by anyone or only logged-in users that includes the given group as a collaborator.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | 

try:
    # List content for which a group with given GUID has access to
    api_response = api_instance.get_group_ownership(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->get_group_ownership: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)|  | 

### Return type

[**GroupOwnership**](GroupOwnership.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_groups**
> Groups get_groups(prefix=prefix, page_number=page_number, page_size=page_size, asc_order=asc_order)

List or search for group details

This endpoint lists or searches for local groups.  - For a `prefix` search, results are sorted based on   similarity to the `prefix`. A `prefix` search ignores   `asc_order`. The first page of results will always be   returned. - The `prefix` can also be an exact match for the   group's DN (for LDAP) or the auth provider's unique ID   for the group, if any. - For a non-`prefix` search, results are sorted by group name.  This endpoint is available only when groups are enabled in Posit Connect and it will return an error otherwise.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
prefix = 'prefix_example' # str | Filters groups by prefix (group name). The filter is case insensitive. (optional)
page_number = 1 # int | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. For a `prefix` search, the first page of results will always be returned. (optional) (default to 1)
page_size = 20 # int | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough groups to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (optional) (default to 20)
asc_order = true # bool | Whether or not to return the groups in ascending order, sorted by name. For a `prefix` search, results are sorted first by exact match, then by increasing word length. (optional) (default to true)

try:
    # List or search for group details
    api_response = api_instance.get_groups(prefix=prefix, page_number=page_number, page_size=page_size, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->get_groups: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **str**| Filters groups by prefix (group name). The filter is case insensitive. | [optional] 
 **page_number** | **int**| The page to return relative to the given &#x60;page_size&#x60;. If &#x60;page_number&#x60; is 0 or negative, an error will be returned. For a &#x60;prefix&#x60; search, the first page of results will always be returned. | [optional] [default to 1]
 **page_size** | **int**| The number of items to include in each page. This parameter is \&quot;best effort\&quot; since there may not be enough groups to honor the request. If &#x60;page_size&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]
 **asc_order** | **bool**| Whether or not to return the groups in ascending order, sorted by name. For a &#x60;prefix&#x60; search, results are sorted first by exact match, then by increasing word length. | [optional] [default to true]

### Return type

[**Groups**](Groups.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **remove_group_member**
> remove_group_member(group_guid, user_guid)

Remove a group member

This endpoint removes a user from a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to remove a user from a   group you do not own, but no special access is needed to   remove yourself from a group.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
group_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier
user_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group member's unique identifier

try:
    # Remove a group member
    api_instance.remove_group_member(group_guid, user_guid)
except ApiException as e:
    print("Exception when calling GroupsApi->remove_group_member: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **group_guid** | [**str**](.md)| The group&#x27;s unique identifier | 
 **user_guid** | [**str**](.md)| The group member&#x27;s unique identifier | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_remote_groups**
> GroupRemoteSearch search_remote_groups(prefix, limit=limit)

Search for group details from a remote provider

This endpoint is used to support operations against groups not managed by Connect, such as  <a href=\"#post-/v1/groups\">creating LDAP groups</a> See <a href=\"#get-/v1/groups\">GET /v1/groups</a> for listing groups on Posit Connect.  This endpoint searches for groups on Posit Connect and on your LDAP system.  Results are sorted based on similarity to the `prefix`.  - This endpoint can be used only by LDAP authentication and   will return an error otherwise. - Publisher or administrator access is required to access this   endpoint.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
prefix = 'prefix_example' # str | Search groups by prefix. `prefix` is case insensitive.
limit = 20 # int | The maximum number of groups to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (optional) (default to 20)

try:
    # Search for group details from a remote provider
    api_response = api_instance.search_remote_groups(prefix, limit=limit)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->search_remote_groups: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **str**| Search groups by prefix. &#x60;prefix&#x60; is case insensitive. | 
 **limit** | **int**| The maximum number of groups to include in the results. If &#x60;limit&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]

### Return type

[**GroupRemoteSearch**](GroupRemoteSearch.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_group**
> Group update_group(body, guid)

Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 

This endpoint modifies the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to modify   groups.

### Example
```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.GroupsApi(connectapi.ApiClient(configuration))
body = connectapi.GroupsGuidBody() # GroupsGuidBody | The new group name and/or owner.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The group's unique identifier

try:
    # Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
    api_response = api_instance.update_group(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling GroupsApi->update_group: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GroupsGuidBody**](GroupsGuidBody.md)| The new group name and/or owner. | 
 **guid** | [**str**](.md)| The group&#x27;s unique identifier | 

### Return type

[**Group**](Group.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

