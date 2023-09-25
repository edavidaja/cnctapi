# connectapi.VanityURLsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_vanity**](VanityURLsApi.md#delete_vanity) | **DELETE** /v1/content/{guid}/vanity | Delete vanity URL
[**get_vanity**](VanityURLsApi.md#get_vanity) | **GET** /v1/content/{guid}/vanity | Get vanity URL
[**list_vanities**](VanityURLsApi.md#list_vanities) | **GET** /v1/vanities | List vanity URLs
[**set_vanity**](VanityURLsApi.md#set_vanity) | **PUT** /v1/content/{guid}/vanity | Set vanity URL

# **delete_vanity**
> delete_vanity(guid)

Delete vanity URL

Delete the vanity URL for this content.  If `Authorization.PublishersCanManageVanities` is `true`, publishers can delete the vanity URL for content items that they have permission to change. Otherwise, administrator permissions are required.

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
api_instance = connectapi.VanityURLsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Delete vanity URL
    api_instance.delete_vanity(guid)
except ApiException as e:
    print("Exception when calling VanityURLsApi->delete_vanity: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_vanity**
> InlineResponse2003 get_vanity(guid)

Get vanity URL

Get the vanity URL, if any, defined for this content. If the content item has a vanity URL, it is returned. If there is no vanity URL for this content, a 404 status is returned.  Administrators can get the vanity URL for any content item. Any authenticated user who is authorized to view the content can get the vanity URL.

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
api_instance = connectapi.VanityURLsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Get vanity URL
    api_response = api_instance.get_vanity(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling VanityURLsApi->get_vanity: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_vanities**
> list[InlineResponse2005] list_vanities()

List vanity URLs

List all defined vanity URLs.  You must have administrator privileges to perform this action.

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
api_instance = connectapi.VanityURLsApi(connectapi.ApiClient(configuration))

try:
    # List vanity URLs
    api_response = api_instance.list_vanities()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling VanityURLsApi->list_vanities: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**list[InlineResponse2005]**](InlineResponse2005.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **set_vanity**
> InlineResponse2004 set_vanity(body, guid)

Set vanity URL

Set the vanity URL for this content item.  A vanity URL path must meet certain requirements:  *   It must consist of alphanumeric characters, hyphens, underscores,     and slashes.  *   It cannot be a reserved path such as the root path `/`, or a path     beginning with `/__`.      *   The following path prefixes are prohibited:      * `/__`     * `/favicon.ico`     * `/connect`     * `/apps`     * `/users`     * `/groups`     * `/setpassword`     * `/user-completion`     * `/confirm`     * `/recent`     * `/reports`     * `/plots`     * `/unpublished`     * `/settings`     * `/metrics`     * `/tokens`     * `/help`     * `/login`     * `/welcome`     * `/register`     * `/resetpassword`     * `/content`     * _The custom location for the Connect dashboard, configured by [`Server.DashboardPath`](../appendix/configuration/#Server.DashboardPath)._  *   It cannot be an ancestor or descendant of an existing vanity URL     path. For example, if the vanity path `/a/b/` exists, you cannot     add `/a/` or `/a/b/c/`.  If `Authorization.PublishersCanManageVanities` is `true`, publishers can set the vanity URL for content items that they have permission to change. Otherwise, administrator permissions are required.  You can reassign an existing vanity URL to a different content item, if you are an administrator or collaborator/owner of both content items. You must set the `force` parameter to `true` to reassign a URL. An error will be returned if `force` is `false` and the URL already exists.

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
api_instance = connectapi.VanityURLsApi(connectapi.ApiClient(configuration))
body = connectapi.GuidVanityBody() # GuidVanityBody | The vanity URL definition to apply to this content item.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Set vanity URL
    api_response = api_instance.set_vanity(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling VanityURLsApi->set_vanity: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GuidVanityBody**](GuidVanityBody.md)| The vanity URL definition to apply to this content item. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

