# QuartoInformationApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetQuartoInformation**](QuartoInformationApi.md#GetQuartoInformation) | **GET** /v1/server_settings/quarto | Get Quarto Information


# **GetQuartoInformation**
> object GetQuartoInformation()

Get Quarto Information

This endpoint returns a list of metadata objects for each version of Quarto that is available for executing content.  This endpoint requires authentication and is only available to `publisher` and `administrator` roles.

### Example
```R
library(connectapi2)

# Get Quarto Information
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
| **200** | An object containing metadata about each installation of Quarto. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **0** | An error occurred invoking the API. |  -  |

