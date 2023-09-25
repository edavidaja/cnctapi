# connectapi.BundlesApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_bundle**](BundlesApi.md#delete_bundle) | **DELETE** /v1/content/{guid}/bundles/{id} | Delete bundle
[**download_bundle**](BundlesApi.md#download_bundle) | **GET** /v1/content/{guid}/bundles/{id}/download | Download the bundle archive
[**get_bundle**](BundlesApi.md#get_bundle) | **GET** /v1/content/{guid}/bundles/{id} | Get bundle details
[**get_bundles**](BundlesApi.md#get_bundles) | **GET** /v1/content/{guid}/bundles | List bundles
[**upload_content_bundle**](BundlesApi.md#upload_content_bundle) | **POST** /v1/content/{guid}/bundles | Create a bundle by uploading an archive

# **delete_bundle**
> delete_bundle(guid, id)

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
api_instance = connectapi.BundlesApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Delete bundle
    api_instance.delete_bundle(guid, id)
except ApiException as e:
    print("Exception when calling BundlesApi->delete_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
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
> str download_bundle(guid, id)

Download the bundle archive

Download a deployment bundle.  Bundle download is permitted by authorized clients with collaborator rights.  Download a `gzip` compressed `tar` archive (`.tar.gz`) containing the code/data from one deployment of the associated content.  See the  <a href=\"#post-/v1/content/-guid-/bundles\">POST /v1/content/{guid}/bundles</a> endpoint for details about the construction of bundle archives.

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
api_instance = connectapi.BundlesApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Download the bundle archive
    api_response = api_instance.download_bundle(guid, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesApi->download_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
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
> Bundle get_bundle(guid, id)

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
api_instance = connectapi.BundlesApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
id = 'id_example' # str | The unique identifier of the desired bundle.

try:
    # Get bundle details
    api_response = api_instance.get_bundle(guid, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesApi->get_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **id** | **str**| The unique identifier of the desired bundle. | 

### Return type

[**Bundle**](Bundle.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_bundles**
> list[Bundle] get_bundles(guid)

List bundles

List bundles associated with a specific content item.  Bundle enumeration is permitted by all users with viewership rights to the content item. Information about the target environment is populated for users with \"publisher\" and \"administrator\" role.  Results are sorted by ID.

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
api_instance = connectapi.BundlesApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # List bundles
    api_response = api_instance.get_bundles(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesApi->get_bundles: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**list[Bundle]**](Bundle.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upload_content_bundle**
> Bundle upload_content_bundle(body, guid, x_content_checksum=x_content_checksum)

Create a bundle by uploading an archive

Create a new deployment bundle by uploading an archive.  Upload a compressed `tar` archive containing code/data that represent one deployment of this content. Bundles must be `gzip` compressed `tar` archives.  * All deployment bundles include a `manifest.json` describing the contained files and their runtime dependencies. * A bundle for a Shiny application includes an `app.R` or `ui.R` and `server.R`, and any images or data files required by the application. * Python API and application bundles include the application source code, typically named `app.py`, and a list of required package dependencies in `requirements.txt`. * An R Markdown document bundle includes the `index.Rmd` file along with any R scripts and data files needed to render the report. * A Quarto bundle includes at least one `.qmd` file, along with any auxiliary files required. Quarto projects include a `_quarto.yml` file. * Bundles containing HTML content should include any CSS, Javascript, and images required by that document.  The `manifest.json` file and primary source files like `app.R`, `app.py`, or `index.Rmd` must be in the top level of the archived directory. Subdirectories may be used for secondary data and scripts.  Here is how you might use `tar` to create an archive for a Shiny application. It includes the manifest, the application, and an image.  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.R ./www/logo.png ```  You could create a bundle for a Python application similarly:  ```bash tar zcf bundle.tar.gz ./manifest.json ./app.py ./requirements.txt ./www/logo.png ```  Here is another example of creating a bundle for an application but from its parent directory. The application is in a `sales-analyzer` sub-directory. This command will include all files in the subdirectory; check to ensure that this does not include extraneous files such as output files or local Python environments that you do not want in the bundle.  ```bash tar zcf bundle.tar.gz ./sales-analyzer ```  Publishers with collaborator rights to this content (including the owner) are permitted to upload deployment bundles. Users without these rights are rejected.  Administrators must be a collaborator for a content item before they receive upload rights.

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
api_instance = connectapi.BundlesApi(connectapi.ApiClient(configuration))
body = connectapi.Object() # Object | A `gzip` compressed `tar` archive file.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
x_content_checksum = 'x_content_checksum_example' # str | The Base64-encoded MD5 sum of the archive file. (optional)

try:
    # Create a bundle by uploading an archive
    api_response = api_instance.upload_content_bundle(body, guid, x_content_checksum=x_content_checksum)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling BundlesApi->upload_content_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **Object**| A &#x60;gzip&#x60; compressed &#x60;tar&#x60; archive file. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **x_content_checksum** | **str**| The Base64-encoded MD5 sum of the archive file. | [optional] 

### Return type

[**Bundle**](Bundle.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

