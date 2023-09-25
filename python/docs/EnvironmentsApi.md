# connectapi.EnvironmentsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_environment**](EnvironmentsApi.md#create_environment) | **POST** /v1/environments | Create execution environment
[**delete_environment**](EnvironmentsApi.md#delete_environment) | **DELETE** /v1/environments/{guid} | Delete an execution environment
[**get_environment**](EnvironmentsApi.md#get_environment) | **GET** /v1/environments/{guid} | Get execution environment details
[**list_environments**](EnvironmentsApi.md#list_environments) | **GET** /v1/environments | List execution environments
[**update_environment**](EnvironmentsApi.md#update_environment) | **PUT** /v1/environments/{guid} | Update an execution environment

# **create_environment**
> Environment create_environment(body)

Create execution environment

Create a new execution environment.  You must have administrator privileges to perform this action.

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
api_instance = connectapi.EnvironmentsApi(connectapi.ApiClient(configuration))
body = connectapi.CreateEnvironmentInput() # CreateEnvironmentInput | The request body required when creating a new execution environment.

try:
    # Create execution environment
    api_response = api_instance.create_environment(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EnvironmentsApi->create_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**CreateEnvironmentInput**](CreateEnvironmentInput.md)| The request body required when creating a new execution environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_environment**
> delete_environment(guid)

Delete an execution environment

Delete a specific execution environment.  You must have administrator privileges to perform this action.

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
api_instance = connectapi.EnvironmentsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired environment.

try:
    # Delete an execution environment
    api_instance.delete_environment(guid)
except ApiException as e:
    print("Exception when calling EnvironmentsApi->delete_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired environment. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_environment**
> Environment get_environment(guid)

Get execution environment details

Get detailed information about a specific execution environment.  You must have administrator or publisher privileges to perform this action.

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
api_instance = connectapi.EnvironmentsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired environment.

try:
    # Get execution environment details
    api_response = api_instance.get_environment(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EnvironmentsApi->get_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_environments**
> list[Environment] list_environments()

List execution environments

List all execution environments available to Posit Connect.  You must have administrator or publisher privileges to perform this action.

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
api_instance = connectapi.EnvironmentsApi(connectapi.ApiClient(configuration))

try:
    # List execution environments
    api_response = api_instance.list_environments()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EnvironmentsApi->list_environments: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**list[Environment]**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_environment**
> Environment update_environment(body, guid)

Update an execution environment

Update a specific execution environment.  You must have administrator privileges to perform this action.

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
api_instance = connectapi.EnvironmentsApi(connectapi.ApiClient(configuration))
body = connectapi.UpdateEnvironmentInput() # UpdateEnvironmentInput | The request body required when creating a new execution environment.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired environment.

try:
    # Update an execution environment
    api_response = api_instance.update_environment(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling EnvironmentsApi->update_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**UpdateEnvironmentInput**](UpdateEnvironmentInput.md)| The request body required when creating a new execution environment. | 
 **guid** | [**str**](.md)| The unique identifier of the desired environment. | 

### Return type

[**Environment**](Environment.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

