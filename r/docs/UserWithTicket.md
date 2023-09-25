# connectapi2::UserWithTicket


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**guid** | **character** | The user&#39;s GUID, or unique identifier in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. When a user does not exist in the Posit Connect server, this property will be &#x60;null&#x60;. | 
**email** | **character** | The user&#39;s email | 
**username** | **character** | The user&#39;s username | 
**first_name** | **character** | The user&#39;s first name | 
**last_name** | **character** | The user&#39;s last name | 
**user_role** | **character** | The user&#39;s role | [Enum: [administrator, publisher, viewer]] 
**created_time** | **character** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was created in the Posit Connect server | 
**updated_time** | **character** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last updated in the Posit Connect server | 
**active_time** | **character** | The timestamp (in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format) when the user was last active on the Posit Connect server | 
**confirmed** | **character** | Whether or not the user is confirmed. This property will always be &#x60;true&#x60; for all authentication providers except password. | 
**locked** | **character** | Whether or not the user is locked | 
**temp_ticket** | **character** | This value is for actions that require a &#x60;temp_ticket&#x60;, such as adding an LDAP or OAuth2 with Google user to the Connect server. | 


