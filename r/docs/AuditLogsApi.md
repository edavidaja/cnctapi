# AuditLogsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**GetAuditLogs**](AuditLogsApi.md#GetAuditLogs) | **GET** /v1/audit_logs | Get audit logs


# **GetAuditLogs**
> AuditLogs GetAuditLogs(limit = 20, previous = var.previous, var_next = var.var_next, asc_order = TRUE)

Get audit logs

This endpoint returns a portion of the audit logs, as well as paging information that can be used to navigate the audit log results.  This endpoint requires administrator access.  This endpoint uses keyset pagination. The [Keyset Pagination](../cookbook/pagination/#keyset-pagination) recipe in the Posit Connect API Cookbook has example code for fetching multiple pages.

### Example
```R
library(connectapi2)

# Get audit logs
#
# prepare function argument(s)
var_limit <- 20 # integer | Number of logs to return. The minimum supported value is 1 and maximum supported value is 500. Note that `limit` is a \"best effort\" request since there may not be enough logs to satisfy the limit. (Optional)
var_previous <- "previous_example" # character | Gets the previous page of audit logs relative to the given id. (Optional)
var_var_next <- "var_next_example" # character | Gets the next page of audit logs relative to the given id. (Optional)
var_asc_order <- TRUE # character | Whether the audit logs should be listed in ascending order (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **integer**| Number of logs to return. The minimum supported value is 1 and maximum supported value is 500. Note that &#x60;limit&#x60; is a \&quot;best effort\&quot; request since there may not be enough logs to satisfy the limit. | [optional] [default to 20]
 **previous** | **character**| Gets the previous page of audit logs relative to the given id. | [optional] 
 **var_next** | **character**| Gets the next page of audit logs relative to the given id. | [optional] 
 **asc_order** | **character**| Whether the audit logs should be listed in ascending order | [optional] [default to TRUE]

### Return type

[**AuditLogs**](AuditLogs.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The audit logs results and paging information |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

