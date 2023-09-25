# connectapi.TagsApi

All URIs are relative to */__api__*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_tag**](TagsApi.md#add_tag) | **POST** /v1/content/{guid}/tags | Add tag to content
[**create_tag**](TagsApi.md#create_tag) | **POST** /v1/tags | Create tag
[**delete_tag**](TagsApi.md#delete_tag) | **DELETE** /v1/tags/{id} | Delete tag
[**get_tag**](TagsApi.md#get_tag) | **GET** /v1/tags/{id} | Get tag
[**get_tag_by_path**](TagsApi.md#get_tag_by_path) | **GET** /v1/tags/{path} | Get tag by path
[**list_content_tags**](TagsApi.md#list_content_tags) | **GET** /v1/content/{guid}/tags | List tags for content
[**list_tag_content**](TagsApi.md#list_tag_content) | **GET** /v1/tags/{id}/content | List content for tags
[**list_tags**](TagsApi.md#list_tags) | **GET** /v1/tags | List tags
[**remove_tag**](TagsApi.md#remove_tag) | **DELETE** /v1/content/{guid}/tags/{id} | Remove tag from content
[**update_tag**](TagsApi.md#update_tag) | **PATCH** /v1/tags/{id} | Update tag

# **add_tag**
> list[Tag] add_tag(body, guid)

Add tag to content

Add the specified tag to an individual content item. When adding a tag, all tags above the specified tag in the tag tree are also added to the content item.  Authenticated access required from an admin or from a user with collaborator/editor permissions on the content item.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
body = connectapi.GuidTagsBody() # GuidTagsBody | The request body specifies which tag to add
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the content item.

try:
    # Add tag to content
    api_response = api_instance.add_tag(body, guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->add_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**GuidTagsBody**](GuidTagsBody.md)| The request body specifies which tag to add | 
 **guid** | [**str**](.md)| The unique identifier of the content item. | 

### Return type

[**list[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_tag**
> Tag create_tag(body)

Create tag

Create a new tag. Tags without a parent are considered tag \"categories\" and are used to organize other tags. Note that tag categories cannot be added to content items.  Authenticated access from a user having an \"administrator\" role is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
body = connectapi.V1TagsBody() # V1TagsBody | The request body required when creating a new tag.

try:
    # Create tag
    api_response = api_instance.create_tag(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->create_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**V1TagsBody**](V1TagsBody.md)| The request body required when creating a new tag. | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_tag**
> delete_tag(id)

Delete tag

Deletes a tag, including all descendants in its own tag hierarchy.  Authenticated access from a user having an \"administrator\" role is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the tag.

try:
    # Delete tag
    api_instance.delete_tag(id)
except ApiException as e:
    print("Exception when calling TagsApi->delete_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the tag. | 

### Return type

void (empty response body)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_tag**
> Tag get_tag(id)

Get tag

Get an individual tag  Authenticated access from a user is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the tag

try:
    # Get tag
    api_response = api_instance.get_tag(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->get_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the tag | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_tag_by_path**
> Tag get_tag_by_path(path)

Get tag by path

Get an individual tag by a comma-delimited \"path\" to the tag. The path to the tag is the series of tag names to traverse the tag hierarchy, starting with a tag category.  Authenticated access from a user is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
path = 'path_example' # str | The path to the tag, as comma-delimited names

try:
    # Get tag by path
    api_response = api_instance.get_tag_by_path(path)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->get_tag_by_path: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **path** | **str**| The path to the tag, as comma-delimited names | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_content_tags**
> list[Tag] list_content_tags(guid)

List tags for content

List of all tags for the specified content item  Authenticated access required from an admin or from a user with at least viewer permissions on the content item.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the content item.

try:
    # List tags for content
    api_response = api_instance.list_content_tags(guid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->list_content_tags: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the content item. | 

### Return type

[**list[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_tag_content**
> list[Content] list_tag_content(id)

List content for tags

List all of the content for the specified tag.  Authenticated access from a user is required. If an \"administrator\" role is used, then all content items will be returned regardless of the visibility to the requesting user.  Note that R or Python version information is only provided to clients that authenticate as admin or publisher users; it is suppressed for viewers.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
id = 'id_example' # str | The unique identifier of the tag.

try:
    # List content for tags
    api_response = api_instance.list_tag_content(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->list_tag_content: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| The unique identifier of the tag. | 

### Return type

[**list[Content]**](Content.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_tags**
> list[Tag] list_tags(parent_id=parent_id, name=name)

List tags

List of all tags.  Authenticated access from a user is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
parent_id = 'parent_id_example' # str | The unique identifier of the parent tag (optional)
name = 'name_example' # str | The tag name  Note: tag names are only unique within the scope of a parent, which means that it is possible to have multiple results when querying by name; however, querying by both `name` and `parent_id` ensures a single result. (optional)

try:
    # List tags
    api_response = api_instance.list_tags(parent_id=parent_id, name=name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->list_tags: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **parent_id** | **str**| The unique identifier of the parent tag | [optional] 
 **name** | **str**| The tag name  Note: tag names are only unique within the scope of a parent, which means that it is possible to have multiple results when querying by name; however, querying by both &#x60;name&#x60; and &#x60;parent_id&#x60; ensures a single result. | [optional] 

### Return type

[**list[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **remove_tag**
> list[Tag] remove_tag(guid, id)

Remove tag from content

Remove the specified tag from an individual content item. When removing a tag, all children and descendant tags are also removed from the content item.  Authenticated access required from an admin or from a user with collaborator/editor permissions on the content item.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
guid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # str | The unique identifier of the content item.
id = 'id_example' # str | The unique identifier of the tag.

try:
    # Remove tag from content
    api_response = api_instance.remove_tag(guid, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->remove_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **guid** | [**str**](.md)| The unique identifier of the content item. | 
 **id** | **str**| The unique identifier of the tag. | 

### Return type

[**list[Tag]**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **update_tag**
> Tag update_tag(body, id)

Update tag

Update an existing tag.  Authenticated access from a user having an \"administrator\" role is required.

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
api_instance = connectapi.TagsApi(connectapi.ApiClient(configuration))
body = connectapi.TagsIdBody() # TagsIdBody | The request body required when updating an existing tag.
id = 'id_example' # str | The unique identifier of the tag.

try:
    # Update tag
    api_response = api_instance.update_tag(body, id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling TagsApi->update_tag: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**TagsIdBody**](TagsIdBody.md)| The request body required when updating an existing tag. | 
 **id** | **str**| The unique identifier of the tag. | 

### Return type

[**Tag**](Tag.md)

### Authorization

[apiKey](../README.md#apiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

