# connectapi.TasksV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_task**](TasksV1ExperimentalApi.md#get_task) | **GET** /v1/experimental/tasks/{id} | Get task details

# **get_task**
> InlineResponse2006 get_task(id, first=first, wait=wait)

Get task details

Returns the current state of a task and any output lines past the requested initial position (`first`).  When `wait` is non-zero, will wait up to that number of seconds for the task to complete before responding. The current state of the task is returned once the task completes or `wait` seconds elapse.  Incrementally receive task output by using the `last` response field value as the `first` value in a subsequent query.  Use `wait` and `first` together to incrementally fetch generated output.  Here is a URL that allows up to 5 seconds before returning all available output:  ``` /v1/experimental/tasks/CmsfmnfDDyRUrsAc?wait=5&first=0 ```  Let's assume that request has a JSON response with the `last` field having a value of `23`. Here is a URL that requests output past that point, again allowing up to 5 seconds:  ``` /v1/experimental/tasks/CmsfmnfDDyRUrsAc?wait=5&first=23 ```  Continue with this pattern until the JSON response indicates that the task has finished.

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
api_instance = connectapi.TasksV1ExperimentalApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The identifier of the desired task.
first = 0 # int | The first line of output to include in the response. The value `0` indicates that all lines should be returned.  Values less than `0` are not permitted. Values greater than the total number of lines produced by the task are not permitted. (optional) (default to 0)
wait = 0 # int | The number of seconds to wait for task completion before responding. The current state of the task is returned once the task completes or this time elapses.  Values less than `0` or greater than `20` are not permitted. (optional) (default to 0)

try:
    # Get task details
    api_response = api_instance.get_task(id, first=first, wait=wait)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TasksV1ExperimentalApi->get_task: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The identifier of the desired task. | 
 **first** | **int**| The first line of output to include in the response. The value &#x60;0&#x60; indicates that all lines should be returned.  Values less than &#x60;0&#x60; are not permitted. Values greater than the total number of lines produced by the task are not permitted. | [optional] [default to 0]
 **wait** | **int**| The number of seconds to wait for task completion before responding. The current state of the task is returned once the task completes or this time elapses.  Values less than &#x60;0&#x60; or greater than &#x60;20&#x60; are not permitted. | [optional] [default to 0]

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

