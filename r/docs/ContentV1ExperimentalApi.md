# ContentV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**CreateContent**](ContentV1ExperimentalApi.md#CreateContent) | **POST** /v1/experimental/content | Create content item
[**DeleteContent**](ContentV1ExperimentalApi.md#DeleteContent) | **DELETE** /v1/experimental/content/{guid} | Delete content
[**DeployContentBundle**](ContentV1ExperimentalApi.md#DeployContentBundle) | **POST** /v1/experimental/content/{guid}/deploy | Deploy deployment bundle
[**GetContent**](ContentV1ExperimentalApi.md#GetContent) | **GET** /v1/experimental/content/{guid} | Get content details
[**UpdateContent**](ContentV1ExperimentalApi.md#UpdateContent) | **POST** /v1/experimental/content/{guid} | Update content
[**UploadContentBundle**](ContentV1ExperimentalApi.md#UploadContentBundle) | **POST** /v1/experimental/content/{guid}/upload | Upload deployment bundle


# **CreateContent**
> ContentV1Exp CreateContent(content)

Create content item

Create a new content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.

### Example
```R
library(connectapi2)

# Create content item
#
# prepare function argument(s)
var_content <- createContent_request_1$new("name_example", "title_example", "description_example", "all", 123, 123, 123, 123, 123, 123, 123, 123) # CreateContentRequest1 | The request body required when creating a new content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **content** | [**CreateContentRequest1**](CreateContentRequest1.md)| The request body required when creating a new content item. | 

### Return type

[**ContentV1Exp**](ContentV1Exp.md)

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
> DeployContentBundle200Response DeployContentBundle(guid, instructions = var.instructions)

Deploy deployment bundle

Deploy (activate) a deployment bundle.  Deployment requests spawn an asynchronous task to make your previously uploaded data available for serving. The workflow applied to the bundled files varies depending on the type of content.  Executable content has its environment reconstructed. This includes using the packrat R package to install R package dependencies.  Documents (R Markdown reports, Jupyter Notebooks) are rendered and the result made available.  Interactive content (Shiny applications, Plumber APIs) available to be launched on the next client visit.  The deployment workflow for static content (HTML, plots) is lighter-weight than for executable content. File time-stamps are updated to ensure that browsers do not cache previous results and instead see the newly promoted files.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/experimental/tasks/-id-\">GET /v1/experimental/tasks/{id}</a> endpoint to track the progress of this task.

### Example
```R
library(connectapi2)

# Deploy deployment bundle
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_instructions <- deployContentBundle_request_1$new("bundle_id_example") # DeployContentBundleRequest1 | The request body when requesting the deployment of a bundle. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **instructions** | [**DeployContentBundleRequest1**](DeployContentBundleRequest1.md)| The request body when requesting the deployment of a bundle. | [optional] 

### Return type

[**DeployContentBundle200Response**](deployContentBundle_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
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

# **GetContent**
> ContentV1Exp GetContent(guid)

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

[**ContentV1Exp**](ContentV1Exp.md)

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

# **UpdateContent**
> ContentV1Exp UpdateContent(guid, content)

Update content

Update fields for a specific content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.  Authorized clients with collaborator or administrator rights are permitted to modify content item fields.

### Example
```R
library(connectapi2)

# Update content
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_content <- updateContent_request_1$new("name_example", "title_example", "description_example", "all", 123, 123, 123, 123, 123, 123, 123, 123) # UpdateContentRequest1 | The request body required when creating a new content item.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **content** | [**UpdateContentRequest1**](UpdateContentRequest1.md)| The request body required when creating a new content item. | 

### Return type

[**ContentV1Exp**](ContentV1Exp.md)

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

# **UploadContentBundle**
> UploadContentBundle200Response UploadContentBundle(guid, archive, x_content_checksum = var.x_content_checksum)

Upload deployment bundle

Upload a new deployment bundle.  Upload a compressed `tar` archive containing code/data that represent one deployment of this content. Bundles must be `gzip` compressed `tar` archives.  All deployment bundles include a `manifest.json` describing the contained files and their runtime dependencies.  A bundle for a Shiny application include an `app.R` or `ui.R` and `server.R`, and any images or data files required by the application.  An R Markdown document bundle includes the `index.Rmd` file along with any R scripts and data files needed to render the report.  Bundles containing HTML content would include the CSS, Javascript, and images required by that document.  The archive paths for the `manifest.json` file and primary source files like `app.R` or `index.Rmd` must not specify a directory structure. Directories may be used for secondary data and scripts.  Here is how you might use `tar` to create an archive for a Shiny application. It includes the manifest, the application, and an image.  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.R ./www/logo.png ```  Here is another example of creating a bundle for that same application but from its parent directory. The Shiny application is in a `sales-analyzer` sub-directory.  ```bash tar -C sales-analyzer zcf bundle.tar.gz . ```  Both `tar` commands will produce an archive with the `manifest.json` and `app.R` at the top-most level.  Publishers with collaborator rights to this content (including the owner) are permitted to upload deployment bundles. Users without these rights are rejected.  Administrators must be a collaborator for a content item before they receive upload rights.

### Example
```R
library(connectapi2)

# Upload deployment bundle
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_archive <- File.new('/path/to/file') # data.frame | A `gzip` compressed `tar` archive file.
var_x_content_checksum <- "x_content_checksum_example" # character | The Base64-encoded MD5 sum of the archive file. (Optional)

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **archive** | **data.frame**| A &#x60;gzip&#x60; compressed &#x60;tar&#x60; archive file. | 
 **x_content_checksum** | **character**| The Base64-encoded MD5 sum of the archive file. | [optional] 

### Return type

[**UploadContentBundle200Response**](uploadContentBundle_200_response.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
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

