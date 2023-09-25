# TagsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**AddTag**](TagsApi.md#AddTag) | **POST** /v1/content/{guid}/tags | Add tag to content
[**CreateTag**](TagsApi.md#CreateTag) | **POST** /v1/tags | Create tag
[**DeleteTag**](TagsApi.md#DeleteTag) | **DELETE** /v1/tags/{id} | Delete tag
[**GetTag**](TagsApi.md#GetTag) | **GET** /v1/tags/{id} | Get tag
[**GetTagByPath**](TagsApi.md#GetTagByPath) | **GET** /v1/tags/{path} | Get tag by path
[**ListContentTags**](TagsApi.md#ListContentTags) | **GET** /v1/content/{guid}/tags | List tags for content
[**ListTagContent**](TagsApi.md#ListTagContent) | **GET** /v1/tags/{id}/content | List content for tags
[**ListTags**](TagsApi.md#ListTags) | **GET** /v1/tags | List tags
[**RemoveTag**](TagsApi.md#RemoveTag) | **DELETE** /v1/content/{guid}/tags/{id} | Remove tag from content
[**UpdateTag**](TagsApi.md#UpdateTag) | **PATCH** /v1/tags/{id} | Update tag


# **AddTag**
> array[Tag] AddTag(guid, tag)

Add tag to content

Add the specified tag to an individual content item. When adding a tag, all tags above the specified tag in the tag tree are also added to the content item.  Authenticated access required from an admin or from a user with collaborator/editor permissions on the content item.

### Example
```R
library(connectapi2)

# Add tag to content
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the content item.
var_tag <- addTag_request$new("tag_id_example") # AddTagRequest | The request body specifies which tag to add

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the content item. | 
 **tag** | [**AddTagRequest**](AddTagRequest.md)| The request body specifies which tag to add | 

### Return type

[**array[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Empty content on success |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **CreateTag**
> Tag CreateTag(tag)

Create tag

Create a new tag. Tags without a parent are considered tag \"categories\" and are used to organize other tags. Note that tag categories cannot be added to content items.  Authenticated access from a user having an \"administrator\" role is required.

### Example
```R
library(connectapi2)

# Create tag
#
# prepare function argument(s)
var_tag <- createTag_request$new("name_example", "parent_id_example") # CreateTagRequest | The request body required when creating a new tag.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag** | [**CreateTagRequest**](CreateTagRequest.md)| The request body required when creating a new tag. | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The newly created tag |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeleteTag**
> DeleteTag(id)

Delete tag

Deletes a tag, including all descendants in its own tag hierarchy.  Authenticated access from a user having an \"administrator\" role is required.

### Example
```R
library(connectapi2)

# Delete tag
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the tag.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the tag. | 

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
| **204** | No content on success |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetTag**
> Tag GetTag(id)

Get tag

Get an individual tag  Authenticated access from a user is required.

### Example
```R
library(connectapi2)

# Get tag
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the tag

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the tag | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested tag |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetTagByPath**
> Tag GetTagByPath(path)

Get tag by path

Get an individual tag by a comma-delimited \"path\" to the tag. The path to the tag is the series of tag names to traverse the tag hierarchy, starting with a tag category.  Authenticated access from a user is required.

### Example
```R
library(connectapi2)

# Get tag by path
#
# prepare function argument(s)
var_path <- "path_example" # character | The path to the tag, as comma-delimited names

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **character**| The path to the tag, as comma-delimited names | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested tag |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListContentTags**
> array[Tag] ListContentTags(guid)

List tags for content

List of all tags for the specified content item  Authenticated access required from an admin or from a user with at least viewer permissions on the content item.

### Example
```R
library(connectapi2)

# List tags for content
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the content item. | 

### Return type

[**array[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of tags |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListTagContent**
> array[Content] ListTagContent(id)

List content for tags

List all of the content for the specified tag.  Authenticated access from a user is required. If an \"administrator\" role is used, then all content items will be returned regardless of the visibility to the requesting user.  Note that R or Python version information is only provided to clients that authenticate as admin or publisher users; it is suppressed for viewers.

### Example
```R
library(connectapi2)

# List content for tags
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the tag.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the tag. | 

### Return type

[**array[Content]**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of content |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **ListTags**
> array[Tag] ListTags(parent_id = var.parent_id, name = var.name)

List tags

List of all tags.  Authenticated access from a user is required.

### Example
```R
library(connectapi2)

# List tags
#
# prepare function argument(s)
var_parent_id <- "parent_id_example" # character | The unique identifier of the parent tag (Optional)
var_name <- "name_example" # character | The tag name  Note: tag names are only unique within the scope of a parent, which means that it is possible to have multiple results when querying by name; however, querying by both `name` and `parent_id` ensures a single result. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent_id** | **character**| The unique identifier of the parent tag | [optional] 
 **name** | **character**| The tag name  Note: tag names are only unique within the scope of a parent, which means that it is possible to have multiple results when querying by name; however, querying by both &#x60;name&#x60; and &#x60;parent_id&#x60; ensures a single result. | [optional] 

### Return type

[**array[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of all tags |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **RemoveTag**
> array[Tag] RemoveTag(guid, id)

Remove tag from content

Remove the specified tag from an individual content item. When removing a tag, all children and descendant tags are also removed from the content item.  Authenticated access required from an admin or from a user with collaborator/editor permissions on the content item.

### Example
```R
library(connectapi2)

# Remove tag from content
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the content item.
var_id <- "id_example" # character | The unique identifier of the tag.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the content item. | 
 **id** | **character**| The unique identifier of the tag. | 

### Return type

[**array[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | Empty content on success |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateTag**
> Tag UpdateTag(id, tag)

Update tag

Update an existing tag.  Authenticated access from a user having an \"administrator\" role is required.

### Example
```R
library(connectapi2)

# Update tag
#
# prepare function argument(s)
var_id <- "id_example" # character | The unique identifier of the tag.
var_tag <- updateTag_request$new("name_example", "parent_id_example") # UpdateTagRequest | The request body required when updating an existing tag.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **character**| The unique identifier of the tag. | 
 **tag** | [**UpdateTagRequest**](UpdateTagRequest.md)| The request body required when updating an existing tag. | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The updated tag |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

