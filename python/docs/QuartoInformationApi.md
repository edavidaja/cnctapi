# connectapi.QuartoInformationApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_quarto_information**](QuartoInformationApi.md#get_quarto_information) | **GET** /v1/server_settings/quarto | Get Quarto Information

# **get_quarto_information**
> QuartoInstallations get_quarto_information()

Get Quarto Information

This endpoint returns a list of metadata objects for each version of Quarto that is available for executing content.  This endpoint requires authentication and is only available to `publisher` and `administrator` roles.

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
api_instance = connectapi.QuartoInformationApi(connectapi.ApiClient(configuration))

try:
    # Get Quarto Information
    api_response = api_instance.get_quarto_information()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling QuartoInformationApi->get_quarto_information: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**QuartoInstallations**](QuartoInstallations.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

