# connectapi.InstrumentationApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_content_visits**](InstrumentationApi.md#get_content_visits) | **GET** /v1/instrumentation/content/visits | Get Content Visits
[**get_shiny_app_usage**](InstrumentationApi.md#get_shiny_app_usage) | **GET** /v1/instrumentation/shiny/usage | Get Shiny App Usage

# **get_content_visits**
> ContentVisitLogs get_content_visits(content_guid=content_guid, min_data_version=min_data_version, _from=_from, to=to, limit=limit, previous=previous, next=next, asc_order=asc_order)

Get Content Visits

This endpoint returns a portion of the visit (or \"hits\") information for all content types _other than Shiny applications_. The results returned include paging details that can be used to navigate the information this endpoint returns.  The information returned is based on data collected by Posit Connect as users visit content.  #### Important Notes Prior to the release of this API, there was an issue with how visits were returned that caused extra entries to be stored under certain circumstances.  These will affect analyses that interpret visit counts.  Entries that were recorded before the issue was addressed are not returned by default.  If you desire these records, specify the `min_data_version` filter with a value of 0.  This endpoint requires administrator or publisher access.  #### Filtering of results:  There are several ways the result set can be filtered by the server before being sent back within the API response. If multiple filters are in effect, they will be logically ANDed together.  ##### Implicit Filtering If the user calling the endpoint is a publisher, the data returned will be limited to the content owned by the user.  ##### Time Windows  This API accepts optional `from` and `to` timestamps to define a window of interest.  If `from` is not specified, it is assumed to be before the earliest recorded information.  If `to` is not specified, it is assumed to be \"now\".  Any visit to content that falls inclusively within the time window will be part of the result set.  #### Responses  The response of a call will contain zero or more data records representing a visit by a user to a piece of content.  No more than `limit` records will be returned. Multiple requests of this endpoint are typically required to retrieve the complete result set from the server.  To facilitate this, each response includes a paging object containing full URL links which can be requested to iteratively move forward or backward through multiple response pages.

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
api_instance = connectapi.InstrumentationApi(connectapi.ApiClient(configuration))
content_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | Filter results by content GUID.  This parameter will limit the results to include only the access records for content matching the content GUID filter value.  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.  Multiple content GUIDs may be specified using the bar character `|` which represents a logical OR across the surounding GUIDs.  For example, `content_guid=6f300623-1e0c-48e6-a473-ddf630c0c0c3|e08a86af-a262-4152-8366-f2d8ec3c54f9` will filter the result set to only the access records for content with a GUID of `6f300623-1e0c-48e6-a473-ddf630c0c0c3` or a GUID of `e08a86af-a262-4152-8366-f2d8ec3c54f9`.  - The GUID associated with published content can be found on the Info panel for   the content within the Posit Connect Dashboard window. - Note that if you specify the `content_guid` more than once like this,   `content_guid=6f300623-1e0c-48e6-a473-ddf630c0c0c3&content_guid=&e08a86af-a262-4152-8366-f2d8ec3c54f9`   you will receive results for the first GUID only; the 2nd and subsequent `content_guid`   fields are ignored. - Note that there is a practical limit of around 40 to the number of GUIDs that   may be specified due to the length of a html query string. (optional)
min_data_version = 1 # int | Filter by data version.  Records with a data version lower than the given value will be excluded from the set of results.  The [Content Visit Events](../admin/historical-information/#content-visit-events) section of the Posit Connect Admin Guide explains how to interpret `data_version` values. (optional) (default to 1)
_from = '2013-10-20T19:20:30+01:00' # datetime | The timestamp that starts the time window of interest.  Any visit information that happened prior to this timestamp will not be returned.  Example value = `2018-09-15T18:00:00Z` using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (`yyyy-mm-ddThh:mm:ss` followed by either `-##:##`, `.##Z` or `Z`) (optional)
to = '2013-10-20T19:20:30+01:00' # datetime | The timestamp that ends the time window of interest.  Any visit information that happened after this timestamp will not be returned.  Example value = `2018-09-15T18:00:00Z` using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (`yyyy-mm-ddThh:mm:ss` followed by either `-##:##`, `.##Z` or `Z`) (optional)
limit = 20 # int | The number of records to return.  The minimum supported value is 1 and maximum supported value is 500.  Note that `limit` is a \"best effort\" request since there may not be enough visit entries to satisfy the limit. (optional) (default to 20)
previous = 'previous_example' # str | Retrieve the previous page of content visit logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. (optional)
next = 'next_example' # str | Retrieve the next page of content visit logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. (optional)
asc_order = true # bool | Determines if the response records should be listed in ascending or descending order within the response.  Ordering is by the `started` timestamp field. (optional) (default to true)

try:
    # Get Content Visits
    api_response = api_instance.get_content_visits(content_guid=content_guid, min_data_version=min_data_version, _from=_from, to=to, limit=limit, previous=previous, next=next, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling InstrumentationApi->get_content_visits: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **content_guid** | [**str**](.md)| Filter results by content GUID.  This parameter will limit the results to include only the access records for content matching the content GUID filter value.  Example value &#x3D; &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.  Multiple content GUIDs may be specified using the bar character &#x60;|&#x60; which represents a logical OR across the surounding GUIDs.  For example, &#x60;content_guid&#x3D;6f300623-1e0c-48e6-a473-ddf630c0c0c3|e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60; will filter the result set to only the access records for content with a GUID of &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; or a GUID of &#x60;e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60;.  - The GUID associated with published content can be found on the Info panel for   the content within the Posit Connect Dashboard window. - Note that if you specify the &#x60;content_guid&#x60; more than once like this,   &#x60;content_guid&#x3D;6f300623-1e0c-48e6-a473-ddf630c0c0c3&amp;content_guid&#x3D;&amp;e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60;   you will receive results for the first GUID only; the 2nd and subsequent &#x60;content_guid&#x60;   fields are ignored. - Note that there is a practical limit of around 40 to the number of GUIDs that   may be specified due to the length of a html query string. | [optional] 
 **min_data_version** | **int**| Filter by data version.  Records with a data version lower than the given value will be excluded from the set of results.  The [Content Visit Events](../admin/historical-information/#content-visit-events) section of the Posit Connect Admin Guide explains how to interpret &#x60;data_version&#x60; values. | [optional] [default to 1]
 **_from** | **datetime**| The timestamp that starts the time window of interest.  Any visit information that happened prior to this timestamp will not be returned.  Example value &#x3D; &#x60;2018-09-15T18:00:00Z&#x60; using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (&#x60;yyyy-mm-ddThh:mm:ss&#x60; followed by either &#x60;-##:##&#x60;, &#x60;.##Z&#x60; or &#x60;Z&#x60;) | [optional] 
 **to** | **datetime**| The timestamp that ends the time window of interest.  Any visit information that happened after this timestamp will not be returned.  Example value &#x3D; &#x60;2018-09-15T18:00:00Z&#x60; using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (&#x60;yyyy-mm-ddThh:mm:ss&#x60; followed by either &#x60;-##:##&#x60;, &#x60;.##Z&#x60; or &#x60;Z&#x60;) | [optional] 
 **limit** | **int**| The number of records to return.  The minimum supported value is 1 and maximum supported value is 500.  Note that &#x60;limit&#x60; is a \&quot;best effort\&quot; request since there may not be enough visit entries to satisfy the limit. | [optional] [default to 20]
 **previous** | **str**| Retrieve the previous page of content visit logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. | [optional] 
 **next** | **str**| Retrieve the next page of content visit logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. | [optional] 
 **asc_order** | **bool**| Determines if the response records should be listed in ascending or descending order within the response.  Ordering is by the &#x60;started&#x60; timestamp field. | [optional] [default to true]

### Return type

[**ContentVisitLogs**](ContentVisitLogs.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_shiny_app_usage**
> ShinyAppUsageLogs get_shiny_app_usage(content_guid=content_guid, min_data_version=min_data_version, _from=_from, to=to, limit=limit, previous=previous, next=next, asc_order=asc_order)

Get Shiny App Usage

This endpoint returns a portion of the Shiny application usage information, as well as paging details that can be used to navigate that information.  The information returned is based on data collected by Posit Connect as users visit Shiny applications.  Because of how visits are detected, end times will be slightly inflated by a reconnect timeout, generally around 15 seconds.  #### Important Notes  Prior to the release of this API, there was an issue with how visits were recorded that caused extra entries to be stored.  These will affect analyses that interpret visit counts or durations.  Entries that were recorded before the issue was addressed are not returned by default.  If you desire these records, specify the `min_data_version` filter with a value of 0.  - Because of how visits are detected, end times will be slightly inflated by the   currently configured client reconnect timeout, which defaults to 15 seconds.   The ending time may also be affected by connect and read timeout   settings.    The [Shiny Application   Events](../admin/historical-information/#shiny-application-events)   section of the Posit Connect Admin Guide has more details about   how these events are collected. - This endpoint requires administrator or publisher access.  #### Filtering of results:  There are several ways the result set can be filtered by the server before being sent back within the API response. If multiple filters are in effect, they will be logically ANDed together.  ##### Implicit Filtering  If the user calling the endpoint is a publisher, the data returned will be limited to those applications owned by the user.  ##### Time Windows  This API accepts optional `from` and `to` timestamps to define a window of interest.  If `from` is not specified, it is assumed to be before the earliest recorded information.  If `to` is not specified, it is assumed to be \"now\".  Any visit to content that falls inclusively within the time window will be part of the result set.  #### Responses  The response of a call will contain zero or more data records representing a session by a user of a Shiny application.  No more than `limit` records will be returned. Multiple requests of this endpoint are typically required to retrieve the complete result set from the server.  To facilitate this, each response includes a paging object containing full URL links which can be requested to iteratively move forward or backward through multiple response pages.

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
api_instance = connectapi.InstrumentationApi(connectapi.ApiClient(configuration))
content_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | Filter results by content GUID.  This parameter will limit the results to include only the access records for the Shiny application(s) matching the content GUID filter value.  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.  Multiple content GUIDs may be specified using the bar character `|` which represents a logical OR across the surounding GUIDs.  For example, `content_guid=6f300623-1e0c-48e6-a473-ddf630c0c0c3|e08a86af-a262-4152-8366-f2d8ec3c54f9` will filter the result set to only the access records for the Shiny Applications with a GUID of `6f300623-1e0c-48e6-a473-ddf630c0c0c3` or a GUID of `e08a86af-a262-4152-8366-f2d8ec3c54f9`.  - The GUID associated with a published Shiny application can be found on the   Info panel for the application within the Posit Connect Dashboard window. - Note that if you specify the `content_guid` more than once like this,   `content_guid=6f300623-1e0c-48e6-a473-ddf630c0c0c3&content_guid=&e08a86af-a262-4152-8366-f2d8ec3c54f9`   you will receive results for the first GUID only; the 2nd and subsequent `content_guid`   fields are ignored. - Note that there is a practical limit of around 40 to the number of GUIDs that   may be specified due to the length of a html query string. (optional)
min_data_version = 1 # int | Filter by data version.  Records with a data version lower than the given value will be excluded from the set of results.  The [Shiny Application Events](../admin/historical-information/#shiny-application-events) section of the Posit Connect Admin Guide explains how to interpret `data_version` values. (optional) (default to 1)
_from = '2013-10-20T19:20:30+01:00' # datetime | The timestamp that starts the time window of interest.  Any usage information that _ends_ prior to this timestamp will not be returned.  Individual records may contain a starting time that is before this if they end after it or have not finished.  Example value = `2018-09-15T18:00:00Z` using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (`yyyy-mm-ddThh:mm:ss` followed by either `-##:##`, `.##Z` or `Z`) (optional)
to = '2013-10-20T19:20:30+01:00' # datetime | The timestamp that ends the time window of interest.  Any usage information that _starts_ after this timestamp will not be returned.  Individual records may contain an ending time that is after this (or no ending time) if they start before it.  Example value = `2018-09-15T18:00:00Z` using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (`yyyy-mm-ddThh:mm:ss` followed by either `-##:##`, `.##Z` or `Z`) (optional)
limit = 20 # int | The number of records to return.  The minimum supported value is 1 and maximum supported value is 500.  Note that `limit` is a \"best effort\" request since there may not be enough usage entries to satisfy the limit. (optional) (default to 20)
previous = 'previous_example' # str | Retrieve the previous page of Shiny application usage logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. (optional)
next = 'next_example' # str | Retrieve the next page of Shiny application usage logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. (optional)
asc_order = true # bool | Determines if the response records should be listed in ascending or descending order within the response.  Ordering is by the `started` timestamp field. (optional) (default to true)

try:
    # Get Shiny App Usage
    api_response = api_instance.get_shiny_app_usage(content_guid=content_guid, min_data_version=min_data_version, _from=_from, to=to, limit=limit, previous=previous, next=next, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling InstrumentationApi->get_shiny_app_usage: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **content_guid** | [**str**](.md)| Filter results by content GUID.  This parameter will limit the results to include only the access records for the Shiny application(s) matching the content GUID filter value.  Example value &#x3D; &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format.  Multiple content GUIDs may be specified using the bar character &#x60;|&#x60; which represents a logical OR across the surounding GUIDs.  For example, &#x60;content_guid&#x3D;6f300623-1e0c-48e6-a473-ddf630c0c0c3|e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60; will filter the result set to only the access records for the Shiny Applications with a GUID of &#x60;6f300623-1e0c-48e6-a473-ddf630c0c0c3&#x60; or a GUID of &#x60;e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60;.  - The GUID associated with a published Shiny application can be found on the   Info panel for the application within the Posit Connect Dashboard window. - Note that if you specify the &#x60;content_guid&#x60; more than once like this,   &#x60;content_guid&#x3D;6f300623-1e0c-48e6-a473-ddf630c0c0c3&amp;content_guid&#x3D;&amp;e08a86af-a262-4152-8366-f2d8ec3c54f9&#x60;   you will receive results for the first GUID only; the 2nd and subsequent &#x60;content_guid&#x60;   fields are ignored. - Note that there is a practical limit of around 40 to the number of GUIDs that   may be specified due to the length of a html query string. | [optional] 
 **min_data_version** | **int**| Filter by data version.  Records with a data version lower than the given value will be excluded from the set of results.  The [Shiny Application Events](../admin/historical-information/#shiny-application-events) section of the Posit Connect Admin Guide explains how to interpret &#x60;data_version&#x60; values. | [optional] [default to 1]
 **_from** | **datetime**| The timestamp that starts the time window of interest.  Any usage information that _ends_ prior to this timestamp will not be returned.  Individual records may contain a starting time that is before this if they end after it or have not finished.  Example value &#x3D; &#x60;2018-09-15T18:00:00Z&#x60; using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (&#x60;yyyy-mm-ddThh:mm:ss&#x60; followed by either &#x60;-##:##&#x60;, &#x60;.##Z&#x60; or &#x60;Z&#x60;) | [optional] 
 **to** | **datetime**| The timestamp that ends the time window of interest.  Any usage information that _starts_ after this timestamp will not be returned.  Individual records may contain an ending time that is after this (or no ending time) if they start before it.  Example value &#x3D; &#x60;2018-09-15T18:00:00Z&#x60; using [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format of (&#x60;yyyy-mm-ddThh:mm:ss&#x60; followed by either &#x60;-##:##&#x60;, &#x60;.##Z&#x60; or &#x60;Z&#x60;) | [optional] 
 **limit** | **int**| The number of records to return.  The minimum supported value is 1 and maximum supported value is 500.  Note that &#x60;limit&#x60; is a \&quot;best effort\&quot; request since there may not be enough usage entries to satisfy the limit. | [optional] [default to 20]
 **previous** | **str**| Retrieve the previous page of Shiny application usage logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. | [optional] 
 **next** | **str**| Retrieve the next page of Shiny application usage logs relative to the provided value.  This value corresponds to an internal reference within the server and should be sourced from the appropriate attribute within the paging object of a previous response. | [optional] 
 **asc_order** | **bool**| Determines if the response records should be listed in ascending or descending order within the response.  Ordering is by the &#x60;started&#x60; timestamp field. | [optional] [default to true]

### Return type

[**ShinyAppUsageLogs**](ShinyAppUsageLogs.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

