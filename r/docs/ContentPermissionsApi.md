# ContentPermissionsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddContentPermission**](ContentPermissionsApi.md#AddContentPermission) | **POST** /v1/content/{guid}/permissions | Add permission
[**DeleteContentPermission**](ContentPermissionsApi.md#DeleteContentPermission) | **DELETE** /v1/content/{guid}/permissions/{id} | Delete permission
[**GetContentPermission**](ContentPermissionsApi.md#GetContentPermission) | **GET** /v1/content/{guid}/permissions/{id} | Get permission
[**ListContentPermissions**](ContentPermissionsApi.md#ListContentPermissions) | **GET** /v1/content/{guid}/permissions | List permissions
[**UpdateContentPermission**](ContentPermissionsApi.md#UpdateContentPermission) | **PUT** /v1/content/{guid}/permissions/{id} | Update permission


# **AddContentPermission**
> Permission AddContentPermission(guid, permission)

Add permission

Add a user or group to the permissions for this content item.

### Example
```R
library(connectapi2)

# Add permission
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_permission <- addContentPermission_request$new("principal_guid_example", "user", "viewer") # AddContentPermissionRequest | The request body required when creating a new permission entry.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **permission** | [**AddContentPermissionRequest**](AddContentPermissionRequest.md)| The request body required when creating a new permission entry. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The content permission entry that was added. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeleteContentPermission**
> DeleteContentPermission(guid, id)

Delete permission

Delete a single permission entry for the content item, given its ID.

### Example
```R
library(connectapi2)

# Delete permission
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the permission entry.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **id** | **character**| The unique identifier of the permission entry. | 

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
| **204** | Returned when the permission entry is successfully deleted. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetContentPermission**
> Permission GetContentPermission(guid, id)

Get permission

Get a single permission entry for the content item, given its ID.

### Example
```R
library(connectapi2)

# Get permission
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the permission entry.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **id** | **character**| The unique identifier of the permission entry. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The permission entry defining the permission level that  a user or group has been granted to the content item. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListContentPermissions**
> array[Permission] ListContentPermissions(guid)

List permissions

List the permissions for this content item. There will be one permission item for each user or group listed in the ACL for this content item.

### Example
```R
library(connectapi2)

# List permissions
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 

### Return type

[**array[Permission]**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of permissions associated with this content item. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateContentPermission**
> Permission UpdateContentPermission(guid, id, permission)

Update permission

Update a permission entry for this content item.

### Example
```R
library(connectapi2)

# Update permission
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the permission entry to update.
var_permission <- updateContentPermission_request$new("principal_guid_example", "user", "viewer") # UpdateContentPermissionRequest | The request body required when creating a new permission entry.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **id** | **character**| The unique identifier of the permission entry to update. | 
 **permission** | [**UpdateContentPermissionRequest**](UpdateContentPermissionRequest.md)| The request body required when creating a new permission entry. | 

### Return type

[**Permission**](Permission.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The updated content permission entry. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

