# connectapi.ContentPermissionsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_content_permission**](ContentPermissionsApi.md#add_content_permission) | **POST** /v1/content/{guid}/permissions | Add permission
[**delete_content_permission**](ContentPermissionsApi.md#delete_content_permission) | **DELETE** /v1/content/{guid}/permissions/{id} | Delete permission
[**get_content_permission**](ContentPermissionsApi.md#get_content_permission) | **GET** /v1/content/{guid}/permissions/{id} | Get permission
[**list_content_permissions**](ContentPermissionsApi.md#list_content_permissions) | **GET** /v1/content/{guid}/permissions | List permissions
[**update_content_permission**](ContentPermissionsApi.md#update_content_permission) | **PUT** /v1/content/{guid}/permissions/{id} | Update permission

# **add_content_permission**
> Permission add_content_permission(body, guid)

Add permission

Add a user or group to the permissions for this content item.

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
api_instance = connectapi.ContentPermissionsApi(connectapi.ApiClient(configuration))
body = connectapi.GuidPermissionsBody() # GuidPermissionsBody | The request body required when creating a new permission entry.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Add permission
    api_response = api_instance.add_content_permission(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentPermissionsApi->add_content_permission: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GuidPermissionsBody**](GuidPermissionsBody.md)| The request body required when creating a new permission entry. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_content_permission**
> delete_content_permission(guid, id)

Delete permission

Delete a single permission entry for the content item, given its ID.

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
api_instance = connectapi.ContentPermissionsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the permission entry.

try:
    # Delete permission
    api_instance.delete_content_permission(guid, id)
except ApiException as e:
    print("Exception when calling ContentPermissionsApi->delete_content_permission: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **id** | **str**| The unique identifier of the permission entry. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_content_permission**
> Permission get_content_permission(guid, id)

Get permission

Get a single permission entry for the content item, given its ID.

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
api_instance = connectapi.ContentPermissionsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the permission entry.

try:
    # Get permission
    api_response = api_instance.get_content_permission(guid, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentPermissionsApi->get_content_permission: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **id** | **str**| The unique identifier of the permission entry. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_content_permissions**
> list[Permission] list_content_permissions(guid)

List permissions

List the permissions for this content item. There will be one permission item for each user or group listed in the ACL for this content item.

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
api_instance = connectapi.ContentPermissionsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # List permissions
    api_response = api_instance.list_content_permissions(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentPermissionsApi->list_content_permissions: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**list[Permission]**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_content_permission**
> Permission update_content_permission(body, guid, id)

Update permission

Update a permission entry for this content item.

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
api_instance = connectapi.ContentPermissionsApi(connectapi.ApiClient(configuration))
body = connectapi.PermissionsIdBody() # PermissionsIdBody | The request body required when creating a new permission entry.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the permission entry to update.

try:
    # Update permission
    api_response = api_instance.update_content_permission(body, guid, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentPermissionsApi->update_content_permission: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PermissionsIdBody**](PermissionsIdBody.md)| The request body required when creating a new permission entry. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **id** | **str**| The unique identifier of the permission entry to update. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

