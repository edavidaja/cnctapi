# RuntimeCachesApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteRuntimeCache**](RuntimeCachesApi.md#DeleteRuntimeCache) | **DELETE** /v1/system/caches/runtime | Delete a runtime cache
[**ListRuntimeCaches**](RuntimeCachesApi.md#ListRuntimeCaches) | **GET** /v1/system/caches/runtime | List runtime caches


# **DeleteRuntimeCache**
> DeleteRuntimeCacheResponse DeleteRuntimeCache(cache)

Delete a runtime cache

Delete a content runtime package cache by specifying language, version, and execution environment. This action is only available to administrators.

### Example
```R
library(connectapi2)

# Delete a runtime cache
#
# prepare function argument(s)
var_cache <- deleteRuntimeCache_request$new("language_example", "version_example", "image_name_example", "dry_run_example") # DeleteRuntimeCacheRequest | The target runtime cache.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cache** | [**DeleteRuntimeCacheRequest**](DeleteRuntimeCacheRequest.md)| The target runtime cache. | 

### Return type

[**DeleteRuntimeCacheResponse**](DeleteRuntimeCacheResponse.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested deletion task. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListRuntimeCaches**
> RuntimeCaches ListRuntimeCaches()

List runtime caches

List all content runtime caches. These include packrat and Python environment caches. This information is available only to administrators.

### Example
```R
library(connectapi2)

# List runtime caches
#

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RuntimeCaches**](RuntimeCaches.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The runtime caches found on the Connect server. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

