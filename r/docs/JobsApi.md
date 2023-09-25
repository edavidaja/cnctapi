# JobsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetJob**](JobsApi.md#GetJob) | **GET** /v1/content/{guid}/jobs/{key} | Get job
[**GetJobs**](JobsApi.md#GetJobs) | **GET** /v1/content/{guid}/jobs | Get jobs
[**JobDownloadLog**](JobsApi.md#JobDownloadLog) | **GET** /v1/content/{guid}/jobs/{key}/download | Download job log file
[**JobError**](JobsApi.md#JobError) | **GET** /v1/content/{guid}/jobs/{key}/error | Get job error
[**JobLogs**](JobsApi.md#JobLogs) | **GET** /v1/content/{guid}/jobs/{key}/log | Get job log
[**JobTailLog**](JobsApi.md#JobTailLog) | **GET** /v1/content/{guid}/jobs/{key}/tail | Tail job log
[**KillJob**](JobsApi.md#KillJob) | **DELETE** /v1/content/{guid}/jobs/{key} | Register job kill order


# **GetJob**
> JobItem GetJob(guid, key)

Get job

Get a job for a given piece of content by key. This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Get job
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 

### Return type

[**JobItem**](JobItem.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The content job. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetJobs**
> array[JobItem] GetJobs(guid)

Get jobs

Get the list of jobs for a given piece of content. This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Get jobs
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 

### Return type

[**array[JobItem]**](JobItem.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | An array of content jobs. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **JobDownloadLog**
> data.frame JobDownloadLog(guid, key, filename = "rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log")

Download job log file

Download a content job log file. This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Download job log file
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key
var_filename <- "rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log" # character | The name of the file to retrieve (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 
 **filename** | **character**| The name of the file to retrieve | [optional] [default to &quot;rstudio-connect.{app_id}.{variant_id}.{bundle_id}.{job_tag}.{job_key}.log&quot;]

### Return type

**data.frame**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The log file of the job containing both stdout and stderr |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **JobError**
> LoggedError JobError(guid, key)

Get job error

Get the primary error for a job (if one exists). This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Get job error
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 

### Return type

[**LoggedError**](LoggedError.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The primary error of a job. |  -  |
| **204** | No error is found. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **JobLogs**
> LogEntries JobLogs(guid, key, max_log_lines = 5000)

Get job log

Get the log output for a given job. This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Get job log
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key
var_max_log_lines <- 5000 # integer | The maximum number of log lines to return (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 
 **max_log_lines** | **integer**| The maximum number of log lines to return | [optional] [default to 5000]

### Return type

[**LogEntries**](LogEntries.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The log output for the job |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **JobTailLog**
> LogEntry JobTailLog(guid, key)

Tail job log

Actively tail the log output for a given job. This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Tail job log
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 

### Return type

[**LogEntry**](LogEntry.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | An open connection actively sending job log entries as they are created. Closes when job is finalized. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **KillJob**
> KillJobOrder KillJob(guid, key)

Register job kill order

Request to register an order to kill a specific job.  This action is permitted for content owners, users with collaborator rights, and administrators.

### Example
```R
library(connectapi2)

# Register job kill order
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item
var_key <- "key_example" # character | The job's unique key

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item | 
 **key** | **character**| The job&#39;s unique key | 

### Return type

[**KillJobOrder**](KillJobOrder.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The order to kill the job was properly registered. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

