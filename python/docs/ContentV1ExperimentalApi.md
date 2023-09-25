# connectapi.ContentV1ExperimentalApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_content**](ContentV1ExperimentalApi.md#create_content) | **POST** /v1/experimental/content | Create content item
[**delete_content**](ContentV1ExperimentalApi.md#delete_content) | **DELETE** /v1/experimental/content/{guid} | Delete content
[**deploy_content_bundle**](ContentV1ExperimentalApi.md#deploy_content_bundle) | **POST** /v1/experimental/content/{guid}/deploy | Deploy deployment bundle
[**get_content**](ContentV1ExperimentalApi.md#get_content) | **GET** /v1/experimental/content/{guid} | Get content details
[**update_content**](ContentV1ExperimentalApi.md#update_content) | **POST** /v1/experimental/content/{guid} | Update content
[**upload_content_bundle**](ContentV1ExperimentalApi.md#upload_content_bundle) | **POST** /v1/experimental/content/{guid}/upload | Upload deployment bundle

# **create_content**
> ContentV1Exp create_content(body)

Create content item

Create a new content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
body = connectapi.ExperimentalContentBody() # ExperimentalContentBody | The request body required when creating a new content item.

try:
    # Create content item
    api_response = api_instance.create_content(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->create_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ExperimentalContentBody**](ExperimentalContentBody.md)| The request body required when creating a new content item. | 

### Return type

[**ContentV1Exp**](ContentV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_content**
> delete_content(guid)

Delete content

Delete a specific content item.  On-disk data and database records are removed as a consequence of this call.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Delete content
    api_instance.delete_content(guid)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->delete_content: %s\n" % e)
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

# **deploy_content_bundle**
> InlineResponse2001 deploy_content_bundle(guid, body=body)

Deploy deployment bundle

Deploy (activate) a deployment bundle.  Deployment requests spawn an asynchronous task to make your previously uploaded data available for serving. The workflow applied to the bundled files varies depending on the type of content.  Executable content has its environment reconstructed. This includes using the packrat R package to install R package dependencies.  Documents (R Markdown reports, Jupyter Notebooks) are rendered and the result made available.  Interactive content (Shiny applications, Plumber APIs) available to be launched on the next client visit.  The deployment workflow for static content (HTML, plots) is lighter-weight than for executable content. File time-stamps are updated to ensure that browsers do not cache previous results and instead see the newly promoted files.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/experimental/tasks/-id-\">GET /v1/experimental/tasks/{id}</a> endpoint to track the progress of this task.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
body = connectapi.GuidDeployBody1() # GuidDeployBody1 | The request body when requesting the deployment of a bundle. (optional)

try:
    # Deploy deployment bundle
    api_response = api_instance.deploy_content_bundle(guid, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->deploy_content_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **body** | [**GuidDeployBody1**](GuidDeployBody1.md)| The request body when requesting the deployment of a bundle. | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_content**
> ContentV1Exp get_content(guid)

Get content details

Get detailed information about a specific content item.  Unauthenticated clients are rejected regardless of the content access type.  Authorized, non-administrator clients without viewership rights to this content are rejected.  Authorized, administrator clients without viewership rights are permitted to obtain information about this content. The computed `role` for these users will be `none`, representing that these users cannot view the content itself.  Authorized clients with viewership (or collaborator) rights are permitted to obtain information about this content. The computed `role` for these users will reflect the level of access.  Information about the target environment is populated for users with \"publisher\" and \"administrator\" role; it is suppressed for viewers.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Get content details
    api_response = api_instance.get_content(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->get_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**ContentV1Exp**](ContentV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_content**
> ContentV1Exp update_content(body, guid)

Update content

Update fields for a specific content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.  Authorized clients with collaborator or administrator rights are permitted to modify content item fields.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
body = connectapi.ContentGuidBody1() # ContentGuidBody1 | The request body required when creating a new content item.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Update content
    api_response = api_instance.update_content(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->update_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ContentGuidBody1**](ContentGuidBody1.md)| The request body required when creating a new content item. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**ContentV1Exp**](ContentV1Exp.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upload_content_bundle**
> InlineResponse2002 upload_content_bundle(body, guid, x_content_checksum=x_content_checksum)

Upload deployment bundle

Upload a new deployment bundle.  Upload a compressed `tar` archive containing code/data that represent one deployment of this content. Bundles must be `gzip` compressed `tar` archives.  All deployment bundles include a `manifest.json` describing the contained files and their runtime dependencies.  A bundle for a Shiny application include an `app.R` or `ui.R` and `server.R`, and any images or data files required by the application.  An R Markdown document bundle includes the `index.Rmd` file along with any R scripts and data files needed to render the report.  Bundles containing HTML content would include the CSS, Javascript, and images required by that document.  The archive paths for the `manifest.json` file and primary source files like `app.R` or `index.Rmd` must not specify a directory structure. Directories may be used for secondary data and scripts.  Here is how you might use `tar` to create an archive for a Shiny application. It includes the manifest, the application, and an image.  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.R ./www/logo.png ```  Here is another example of creating a bundle for that same application but from its parent directory. The Shiny application is in a `sales-analyzer` sub-directory.  ```bash tar -C sales-analyzer zcf bundle.tar.gz . ```  Both `tar` commands will produce an archive with the `manifest.json` and `app.R` at the top-most level.  Publishers with collaborator rights to this content (including the owner) are permitted to upload deployment bundles. Users without these rights are rejected.  Administrators must be a collaborator for a content item before they receive upload rights.

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
api_instance = connectapi.ContentV1ExperimentalApi(connectapi.ApiClient(configuration))
body = connectapi.Object() # Object | A `gzip` compressed `tar` archive file.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
x_content_checksum = 'x_content_checksum_example' # str | The Base64-encoded MD5 sum of the archive file. (optional)

try:
    # Upload deployment bundle
    api_response = api_instance.upload_content_bundle(body, guid, x_content_checksum=x_content_checksum)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentV1ExperimentalApi->upload_content_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| A &#x60;gzip&#x60; compressed &#x60;tar&#x60; archive file. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **x_content_checksum** | **str**| The Base64-encoded MD5 sum of the archive file. | [optional] 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

