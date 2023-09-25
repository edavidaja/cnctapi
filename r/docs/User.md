# connectapi2::User


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**guid** | **character** | The user&#39;s GUID, or unique identifier, in UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format | 
**email** | **character** | The user&#39;s email | 
**username** | **character** | The user&#39;s username | 
**first_name** | **character** | The user&#39;s first name | 
**last_name** | **character** | The user&#39;s last name | 
**user_role** | **character** | The user&#39;s role | [Enum: [administrator, publisher, viewer]] 
**created_time** | **character** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when the user was created in the Posit Connect server. | 
**updated_time** | **character** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating when information about this user was last updated in the Posit Connect server. | 
**active_time** | **character** | Timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) indicating approximately when the user was last active. Highly active users only receive periodic updates. | 
**confirmed** | **character** | When &#x60;false&#x60;, the created user must confirm their account through an email. This feature is unique to password authentication. | 
**locked** | **character** | Whether or not the user is locked | 


