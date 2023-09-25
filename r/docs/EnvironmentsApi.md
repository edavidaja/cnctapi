# EnvironmentsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateEnvironment**](EnvironmentsApi.md#CreateEnvironment) | **POST** /v1/environments | Create execution environment
[**DeleteEnvironment**](EnvironmentsApi.md#DeleteEnvironment) | **DELETE** /v1/environments/{guid} | Delete an execution environment
[**GetEnvironment**](EnvironmentsApi.md#GetEnvironment) | **GET** /v1/environments/{guid} | Get execution environment details
[**ListEnvironments**](EnvironmentsApi.md#ListEnvironments) | **GET** /v1/environments | List execution environments
[**UpdateEnvironment**](EnvironmentsApi.md#UpdateEnvironment) | **PUT** /v1/environments/{guid} | Update an execution environment


# **CreateEnvironment**
> Environment CreateEnvironment(environment)

Create execution environment

Create a new execution environment.  You must have administrator privileges to perform this action.

### Example
```R
library(connectapi2)

# Create execution environment
#
# prepare function argument(s)
var_environment <- CreateEnvironmentInput$new("title_example", "cluster_name_example", "name_example", "description_example", "any", "supervisor_example", CreateEnvironmentInput_python$new(c(Installation$new("path_example", "version_example"))), CreateEnvironmentInput_quarto$new(c(Installation$new("path_example", "version_example"))), CreateEnvironmentInput_r$new(c(Installation$new("path_example", "version_example")))) # CreateEnvironmentInput | The request body required when creating a new execution environment.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **environment** | [**CreateEnvironmentInput**](CreateEnvironmentInput.md)| The request body required when creating a new execution environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The details for the newly created execution environment. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeleteEnvironment**
> DeleteEnvironment(guid)

Delete an execution environment

Delete a specific execution environment.  You must have administrator privileges to perform this action.

### Example
```R
library(connectapi2)

# Delete an execution environment
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired environment.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired environment. | 

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
| **204** | Returned when the environment was successfully removed. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetEnvironment**
> Environment GetEnvironment(guid)

Get execution environment details

Get detailed information about a specific execution environment.  You must have administrator or publisher privileges to perform this action.

### Example
```R
library(connectapi2)

# Get execution environment details
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired environment.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested environment details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListEnvironments**
> array[Environment] ListEnvironments()

List execution environments

List all execution environments available to Posit Connect.  You must have administrator or publisher privileges to perform this action.

### Example
```R
library(connectapi2)

# List execution environments
#

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[Environment]**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | An array containing all available execution environments. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateEnvironment**
> Environment UpdateEnvironment(guid, environment)

Update an execution environment

Update a specific execution environment.  You must have administrator privileges to perform this action.

### Example
```R
library(connectapi2)

# Update an execution environment
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired environment.
var_environment <- UpdateEnvironmentInput$new("title_example", "description_example", "any", "supervisor_example", CreateEnvironmentInput_python$new(c(Installation$new("path_example", "version_example"))), CreateEnvironmentInput_quarto$new(c(Installation$new("path_example", "version_example"))), CreateEnvironmentInput_r$new(c(Installation$new("path_example", "version_example")))) # UpdateEnvironmentInput | The request body required when creating a new execution environment.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired environment. | 
 **environment** | [**UpdateEnvironmentInput**](UpdateEnvironmentInput.md)| The request body required when creating a new execution environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The details for the updated execution environment. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

