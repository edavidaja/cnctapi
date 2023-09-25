# ShinyAppUsage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content_guid** | **str** | The GUID, in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format, of the Shiny application this information pertains to. | 
**user_guid** | **str** | The GUID, in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format, of the user that visited the application. | 
**started** | **datetime** | The timestamp, in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format, when the user opened the application. | 
**ended** | **datetime** | The timestamp, in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format, when the user left the application. | 
**data_version** | **int** | The data version the record was recorded with.  The [Shiny Application Events](../admin/historical-information/#shiny-application-events) section of the Posit Connect Admin Guide explains how to interpret &#x60;data_version&#x60; values. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

