# connectapi.JobsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_job**](JobsApi.md#get_job) | **GET** /v1/content/{guid}/jobs/{key} | Get job
[**get_jobs**](JobsApi.md#get_jobs) | **GET** /v1/content/{guid}/jobs | Get jobs
[**job_download_log**](JobsApi.md#job_download_log) | **GET** /v1/content/{guid}/jobs/{key}/download | Download job log file
[**job_error**](JobsApi.md#job_error) | **GET** /v1/content/{guid}/jobs/{key}/error | Get job error
[**job_logs**](JobsApi.md#job_logs) | **GET** /v1/content/{guid}/jobs/{key}/log | Get job log
[**job_tail_log**](JobsApi.md#job_tail_log) | **GET** /v1/content/{guid}/jobs/{key}/tail | Tail job log
[**kill_job**](JobsApi.md#kill_job) | **DELETE** /v1/content/{guid}/jobs/{key} | Register job kill order

# **get_job**
> JobItem get_job(guid, key)

Get job

Get a job for a given piece of content by key. This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key

try:
    # Get job
    api_response = api_instance.get_job(guid, key)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->get_job: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 

### Return type

[**JobItem**](JobItem.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_jobs**
> JobItems get_jobs(guid)

Get jobs

Get the list of jobs for a given piece of content. This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item

try:
    # Get jobs
    api_response = api_instance.get_jobs(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->get_jobs: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 

### Return type

[**JobItems**](JobItems.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **job_download_log**
> str job_download_log(guid, key, filename=filename)

Download job log file

Download a content job log file. This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key
filename = 'rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log' # str | The name of the file to retrieve (optional) (default to rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log)

try:
    # Download job log file
    api_response = api_instance.job_download_log(guid, key, filename=filename)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->job_download_log: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 
 **filename** | **str**| The name of the file to retrieve | [optional] [default to rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log]

### Return type

**str**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **job_error**
> LoggedError job_error(guid, key)

Get job error

Get the primary error for a job (if one exists). This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key

try:
    # Get job error
    api_response = api_instance.job_error(guid, key)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->job_error: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 

### Return type

[**LoggedError**](LoggedError.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **job_logs**
> LogEntries job_logs(guid, key, max_log_lines=max_log_lines)

Get job log

Get the log output for a given job. This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key
max_log_lines = 5000 # int | The maximum number of log lines to return (optional) (default to 5000)

try:
    # Get job log
    api_response = api_instance.job_logs(guid, key, max_log_lines=max_log_lines)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->job_logs: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 
 **max_log_lines** | **int**| The maximum number of log lines to return | [optional] [default to 5000]

### Return type

[**LogEntries**](LogEntries.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **job_tail_log**
> LogEntry job_tail_log(guid, key)

Tail job log

Actively tail the log output for a given job. This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key

try:
    # Tail job log
    api_response = api_instance.job_tail_log(guid, key)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->job_tail_log: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 

### Return type

[**LogEntry**](LogEntry.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **kill_job**
> KillJobOrder kill_job(guid, key)

Register job kill order

Request to register an order to kill a specific job.  This action is permitted for content owners, users with collaborator rights, and administrators.

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
api_instance = connectapi.JobsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item
key = 'key_example' # str | The job's unique key

try:
    # Register job kill order
    api_response = api_instance.kill_job(guid, key)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling JobsApi->kill_job: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item | 
 **key** | **str**| The job&#x27;s unique key | 

### Return type

[**KillJobOrder**](KillJobOrder.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

