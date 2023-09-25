# ContentVisit

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content_guid** | **str** | The GUID, in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format, of the content this information pertains to. | 
**user_guid** | **str** | The GUID, in [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format, of the user that visited the content. | 
**variant_key** | **str** | The key of the variant the user visited.  This will be &#x60;null&#x60; for static content. | [optional] 
**rendering_id** | **int** | The ID of the rendering the user visited.  This will be &#x60;null&#x60; for static content. | [optional] 
**bundle_id** | **int** | The ID of the particular bundle used. | 
**time** | **datetime** | The timestamp, in [RFC3339](https://www.rfc-editor.org/rfc/rfc3339) format, when the user visited the content. | 
**data_version** | **int** | The data version the record was recorded with.  The [Content Visit Events](../admin/historical-information/#content-visit-events) section of the Posit Connect Admin Guide explains how to interpret &#x60;data_version&#x60; values. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

