# connectapi2::CreatePushUserRequest


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | **character** | The user&#39;s desired username | 
**email** | **character** | The user&#39;s email. | [optional] [default to &quot;&quot;] 
**first_name** | **character** | The user&#39;s first name | [optional] [default to &quot;&quot;] 
**last_name** | **character** | The user&#39;s last name | [optional] [default to &quot;&quot;] 
**user_role** | **character** | The user&#39;s role. If &#x60;null&#x60; it will default to the role specified by the config setting &#x60;Authorization.DefaultUserRole&#x60;. | [optional] [Enum: [administrator, publisher, viewer]] 
**user_must_set_password** | **character** | Applies only to password authentication.  - When &#x60;true&#x60;, the created user will be asked to set their password on first login. The &#x60;password&#x60; request parameter cannot be set when this parameter is &#x60;true&#x60;. - When &#x60;false&#x60;, you must specify the &#x60;password&#x60;. | [optional] [default to FALSE] 
**password** | **character** | Applies only to password authentication. Must be at least 6 characters long. Cannot be set when &#x60;user_must_set_password&#x60; is true. | [optional] [default to &quot;&quot;] 
**unique_id** | **character** | Applies only to proxied authentication when &#x60;ProxyAuth.UniqueIdHeader&#x60; is being used.  It is required when SAML or OAuth2 (non-Google) authentication is being used. | [optional] 


