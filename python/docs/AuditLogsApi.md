# connectapi.AuditLogsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_audit_logs**](AuditLogsApi.md#get_audit_logs) | **GET** /v1/audit_logs | Get audit logs

# **get_audit_logs**
> AuditLogs get_audit_logs(limit=limit, previous=previous, next=next, asc_order=asc_order)

Get audit logs

This endpoint returns a portion of the audit logs, as well as paging information that can be used to navigate the audit log results.  This endpoint requires administrator access.  This endpoint uses keyset pagination. The [Keyset Pagination](../cookbook/pagination/#keyset-pagination) recipe in the Posit Connect API Cookbook has example code for fetching multiple pages.

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
api_instance = connectapi.AuditLogsApi(connectapi.ApiClient(configuration))
limit = 20 # int | Number of logs to return. The minimum supported value is 1 and maximum supported value is 500. Note that `limit` is a \"best effort\" request since there may not be enough logs to satisfy the limit. (optional) (default to 20)
previous = 'previous_example' # str | Gets the previous page of audit logs relative to the given id. (optional)
next = 'next_example' # str | Gets the next page of audit logs relative to the given id. (optional)
asc_order = true # bool | Whether the audit logs should be listed in ascending order (optional) (default to true)

try:
    # Get audit logs
    api_response = api_instance.get_audit_logs(limit=limit, previous=previous, next=next, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling AuditLogsApi->get_audit_logs: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Number of logs to return. The minimum supported value is 1 and maximum supported value is 500. Note that &#x60;limit&#x60; is a \&quot;best effort\&quot; request since there may not be enough logs to satisfy the limit. | [optional] [default to 20]
 **previous** | **str**| Gets the previous page of audit logs relative to the given id. | [optional] 
 **next** | **str**| Gets the next page of audit logs relative to the given id. | [optional] 
 **asc_order** | **bool**| Whether the audit logs should be listed in ascending order | [optional] [default to true]

### Return type

[**AuditLogs**](AuditLogs.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

