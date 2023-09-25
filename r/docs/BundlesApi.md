# BundlesApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**DeleteBundle**](BundlesApi.md#DeleteBundle) | **DELETE** /v1/content/{guid}/bundles/{id} | Delete bundle
[**DownloadBundle**](BundlesApi.md#DownloadBundle) | **GET** /v1/content/{guid}/bundles/{id}/download | Download the bundle archive
[**GetBundle**](BundlesApi.md#GetBundle) | **GET** /v1/content/{guid}/bundles/{id} | Get bundle details
[**GetBundles**](BundlesApi.md#GetBundles) | **GET** /v1/content/{guid}/bundles | List bundles
[**UploadContentBundle**](BundlesApi.md#UploadContentBundle) | **POST** /v1/content/{guid}/bundles | Create a bundle by uploading an archive


# **DeleteBundle**
> DeleteBundle(guid, id)

Delete bundle

Delete a specific bundle.  Bundle deletion is permitted by authorized clients with collaborator rights.  On-disk data and database records are removed as a consequence of this call. Deletion is not allowed while the bundle is still active.

### Example
```R
library(connectapi2)

# Delete bundle
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
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
> data.frame DownloadBundle(guid, id)

Download the bundle archive

Download a deployment bundle.  Bundle download is permitted by authorized clients with collaborator rights.  Download a `gzip` compressed `tar` archive (`.tar.gz`) containing the code/data from one deployment of the associated content.  See the  <a href=\"#post-/v1/content/-guid-/bundles\">POST /v1/content/{guid}/bundles</a> endpoint for details about the construction of bundle archives.

### Example
```R
library(connectapi2)

# Download the bundle archive
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
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
> Bundle GetBundle(guid, id)

Get bundle details

Get detailed information about a specific bundle.  Bundle reads are permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.

### Example
```R
library(connectapi2)

# Get bundle details
#
# prepare function argument(s)
var_guid <- "guid_example" # character | The unique identifier of the desired content item.
var_id <- "id_example" # character | The unique identifier of the desired bundle.

api_instance <- connectapi2_api$new()
# Configure API key authorization: apiKey
api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | **character**| The unique identifier of the desired content item. | 
 **id** | **character**| The unique identifier of the desired bundle. | 

### Return type

[**Bundle**](Bundle.md)

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
> array[Bundle] GetBundles(guid)

List bundles

List bundles associated with a specific content item.  Bundle enumeration is permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.  Results are sorted by ID.

### Example
```R
library(connectapi2)

# List bundles
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

[**array[Bundle]**](Bundle.md)

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

# **UploadContentBundle**
> Bundle UploadContentBundle(guid, archive, x_content_checksum = var.x_content_checksum)

Create a bundle by uploading an archive

Create a new deployment bundle by uploading an archive.  Upload a compressed `tar` archive containing code/data that represent one deployment of this content. Bundles must be `gzip` compressed `tar` archives.  * All deployment bundles include a `manifest.json` describing the contained files and their runtime dependencies. * A bundle for a Shiny application includes an `app.R` or `ui.R` and `server.R`, and any images or data files required by the application. * Python API and application bundles include the application source code, typically named `app.py`, and a list of required package dependencies in `requirements.txt`. * An R Markdown document bundle includes the `index.Rmd` file along with any R scripts and data files needed to render the report. * A Quarto bundle includes at least one `.qmd` file, along with any auxiliary files required. Quarto projects include a `_quarto.yml` file. * Bundles containing HTML content should include any CSS, Javascript, and images required by that document.  The `manifest.json` file and primary source files like `app.R`, `app.py`, or `index.Rmd` must be in the top level of the archived directory. Subdirectories may be used for secondary data and scripts.  Here is how you might use `tar` to create an archive for a Shiny application. It includes the manifest, the application, and an image.  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.R ./www/logo.png ```  You could create a bundle for a Python application similarly:  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.py ./requirements.txt ./www/logo.png ```  Here is another example of creating a bundle for an application but from its parent directory. The application is in a `sales-analyzer` sub-directory. This command will include all files in the subdirectory; check to ensure that this does not include extraneous files such as output files or local Python environments that you do not want in the bundle.  ```bash tar zcf bundle.tar.gz ./sales-analyzer ```  Publishers with collaborator rights to this content (including the owner) are permitted to upload deployment bundles. Users without these rights are rejected.  Administrators must be a collaborator for a content item before they receive upload rights.

### Example
```R
library(connectapi2)

# Create a bundle by uploading an archive
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

[**Bundle**](Bundle.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details
| Status code | Description | Response headers |
|-------------|-------------|------------------|
| **200** | The newly created bundle. |  -  |
| **400** | The requested operation is invalid. |  -  |
| **401** | The requested operation requires authentication. |  -  |
| **404** | The requested object does not exist. |  -  |
| **500** | A server error occurred. |  -  |
| **0** | An error occurred invoking the API. |  -  |

