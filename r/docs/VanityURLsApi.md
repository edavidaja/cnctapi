# VanityURLsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteVanity**](VanityURLsApi.md#DeleteVanity) | **DELETE** /v1/content/{guid}/vanity | Delete vanity URL
[**GetVanity**](VanityURLsApi.md#GetVanity) | **GET** /v1/content/{guid}/vanity | Get vanity URL
[**ListVanities**](VanityURLsApi.md#ListVanities) | **GET** /v1/vanities | List vanity URLs
[**SetVanity**](VanityURLsApi.md#SetVanity) | **PUT** /v1/content/{guid}/vanity | Set vanity URL


# **DeleteVanity**
> DeleteVanity(guid)

Delete vanity URL

Delete the vanity URL for this content.  If `Authorization.PublishersCanManageVanities` is `true`, publishers can delete the vanity URL for content items that they have permission to change. Otherwise, administrator permissions are required.

### Example
```R
library(connectapi2)

# Delete vanity URL
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 

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
| **204** | Returned when the vanity URL was successfully removed. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetVanity**
> GetVanity200Response GetVanity(guid)

Get vanity URL

Get the vanity URL, if any, defined for this content. If the content item has a vanity URL, it is returned. If there is no vanity URL for this content, a 404 status is returned.  Administrators can get the vanity URL for any content item. Any authenticated user who is authorized to view the content can get the vanity URL.

### Example
```R
library(connectapi2)

# Get vanity URL
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 

### Return type

[**GetVanity200Response**](getVanity_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The vanity URL definition for this content item, if any. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListVanities**
> array[ListVanities200ResponseInner] ListVanities()

List vanity URLs

List all defined vanity URLs.  You must have administrator privileges to perform this action.

### Example
```R
library(connectapi2)

# List vanity URLs
#

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**array[ListVanities200ResponseInner]**](listVanities_200_response_inner.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | An array containing all defined vanity URLs. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **SetVanity**
> SetVanity200Response SetVanity(guid, vanity)

Set vanity URL

Set the vanity URL for this content item.  A vanity URL path must meet certain requirements:  *   It must consist of alphanumeric characters, hyphens, underscores,     and slashes.  *   It cannot be a reserved path such as the root path `/`, or a path     beginning with `/__`.      *   The following path prefixes are prohibited:      * `/__`     * `/favicon.ico`     * `/connect`     * `/apps`     * `/users`     * `/groups`     * `/setpassword`     * `/user-completion`     * `/confirm`     * `/recent`     * `/reports`     * `/plots`     * `/unpublished`     * `/settings`     * `/metrics`     * `/tokens`     * `/help`     * `/login`     * `/welcome`     * `/register`     * `/resetpassword`     * `/content`     * _The custom location for the Connect dashboard, configured by [`Server.DashboardPath`](../appendix/configuration/#Server.DashboardPath)._  *   It cannot be an ancestor or descendant of an existing vanity URL     path. For example, if the vanity path `/a/b/` exists, you cannot     add `/a/` or `/a/b/c/`.  If `Authorization.PublishersCanManageVanities` is `true`, publishers can set the vanity URL for content items that they have permission to change. Otherwise, administrator permissions are required.  You can reassign an existing vanity URL to a different content item, if you are an administrator or collaborator/owner of both content items. You must set the `force` parameter to `true` to reassign a URL. An error will be returned if `force` is `false` and the URL already exists.

### Example
```R
library(connectapi2)

# Set vanity URL
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_vanity <- setVanity_request$new("path_example", "force_example") # SetVanityRequest | The vanity URL definition to apply to this content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **vanity** | [**SetVanityRequest**](SetVanityRequest.md)| The vanity URL definition to apply to this content item. | 

### Return type

[**SetVanity200Response**](setVanity_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The vanity URL definition that was created or updated. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **409** | The request could not be completed due to a conflict. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

