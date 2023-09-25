# BundlesV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteBundle**](BundlesV1ExperimentalApi.md#DeleteBundle) | **DELETE** /v1/experimental/bundles/{id} | Delete bundle
[**DownloadBundle**](BundlesV1ExperimentalApi.md#DownloadBundle) | **GET** /v1/experimental/bundles/{id}/download | Download the bundle archive
[**GetBundle**](BundlesV1ExperimentalApi.md#GetBundle) | **GET** /v1/experimental/bundles/{id} | Get bundle details
[**GetBundles**](BundlesV1ExperimentalApi.md#GetBundles) | **GET** /v1/experimental/content/{guid}/bundles | List bundles


# **DeleteBundle**
> DeleteBundle(id)

Delete bundle

Delete a specific bundle.  Bundle deletion is permitted by authorized clients with collaborator rights.  On-disk data and database records are removed as a consequence of this call. Deletion is not allowed while the bundle is still active.

### Example
```R
library(connectapi2)

# Delete bundle
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the desired bundle. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **204** | Returned when the bundle was successfully removed. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DownloadBundle**
> data.frame DownloadBundle(id)

Download the bundle archive

Download a deployment bundle.  Bundle download is permitted by authorized clients with collaborator rights.  Download a `gzip` compressed `tar` archive (`.tar.gz`) containing the code/data from one deployment of the associated content.  See the  <a href=\"#post-/v1/experimental/content/-guid-/upload\">POST /v1/experimental/content/{guid}/upload</a> endpoint for details about the construction of bundle archives.

### Example
```R
library(connectapi2)

# Download the bundle archive
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the desired bundle. | 

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
| **200** | A &#x60;gzip&#x60; compressed &#x60;tar&#x60; archive file. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetBundle**
> BundleV1Exp GetBundle(id)

Get bundle details

Get detailed information about a specific bundle.  Bundle reads are permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.

### Example
```R
library(connectapi2)

# Get bundle details
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the desired bundle. | 

### Return type

[**BundleV1Exp**](BundleV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The bundle details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetBundles**
> BundlesV1Exp GetBundles(guid, page_number = 1, page_size = 20)

List bundles

List bundles associated with a specific content item.  Bundle enumeration is permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.  Results are sorted by ID.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.

### Example
```R
library(connectapi2)

# List bundles
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_page_number <- 1 # integer | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. (Optional)
var_page_size <- 20 # integer | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough bundles to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **page_number** | **integer**| The page to return relative to the given &#x60;page_size&#x60;. If &#x60;page_number&#x60; is 0 or negative, an error will be returned. | [optional] [default to 1]
 **page_size** | **integer**| The number of items to include in each page. This parameter is \&quot;best effort\&quot; since there may not be enough bundles to honor the request. If &#x60;page_size&#x60; is less than 1 or greater than 500, an error will be returned. | [optional] [default to 20]

### Return type

[**BundlesV1Exp**](BundlesV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of bundles. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

