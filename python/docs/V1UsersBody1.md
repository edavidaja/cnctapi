# V1UsersBody1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | **str** | The user&#x27;s desired username | 
**email** | **str** | The user&#x27;s email. | [optional] 
**first_name** | **str** | The user&#x27;s first name | [optional] [default to '']
**last_name** | **str** | The user&#x27;s last name | [optional] [default to '']
**user_role** | **str** | The user&#x27;s role. If &#x60;null&#x60; it will default to the role specified by the config setting &#x60;Authorization.DefaultUserRole&#x60;. | [optional] 
**user_must_set_password** | **bool** | Applies only to password authentication.  - When &#x60;true&#x60;, the created user will be asked to set their password on first login. The &#x60;password&#x60; request parameter cannot be set when this parameter is &#x60;true&#x60;. - When &#x60;false&#x60;, you must specify the &#x60;password&#x60;. | [optional] [default to False]
**password** | **str** | Applies only to password authentication. Must be at least 6 characters long. Cannot be set when &#x60;user_must_set_password&#x60; is true. | [optional] [default to '']
**unique_id** | **str** | Applies only to proxied authentication when &#x60;ProxyAuth.UniqueIdHeader&#x60; is being used.  It is required when SAML or OAuth2 (non-Google) authentication is being used. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

