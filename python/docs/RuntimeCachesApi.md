# connectapi.RuntimeCachesApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_runtime_cache**](RuntimeCachesApi.md#delete_runtime_cache) | **DELETE** /v1/system/caches/runtime | Delete a runtime cache
[**list_runtime_caches**](RuntimeCachesApi.md#list_runtime_caches) | **GET** /v1/system/caches/runtime | List runtime caches

# **delete_runtime_cache**
> DeleteRuntimeCacheResponse delete_runtime_cache(body)

Delete a runtime cache

Delete a content runtime package cache by specifying language, version, and execution environment. This action is only available to administrators.

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
api_instance = connectapi.RuntimeCachesApi(connectapi.ApiClient(configuration))
body = connectapi.CachesRuntimeBody() # CachesRuntimeBody | The target runtime cache.

try:
    # Delete a runtime cache
    api_response = api_instance.delete_runtime_cache(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RuntimeCachesApi->delete_runtime_cache: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CachesRuntimeBody**](CachesRuntimeBody.md)| The target runtime cache. | 

### Return type

[**DeleteRuntimeCacheResponse**](DeleteRuntimeCacheResponse.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_runtime_caches**
> RuntimeCaches list_runtime_caches()

List runtime caches

List all content runtime caches. These include packrat and Python environment caches. This information is available only to administrators.

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
api_instance = connectapi.RuntimeCachesApi(connectapi.ApiClient(configuration))

try:
    # List runtime caches
    api_response = api_instance.list_runtime_caches()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RuntimeCachesApi->list_runtime_caches: %s\n" % e)
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

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

