# RInformationApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetRInformation**](RInformationApi.md#GetRInformation) | **GET** /v1/server_settings/r | Get R Information


# **GetRInformation**
> object GetRInformation()

Get R Information

This endpoint returns a list of metadata objects for each version of R that is available for executing content.  This endpoint requires authentication and is only available to `publisher` and `administrator` roles.  The [R Versions Available](../cookbook/system-information/#available-r-versions) recipe in the Posit Connect API Cookbook contains a recipe with sample code.

### Example
```R
library(connectapi2)

# Get R Information
#

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | An object containing metadata about each installation of R. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **0** | An error occurred invoking the API. |  -  |

