# InlineResponse2006

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | The identifier for this task. | [optional] 
**output** | **list[str]** | An array containing lines of output produced by the task. The initial line of output is dictated by the &#x60;first&#x60; input parameter. The offset of the last output line is indicated by the &#x60;last&#x60; response field. | [optional] 
**finished** | **bool** | Indicates that a task has completed. | [optional] 
**code** | **int** | Numeric indication as to the cause of an error. Non-zero when an error has occured. | [optional] 
**error** | **str** | Description of the error. An empty string when no error has occurred. | [optional] 
**last** | **int** | The total number of output lines produced so far. Use as the value to &#x60;first&#x60; in the next request to only fetch output lines beyond what you have already received. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

