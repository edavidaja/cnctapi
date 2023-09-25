# BootstrapV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**Bootstrap**](BootstrapV1ExperimentalApi.md#Bootstrap) | **POST** /v1/experimental/bootstrap | Create first admininistrator and API key


# **Bootstrap**
> BootstrapSuccess Bootstrap()

Create first admininistrator and API key

This endpoint creates an initial admininistrator user, provisions an API key for the initial administrator, and returns the API key. This endpoint only functions for installations with no pre-existing users.

### Example
```R
library(connectapi2)

# Create first admininistrator and API key
#

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
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

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The API key for the initial administrator account. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

