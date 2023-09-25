# User

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**guid** | **str** | The user&#x27;s GUID, or unique identifier, in UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format | 
**email** | **str** | The user&#x27;s email | 
**username** | **str** | The user&#x27;s username | 
**first_name** | **str** | The user&#x27;s first name | 
**last_name** | **str** | The user&#x27;s last name | 
**user_role** | **str** | The user&#x27;s role | 
**created_time** | **datetime** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when the user was created in the Posit Connect server. | 
**updated_time** | **datetime** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when information about this user was last updated in the Posit Connect server. | 
**active_time** | **datetime** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating approximately when the user was last active. Highly active users only receive periodic updates. | 
**confirmed** | **bool** | When &#x60;false&#x60;, the created user must confirm their account through an email. This feature is unique to password authentication. | 
**locked** | **bool** | Whether or not the user is locked | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

