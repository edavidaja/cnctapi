# TasksV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetTask**](TasksV1ExperimentalApi.md#GetTask) | **GET** /v1/experimental/tasks/{id} | Get task details


# **GetTask**
> GetTask200Response GetTask(id, first = 0, wait = 0)

Get task details

Returns the current state of a task and any output lines past the requested initial position (`first`).  When `wait` is non-zero, will wait up to that number of seconds for the task to complete before responding. The current state of the task is returned once the task completes or `wait` seconds elapse.  Incrementally receive task output by using the `last` response field value as the `first` value in a subsequent query.  Use `wait` and `first` together to incrementally fetch generated output.  Here is a URL that allows up to 5 seconds before returning all available output:  ``` /v1/experimental/tasks/CmsfmnfDDyRUrsAc?wait=5&first=0 ```  Let's assume that request has a JSON response with the `last` field having a value of `23`. Here is a URL that requests output past that point, again allowing up to 5 seconds:  ``` /v1/experimental/tasks/CmsfmnfDDyRUrsAc?wait=5&first=23 ```  Continue with this pattern until the JSON response indicates that the task has finished.

### Example
```R
library(connectapi2)

# Get task details
#
# prepare function argument(s)
var_id <- "id_example" # character | The identifier of the desired task.
var_first <- 0 # integer | The first line of output to include in the response. The value `0` indicates that all lines should be returned.  Values less than `0` are not permitted. Values greater than the total number of lines produced by the task are not permitted. (Optional)
var_wait <- 0 # integer | The number of seconds to wait for task completion before responding. The current state of the task is returned once the task completes or this time elapses.  Values less than `0` or greater than `20` are not permitted. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The identifier of the desired task. | 
 **first** | **integer**| The first line of output to include in the response. The value &#x60;0&#x60; indicates that all lines should be returned.  Values less than &#x60;0&#x60; are not permitted. Values greater than the total number of lines produced by the task are not permitted. | [optional] [default to 0]
 **wait** | **integer**| The number of seconds to wait for task completion before responding. The current state of the task is returned once the task completes or this time elapses.  Values less than &#x60;0&#x60; or greater than &#x60;20&#x60; are not permitted. | [optional] [default to 0]

### Return type

[**GetTask200Response**](getTask_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The task details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

