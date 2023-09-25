# ContentApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**BuildContentBundle**](ContentApi.md#BuildContentBundle) | **POST** /v1/content/{guid}/build | Build deployment bundle
[**CreateContent**](ContentApi.md#CreateContent) | **POST** /v1/content | Create content item
[**DeleteContent**](ContentApi.md#DeleteContent) | **DELETE** /v1/content/{guid} | Delete content
[**DeployContentBundle**](ContentApi.md#DeployContentBundle) | **POST** /v1/content/{guid}/deploy | Deploy deployment bundle
[**GetContent**](ContentApi.md#GetContent) | **GET** /v1/content/{guid} | Get content details
[**GetContentEnvironment**](ContentApi.md#GetContentEnvironment) | **GET** /v1/content/{guid}/environment | Get environment variables
[**GetContents**](ContentApi.md#GetContents) | **GET** /v1/content | List content items
[**SetContentEnvironment**](ContentApi.md#SetContentEnvironment) | **PUT** /v1/content/{guid}/environment | Set all environment variables
[**UpdateContent**](ContentApi.md#UpdateContent) | **PATCH** /v1/content/{guid} | Update content
[**UpdateContentEnvironment**](ContentApi.md#UpdateContentEnvironment) | **PATCH** /v1/content/{guid}/environment | Update environment variables


# **BuildContentBundle**
> BuildContentBundle200Response BuildContentBundle(guid, instructions = var.instructions)

Build deployment bundle

Build (restore) a deployment bundle.  Build requests spawn an asynchronous task to make your previously uploaded data ready for rendering or running. Content will have its environment reconstructed, e.g. by using the packrat R package to install R package dependencies, but documents will not be re-rendered.  Building is intended to facilitate server changes or migrations that may require re-installing R packages or other dependencies.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/tasks/-id-\">GET /v1/tasks/{id}</a> endpoint to track the progress of this task.

### Example
```R
library(connectapi2)

# Build deployment bundle
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_instructions <- buildContentBundle_request$new("bundle_id_example") # BuildContentBundleRequest | The request body when requesting the building of a specific bundle. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **instructions** | [**BuildContentBundleRequest**](BuildContentBundleRequest.md)| The request body when requesting the building of a specific bundle. | [optional] 

### Return type

[**BuildContentBundle200Response**](buildContentBundle_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested build task. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **CreateContent**
> Content CreateContent(content)

Create content item

Create a new content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.

### Example
```R
library(connectapi2)

# Create content item
#
# prepare function argument(s)
var_content <- createContent_request$new("name_example", "title_example", "description_example", "all", 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, "run_as_example", "run_as_current_user_example", "default_image_name_example", "default_r_environment_management_example", "default_py_environment_management_example", "service_account_name_example") # CreateContentRequest | The request body required when creating a new content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **content** | [**CreateContentRequest**](CreateContentRequest.md)| The request body required when creating a new content item. | 

### Return type

[**Content**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The details for the newly created content. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeleteContent**
> DeleteContent(guid)

Delete content

Delete a specific content item.  On-disk data and database records are removed as a consequence of this call.

### Example
```R
library(connectapi2)

# Delete content
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
| **204** | Returned when the content was successfully removed. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **DeployContentBundle**
> DeployContentBundle202Response DeployContentBundle(guid, instructions = var.instructions)

Deploy deployment bundle

Deploy (activate) a deployment bundle.  Deployment requests spawn an asynchronous task to make your previously uploaded data available for serving. The workflow applied to the bundled files varies depending on the type of content.  Executable content has its environment reconstructed. This includes using the packrat R package to install R package dependencies.  Documents (R Markdown reports, Jupyter Notebooks, static Quarto content) are rendered and the result made available.  Interactive content (applications and APIs) are available to be launched on the next client visit.  The deployment workflow for static content (HTML, plots) is lighter-weight than for executable content. File time-stamps are updated to ensure that browsers do not cache previous results and instead see the newly promoted files.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/tasks/-id-\">GET /v1/tasks/{id}</a> endpoint to track the progress of this task.

### Example
```R
library(connectapi2)

# Deploy deployment bundle
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_instructions <- deployContentBundle_request$new("bundle_id_example") # DeployContentBundleRequest | The request body when requesting the deployment of a bundle. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **instructions** | [**DeployContentBundleRequest**](DeployContentBundleRequest.md)| The request body when requesting the deployment of a bundle. | [optional] 

### Return type

[**DeployContentBundle202Response**](deployContentBundle_202_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **202** | The deployment task which can be queried to monitor the deployment status. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetContent**
> Content GetContent(guid)

Get content details

Get detailed information about a specific content item.  Unauthenticated clients are rejected regardless of the content access type.  Authorized, non-administrator clients without viewership rights to this content are rejected.  Authorized, administrator clients without viewership rights are permitted to obtain information about this content. The computed `role` for these users will be `none`, representing that these users cannot view the content itself.  Authorized clients with viewership (or collaborator) rights are permitted to obtain information about this content. The computed `role` for these users will reflect the level of access.  Information about the target environment is populated for users with \"publisher\" and \"administrator\" role; it is suppressed for viewers.

### Example
```R
library(connectapi2)

# Get content details
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

[**Content**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The requested content details. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetContentEnvironment**
> array[character] GetContentEnvironment(guid)

Get environment variables

Get the names of the environment variables defined for this content.  Since environment variables may contain sensitive information, the values are not included in the returned data.

### Example
```R
library(connectapi2)

# Get environment variables
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

**array[character]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The list of environment variable names defined for this content item. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **GetContents**
> array[Content] GetContents(owner_guid = var.owner_guid, name = var.name)

List content items

List all content items visible to the requesting user.  Authenticated access from a user is required. If an \"administrator\" role is used, then all content items will be returned regardless of the visibility to the requesting user.  Information about the target environment is populated for users with \"publisher\" and \"administrator\" role; it is suppressed for viewers.

### Example
```R
library(connectapi2)

# List content items
#
# prepare function argument(s)
var_owner_guid <- "owner_guid_example" # character | The unique identifier of the user who owns the content. (Optional)
var_name <- "name_example" # character | The content name specified when the content was created.  Note: content names are unique within the owning user's account, so a request that specifies a non-empty name and owner_guid will return at most one content item. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **owner_guid** | **character**| The unique identifier of the user who owns the content. | [optional] 
 **name** | **character**| The content name specified when the content was created.  Note: content names are unique within the owning user&#39;s account, so a request that specifies a non-empty name and owner_guid will return at most one content item. | [optional] 

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
| **200** | An array of content items |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **SetContentEnvironment**
> array[character] SetContentEnvironment(guid, environment)

Set all environment variables

Set the environment for this content item. Any existing environment variables will be removed, and the ones in the request will be set.

### Example
```R
library(connectapi2)

# Set all environment variables
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_environment <- c(EnvironmentVariable$new("name_example", "value_example")) # array[EnvironmentVariable] | The environment definition to apply to this content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **environment** | list( [**EnvironmentVariable**](EnvironmentVariable.md) )| The environment definition to apply to this content item. | 

### Return type

**array[character]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The updated list of environment variable names. Since environment variables may contain sensitive information, the values are not included in the returned data. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateContent**
> Content UpdateContent(guid, content)

Update content

Update fields for a specific content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.  Authorized clients with collaborator or administrator rights are permitted to modify content item fields.  Administrators can reassign content ownership by updating the `owner_guid` field. The new owner must have publisher or  administrator rights.

### Example
```R
library(connectapi2)

# Update content
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the content item to update.
var_content <- updateContent_request$new("name_example", "title_example", "description_example", "all", "owner_guid_example", 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, 123, "run_as_example", "run_as_current_user_example", "default_image_name_example", "default_r_environment_management_example", "default_py_environment_management_example", "service_account_name_example") # UpdateContentRequest | The request body required when updating a content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the content item to update. | 
 **content** | [**UpdateContentRequest**](UpdateContentRequest.md)| The request body required when updating a content item. | 

### Return type

[**Content**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The details for the updated content. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **403** | You do not have permission to perform this operation. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

# **UpdateContentEnvironment**
> array[character] UpdateContentEnvironment(guid, environment)

Update environment variables

Add, change, or delete environment variables for this content. Variables present in the request body will be set to the values provided. Variables with a value of `null` will be deleted. Variables not present in the request body will be left unchanged.

### Example
```R
library(connectapi2)

# Update environment variables
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_environment <- c(EnvironmentVariable$new("name_example", "value_example")) # array[EnvironmentVariable] | The environment definition to apply to this content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **environment** | list( [**EnvironmentVariable**](EnvironmentVariable.md) )| The environment definition to apply to this content item. | 

### Return type

**array[character]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The updated list of environment variable names. Since environment variables may contain sensitive information, the values are not included in the returned data. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

