# connectapi.RInformationApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_r_information**](RInformationApi.md#get_r_information) | **GET** /v1/server_settings/r | Get R Information

# **get_r_information**
> RInstallations get_r_information()

Get R Information

This endpoint returns a list of metadata objects for each version of R that is available for executing content.  This endpoint requires authentication and is only available to `publisher` and `administrator` roles.  The [R Versions Available](../cookbook/system-information/#available-r-versions) recipe in the Posit Connect API Cookbook contains a recipe with sample code.

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
api_instance = connectapi.RInformationApi(connectapi.ApiClient(configuration))

try:
    # Get R Information
    api_response = api_instance.get_r_information()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling RInformationApi->get_r_information: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RInstallations**](RInstallations.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

