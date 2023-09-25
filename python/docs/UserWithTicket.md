# UserWithTicket

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**guid** | **str** | The user&#x27;s GUID, or unique identifier in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. When a user does not exist in the Posit Connect server, this property will be &#x60;null&#x60;. | 
**email** | **str** | The user&#x27;s email | 
**username** | **str** | The user&#x27;s username | 
**first_name** | **str** | The user&#x27;s first name | 
**last_name** | **str** | The user&#x27;s last name | 
**user_role** | **str** | The user&#x27;s role | 
**created_time** | **datetime** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was created in the Posit Connect server | 
**updated_time** | **datetime** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server | 
**active_time** | **datetime** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last active on the Posit Connect server | 
**confirmed** | **bool** | Whether or not the user is confirmed. This property will always be &#x60;true&#x60; for all authentication providers except password. | 
**locked** | **bool** | Whether or not the user is locked | 
**temp_ticket** | **str** | This value is for actions that require a &#x60;temp_ticket&#x60;, such as adding an LDAP or OAuth2 with Google user to the Connect server. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

