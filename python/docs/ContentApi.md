# connectapi.ContentApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**build_content_bundle**](ContentApi.md#build_content_bundle) | **POST** /v1/content/{guid}/build | Build deployment bundle
[**create_content**](ContentApi.md#create_content) | **POST** /v1/content | Create content item
[**delete_content**](ContentApi.md#delete_content) | **DELETE** /v1/content/{guid} | Delete content
[**deploy_content_bundle**](ContentApi.md#deploy_content_bundle) | **POST** /v1/content/{guid}/deploy | Deploy deployment bundle
[**get_content**](ContentApi.md#get_content) | **GET** /v1/content/{guid} | Get content details
[**get_content_environment**](ContentApi.md#get_content_environment) | **GET** /v1/content/{guid}/environment | Get environment variables
[**get_contents**](ContentApi.md#get_contents) | **GET** /v1/content | List content items
[**set_content_environment**](ContentApi.md#set_content_environment) | **PUT** /v1/content/{guid}/environment | Set all environment variables
[**update_content**](ContentApi.md#update_content) | **PATCH** /v1/content/{guid} | Update content
[**update_content_environment**](ContentApi.md#update_content_environment) | **PATCH** /v1/content/{guid}/environment | Update environment variables

# **build_content_bundle**
> InlineResponse200 build_content_bundle(guid, body=body)

Build deployment bundle

Build (restore) a deployment bundle.  Build requests spawn an asynchronous task to make your previously uploaded data ready for rendering or running. Content will have its environment reconstructed, e.g. by using the packrat R package to install R package dependencies, but documents will not be re-rendered.  Building is intended to facilitate server changes or migrations that may require re-installing R packages or other dependencies.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/tasks/-id-\">GET /v1/tasks/{id}</a> endpoint to track the progress of this task.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
body = connectapi.GuidBuildBody() # GuidBuildBody | The request body when requesting the building of a specific bundle. (optional)

try:
    # Build deployment bundle
    api_response = api_instance.build_content_bundle(guid, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->build_content_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **body** | [**GuidBuildBody**](GuidBuildBody.md)| The request body when requesting the building of a specific bundle. | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_content**
> Content create_content(body)

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
body = connectapi.V1ContentBody() # V1ContentBody | The request body required when creating a new content item.

try:
    # Create content item
    api_response = api_instance.create_content(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->create_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1ContentBody**](V1ContentBody.md)| The request body required when creating a new content item. | 

### Return type

[**Content**](Content.md)

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Delete content
    api_instance.delete_content(guid)
except ApiException as e:
    print("Exception when calling ContentApi->delete_content: %s\n" % e)
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
> InlineResponse202 deploy_content_bundle(guid, body=body)

Deploy deployment bundle

Deploy (activate) a deployment bundle.  Deployment requests spawn an asynchronous task to make your previously uploaded data available for serving. The workflow applied to the bundled files varies depending on the type of content.  Executable content has its environment reconstructed. This includes using the packrat R package to install R package dependencies.  Documents (R Markdown reports, Jupyter Notebooks, static Quarto content) are rendered and the result made available.  Interactive content (applications and APIs) are available to be launched on the next client visit.  The deployment workflow for static content (HTML, plots) is lighter-weight than for executable content. File time-stamps are updated to ensure that browsers do not cache previous results and instead see the newly promoted files.  The response from this endpoint includes a task identifier. Poll the <a href=\"#get-/v1/tasks/-id-\">GET /v1/tasks/{id}</a> endpoint to track the progress of this task.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.
body = connectapi.GuidDeployBody() # GuidDeployBody | The request body when requesting the deployment of a bundle. (optional)

try:
    # Deploy deployment bundle
    api_response = api_instance.deploy_content_bundle(guid, body=body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->deploy_content_bundle: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 
 **body** | [**GuidDeployBody**](GuidDeployBody.md)| The request body when requesting the deployment of a bundle. | [optional] 

### Return type

[**InlineResponse202**](InlineResponse202.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_content**
> Content get_content(guid)

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Get content details
    api_response = api_instance.get_content(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->get_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

[**Content**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_content_environment**
> list[str] get_content_environment(guid)

Get environment variables

Get the names of the environment variables defined for this content.  Since environment variables may contain sensitive information, the values are not included in the returned data.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Get environment variables
    api_response = api_instance.get_content_environment(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->get_content_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

**list[str]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_contents**
> list[Content] get_contents(owner_guid=owner_guid, name=name)

List content items

List all content items visible to the requesting user.  Authenticated access from a user is required. If an \"administrator\" role is used, then all content items will be returned regardless of the visibility to the requesting user.  Information about the target environment is populated for users with \"publisher\" and \"administrator\" role; it is suppressed for viewers.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
owner_guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the user who owns the content. (optional)
name = 'name_example' # str | The content name specified when the content was created.  Note: content names are unique within the owning user's account, so a request that specifies a non-empty name and owner_guid will return at most one content item. (optional)

try:
    # List content items
    api_response = api_instance.get_contents(owner_guid=owner_guid, name=name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->get_contents: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **owner_guid** | [**str**](.md)| The unique identifier of the user who owns the content. | [optional] 
 **name** | **str**| The content name specified when the content was created.  Note: content names are unique within the owning user&#x27;s account, so a request that specifies a non-empty name and owner_guid will return at most one content item. | [optional] 

### Return type

[**list[Content]**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **set_content_environment**
> list[str] set_content_environment(body, guid)

Set all environment variables

Set the environment for this content item. Any existing environment variables will be removed, and the ones in the request will be set.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
body = [connectapi.EnvironmentVariable()] # list[EnvironmentVariable] | The environment definition to apply to this content item.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Set all environment variables
    api_response = api_instance.set_content_environment(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->set_content_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**list[EnvironmentVariable]**](EnvironmentVariable.md)| The environment definition to apply to this content item. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

**list[str]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_content**
> Content update_content(body, guid)

Update content

Update fields for a specific content item.  Authenticated access from a user having either \"publisher\" or \"administrator\" role is allowed. All other clients are rejected.  Authorized clients with collaborator or administrator rights are permitted to modify content item fields.  Administrators can reassign content ownership by updating the `owner_guid` field. The new owner must have publisher or  administrator rights.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
body = connectapi.ContentGuidBody() # ContentGuidBody | The request body required when updating a content item.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the content item to update.

try:
    # Update content
    api_response = api_instance.update_content(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->update_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ContentGuidBody**](ContentGuidBody.md)| The request body required when updating a content item. | 
 **guid** | [**str**](.md)| The unique identifier of the content item to update. | 

### Return type

[**Content**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_content_environment**
> list[str] update_content_environment(body, guid)

Update environment variables

Add, change, or delete environment variables for this content. Variables present in the request body will be set to the values provided. Variables with a value of `null` will be deleted. Variables not present in the request body will be left unchanged.

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
api_instance = connectapi.ContentApi(connectapi.ApiClient(configuration))
body = [connectapi.EnvironmentVariable()] # list[EnvironmentVariable] | The environment definition to apply to this content item.
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the desired content item.

try:
    # Update environment variables
    api_response = api_instance.update_content_environment(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling ContentApi->update_content_environment: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**list[EnvironmentVariable]**](EnvironmentVariable.md)| The environment definition to apply to this content item. | 
 **guid** | [**str**](.md)| The unique identifier of the desired content item. | 

### Return type

**list[str]**

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

