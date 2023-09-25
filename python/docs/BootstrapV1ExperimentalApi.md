# connectapi.BootstrapV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bootstrap**](BootstrapV1ExperimentalApi.md#bootstrap) | **POST** /v1/experimental/bootstrap | Create first admininistrator and API key

# **bootstrap**
> BootstrapSuccess bootstrap()

Create first admininistrator and API key

This endpoint creates an initial admininistrator user, provisions an API key for the initial administrator, and returns the API key. This endpoint only functions for installations with no pre-existing users.

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
api_instance = connectapi.BootstrapV1ExperimentalApi(connectapi.ApiClient(configuration))

try:
    # Create first admininistrator and API key
    api_response = api_instance.bootstrap()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BootstrapV1ExperimentalApi->bootstrap: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BootstrapSuccess**](BootstrapSuccess.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

