# connectapi2::UpdateUserRequest


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**email** | **character** | The user&#39;s new email. | [optional] 
**username** | **character** | The user&#39;s new username | [optional] 
**first_name** | **character** | The user&#39;s new first name | [optional] 
**last_name** | **character** | The user&#39;s new last name | [optional] 
**user_role** | **character** | The user&#39;s new role. Note that you can only downgrade yourself. Administrators can change other users&#39; roles to any valid role. | [optional] [Enum: [administrator, publisher, viewer]] 


