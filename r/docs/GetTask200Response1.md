# connectapi2::GetTask200Response1

The task tracks the output and status of some operation being performed by Posit Connect. It is most commonly used to contain details about the progress of a deployment operation.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The identifier for this task. | [optional] [readonly] 
**output** | **array[character]** | An array containing lines of output produced by the task. The initial line of output is dictated by the &#x60;first&#x60; input parameter. The offset of the last output line is indicated by the &#x60;last&#x60; response field. | [optional] [readonly] 
**finished** | **character** | Indicates that a task has completed. | [optional] [readonly] 
**code** | **integer** | Numeric indication as to the cause of an error. Non-zero when an error has occured. | [optional] [readonly] 
**error** | **character** | Description of the error. An empty string when no error has occurred. | [optional] [readonly] 
**last** | **integer** | The total number of output lines produced so far. Use as the value to &#x60;first&#x60; in the next request to only fetch output lines beyond what you have already received. | [optional] [readonly] 
**result** | [**GetTask200Response1Result**](getTask_200_response_1_result.md) |  | [optional] 


