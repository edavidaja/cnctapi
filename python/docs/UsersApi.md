# connectapi.UsersApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_pull_user**](UsersApi.md#create_pull_user) | **PUT** /v1/users | Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google) 
[**create_push_user**](UsersApi.md#create_push_user) | **POST** /v1/users | Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google) 
[**get_current_user**](UsersApi.md#get_current_user) | **GET** /v1/user | Get current user details
[**get_user**](UsersApi.md#get_user) | **GET** /v1/users/{guid} | Get user details
[**get_users**](UsersApi.md#get_users) | **GET** /v1/users | List or search for user details
[**lock_user**](UsersApi.md#lock_user) | **POST** /v1/users/{guid}/lock | Lock a user
[**search_remote_users**](UsersApi.md#search_remote_users) | **GET** /v1/users/remote | Search for user details from a remote provider
[**update_user**](UsersApi.md#update_user) | **PUT** /v1/users/{guid} | Update a user

# **create_pull_user**
> User create_pull_user(body)

Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google) 

This endpoint creates the given user on the Posit Connect server.  - This endpoint is used only for LDAP and OAuth2 with Google   authentication. All other authentication providers should   use the    <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint. - Unlike the   <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint, publisher or administrator access is required to access this   endpoint.  #### User Creation Workflow on LDAP and OAuth2 with Google  This endpoint requires authentication, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect? The first user can be created by simply logging into Posit Connect. The Posit Connect Server API cannot be used to create the first user. Once logged in, you can create an API Key.  For LDAP and OAuth2 with Google, the API lets you identify an existing user in the LDAP or OAuth2 with Google system and create a corresponding account on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/users/remote\">GET /v1/users/remote</a>   endpoint. This   endpoint will return a list of potential matching accounts   in LDAP or OAuth2 with Google. A user with no account on Posit Connect will   lack a `guid`. Note the `temp_ticket` for the desired user   account. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding account on Posit Connect.  The [Create a User from LDAP/OAuth](../cookbook/users/#create-user-ldap-oauth2) recipe in the API Cookbook has sample code using this workflow.  #### LDAP and OAuth2 with Google Authentication  - The created user role will default to the role specified by   the config setting `Authorization.DefaultUserRole`.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
body = connectapi.V1UsersBody() # V1UsersBody | The request body needed for creating a user on the Posit Connect
server.

try:
    # Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google) 
    api_response = api_instance.create_pull_user(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->create_pull_user: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1UsersBody**](V1UsersBody.md)| The request body needed for creating a user on the Posit Connect
server. | 

### Return type

[**User**](User.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_push_user**
> User create_push_user(body)

Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google) 

This endpoint creates the given user.  - This endpoint is used only for SAML, OAuth2 (non-Google), password, PAM, and proxied   authentication. All other authentication providers should   use the    <a href=\"#put-/v1/users\">PUT /v1/users</a>   endpoint. - Administrator access is required to create *other* users.  #### Initial User Creation Workflow  This endpoint requires authentication to create *other* users, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect?  - For password authentication, you can use this endpoint   without an API Key to create the first user. The first user   will be an administrator. - For SAML, OAuth2 (non-Google), PAM or proxied authentication, the first user can be   created by logging into Posit Connect. The API cannot be used.  Once the first user is created, an API Key can be used to access this endpoint and create subsequent users. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  #### All Authentication Providers  - When `user_role` is not specified, it will default to the   role specified by the config setting   `Authorization.DefaultUserRole`.  #### SAML, OAuth2 (non-Google), PAM and Proxied Authentication  - An API Key must always be used. Users cannot use this   endpoint to create their own account. - Administrator access is always required to create accounts.  #### Password Authentication  - Users must confirm their account through an email. This   feature is unique to password authentication. - Administrator access is always required except for the first   created user.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
body = connectapi.V1UsersBody1() # V1UsersBody1 | The new user values.

try:
    # Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google) 
    api_response = api_instance.create_push_user(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->create_push_user: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1UsersBody1**](V1UsersBody1.md)| The new user values. | 

### Return type

[**User**](User.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_current_user**
> User get_current_user()

Get current user details

Get detailed information on the requesting user.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))

try:
    # Get current user details
    api_response = api_instance.get_current_user()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->get_current_user: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User**](User.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_user**
> User get_user(guid)

Get user details

Get detailed information on a specific user.  The `email` field is not populated for non-admins when `Server.HideEmailAddresses` is enabled.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.

try:
    # Get user details
    api_response = api_instance.get_user(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->get_user: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The user&#x27;s GUID, or unique identifier  Example value &#x3D; &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. | 

### Return type

[**User**](User.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_users**
> Users get_users(prefix=prefix, user_role=user_role, account_status=account_status, page_number=page_number, page_size=page_size, asc_order=asc_order)

List or search for user details

This endpoint lists local users. When called with a prefix parameter, it searches for local users matching the prefix.  Results are sorted by first name, then last name, then username, then email. `prefix` searches are first sorted based on similarity to the prefix and then by first name, last name, username, email. The `prefix` can also be an exact match for the user's DN (for LDAP) or the auth provider's unique ID for the user, if any.  - Administrator access is required for filtering by   `account_status`. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.  Note that searching by `prefix` will always return the first page of results.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
prefix = 'prefix_example' # str | Filters users by prefix (username, first name, or last name). The filter is case insensitive. (optional)
user_role = 'user_role_example' # str | Filter by user role. \"|\" represents logical OR. For example, `user_role=viewer|publisher` means users who are either a viewer or a publisher will be included in the result.  Note that for `user_role`, logical AND is also supported but always returns no results. For example, `user_role=viewer&user_role=publisher` tries to return users who are both viewers and publishers. (optional)
account_status = 'account_status_example' # str | Filter by account status. \"|\" represents logical OR. For example, `account_status=locked|licensed` means users who are either locked or licensed. - `locked` - Users with a locked account. - `licensed` - Users regarded as licensed (unlocked and   recently active). - `inactive` - Users not locked and not recently active.  Note that for `account_status`, logical AND is also supported but always returns no results. For example, `account_status=locked&account_status=licensed` tries to return users who are both locked and licensed. (optional)
page_number = 1 # int | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. (optional) (default to 1)
page_size = 20 # int | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough users to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (optional) (default to 20)
asc_order = true # bool | Whether or not to return the users in ascending order, sorted by first name, last name, username, and email. (optional) (default to true)

try:
    # List or search for user details
    api_response = api_instance.get_users(prefix=prefix, user_role=user_role, account_status=account_status, page_number=page_number, page_size=page_size, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->get_users: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **str**| Filters users by prefix (username, first name, or last name). The filter is case insensitive. | [optional] 
 **user_role** | **str**| Filter by user role. \&quot;|\&quot; represents logical OR. For example, &#x60;user_role&#x3D;viewer|publisher&#x60; means users who are either a viewer or a publisher will be included in the result.  Note that for &#x60;user_role&#x60;, logical AND is also supported but always returns no results. For example, &#x60;user_role&#x3D;viewer&amp;user_role&#x3D;publisher&#x60; tries to return users who are both viewers and publishers. | [optional] 
 **account_status** | **str**| Filter by account status. \&quot;|\&quot; represents logical OR. For example, &#x60;account_status&#x3D;locked|licensed&#x60; means users who are either locked or licensed. - &#x60;locked&#x60; - Users with a locked account. - &#x60;licensed&#x60; - Users regarded as licensed (unlocked and   recently active). - &#x60;inactive&#x60; - Users not locked and not recently active.  Note that for &#x60;account_status&#x60;, logical AND is also supported but always returns no results. For example, &#x60;account_status&#x3D;locked&amp;account_status&#x3D;licensed&#x60; tries to return users who are both locked and licensed. | [optional] 
 **page_number** | **int**| The page to return relative to the given &#x60;page_size&#x60;. If &#x60;page_number&#x60; is 0 or negative, an error will be returned. | [optional] [default to 1]
 **page_size** | **int**| The number of items to include in each page. This parameter is \&quot;best effort\&quot; since there may not be enough users to honor the request. If &#x60;page_size&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]
 **asc_order** | **bool**| Whether or not to return the users in ascending order, sorted by first name, last name, username, and email. | [optional] [default to true]

### Return type

[**Users**](Users.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lock_user**
> lock_user(body, guid)

Lock a user

This endpoint locks or unlocks a given user account.  - License limits are taken into account when unlocking a user. - Administrator access is required to access this endpoint. - Users are able to lock themselves.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
body = connectapi.GuidLockBody() # GuidLockBody | The lock request
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.

try:
    # Lock a user
    api_instance.lock_user(body, guid)
except ApiException as e:
    print("Exception when calling UsersApi->lock_user: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GuidLockBody**](GuidLockBody.md)| The lock request | 
 **guid** | [**str**](.md)| The user&#x27;s GUID, or unique identifier  Example value &#x3D; &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search_remote_users**
> RemoteSearchResults search_remote_users(prefix, limit=limit)

Search for user details from a remote provider

This endpoint is used to support operations against users who do not have an Posit Connect account, such as <a href=\"#put-/v1/users\">creating LDAP and OAuth2 with Google users</a> See <a href=\"#get-/v1/users\">GET /v1/users</a> for listing users.  This endpoint searches for users on Posit Connect and on your LDAP or OAuth2 with Google system.  Results are first sorted based on similarity to the `prefix` and then by first name, last name, username, and email.  - This endpoint can be used only by LDAP or OAuth2 with Google   authentication and will return an error otherwise. - Publisher or administrator access is required to access this   endpoint. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
prefix = 'prefix_example' # str | Search users by prefix (username, first name, or last name). `prefix` is case insensitive.
limit = 20 # int | The maximum number of users to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (optional) (default to 20)

try:
    # Search for user details from a remote provider
    api_response = api_instance.search_remote_users(prefix, limit=limit)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->search_remote_users: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **prefix** | **str**| Search users by prefix (username, first name, or last name). &#x60;prefix&#x60; is case insensitive. | 
 **limit** | **int**| The maximum number of users to include in the results. If &#x60;limit&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]

### Return type

[**RemoteSearchResults**](RemoteSearchResults.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_user**
> EditableUser update_user(body, guid)

Update a user

This endpoint updates a given user and returns the updated user properties. Note that it returns only the properties that can be modified by this endpoint.  If the authentication provider allows it:  - a user can change their own user properties. - another user's properties can be changed with administrator   access. - The configuration setting `Authorization.UserInfoEditableBy`   controls whether or not non-admins can edit their own properties.  #### Password Authentication  - Emails are required. - Changing an unconfirmed user's email will cause the   confirmation email to be resent to the new email.

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
api_instance = connectapi.UsersApi(connectapi.ApiClient(configuration))
body = connectapi.UsersGuidBody() # UsersGuidBody | The new user values.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.

try:
    # Update a user
    api_response = api_instance.update_user(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling UsersApi->update_user: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UsersGuidBody**](UsersGuidBody.md)| The new user values. | 
 **guid** | [**str**](.md)| The user&#x27;s GUID, or unique identifier  Example value &#x3D; &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. | 

### Return type

[**EditableUser**](EditableUser.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

