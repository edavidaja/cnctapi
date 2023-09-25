# connectapi.BundlesV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_bundle**](BundlesV1ExperimentalApi.md#delete_bundle) | **DELETE** /v1/experimental/bundles/{id} | Delete bundle
[**download_bundle**](BundlesV1ExperimentalApi.md#download_bundle) | **GET** /v1/experimental/bundles/{id}/download | Download the bundle archive
[**get_bundle**](BundlesV1ExperimentalApi.md#get_bundle) | **GET** /v1/experimental/bundles/{id} | Get bundle details
[**get_bundles**](BundlesV1ExperimentalApi.md#get_bundles) | **GET** /v1/experimental/content/{guid}/bundles | List bundles

# **delete_bundle**
> delete_bundle(id)

Delete bundle

Delete a specific bundle.  Bundle deletion is permitted by authorized clients with collaborator rights.  On-disk data and database records are removed as a consequence of this call. Deletion is not allowed while the bundle is still active.

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
api_instance = connectapi.BundlesV1ExperimentalApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Delete bundle
    api_instance.delete_bundle(id)
except ApiException as e:
    print("Exception when calling BundlesV1ExperimentalApi->delete_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the desired bundle. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **download_bundle**
> str download_bundle(id)

Download the bundle archive

Download a deployment bundle.  Bundle download is permitted by authorized clients with collaborator rights.  Download a `gzip` compressed `tar` archive (`.tar.gz`) containing the code/data from one deployment of the associated content.  See the  <a href=\"#post-/v1/experimental/content/-guid-/upload\">POST /v1/experimental/content/{guid}/upload</a> endpoint for details about the construction of bundle archives.

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
api_instance = connectapi.BundlesV1ExperimentalApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Download the bundle archive
    api_response = api_instance.download_bundle(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesV1ExperimentalApi->download_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the desired bundle. | 

### Return type

**str**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_bundle**
> BundleV1Exp get_bundle(id)

Get bundle details

Get detailed information about a specific bundle.  Bundle reads are permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.

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
api_instance = connectapi.BundlesV1ExperimentalApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Get bundle details
    api_response = api_instance.get_bundle(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesV1ExperimentalApi->get_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the desired bundle. | 

### Return type

[**BundleV1Exp**](BundleV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_bundles**
> BundlesV1Exp get_bundles(guid, page_number=page_number, page_size=page_size)

List bundles

List bundles associated with a specific content item.  Bundle enumeration is permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.  Results are sorted by ID.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.

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
api_instance = connectapi.BundlesV1ExperimentalApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
page_number = 1 # int | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. (optional) (default to 1)
page_size = 20 # int | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough bundles to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (optional) (default to 20)

try:
    # List bundles
    api_response = api_instance.get_bundles(guid, page_number=page_number, page_size=page_size)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesV1ExperimentalApi->get_bundles: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **page_number** | **int**| The page to return relative to the given &#x60;page_size&#x60;. If &#x60;page_number&#x60; is 0 or negative, an error will be returned. | [optional] [default to 1]
 **page_size** | **int**| The number of items to include in each page. This parameter is \&quot;best effort\&quot; since there may not be enough bundles to honor the request. If &#x60;page_size&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]

### Return type

[**BundlesV1Exp**](BundlesV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

