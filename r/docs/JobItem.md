# connectapi2::JobItem


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **character** | The job identifier. | [optional] 
**ppid** | **character** | The job&#39;s parent process identifier. | [optional] 
**pid** | **character** | The job&#39;s process identifier. | [optional] 
**key** | **character** | The job&#39;s unique key identifier. | [optional] 
**remote_id** | **character** | The job&#39;s identifier for off-host execution configurations. | [optional] 
**app_id** | **character** | The job&#39;s parent content identifier | [optional] 
**variant_id** | **character** | The identifier of the variant owning this job. | [optional] 
**bundle_id** | **character** | The identifier of a content bundle linked to this job. | [optional] 
**start_time** | **character** | The timestamp (RFC3339) indicating when this job started. | [optional] 
**end_time** | **character** | The timestamp (RFC3339) indicating when this job finished. | [optional] 
**last_heartbeat_time** | **character** | The timestamp (RFC3339) indicating the last time  this job was observed to be running. | [optional] 
**queued_time** | **character** | The timestamp (RFC3339) indicating when this job was added to the queue to be processed. Only scheduled reports will present a value for this field. | [optional] 
**queue_name** | **character** | The name of the queue which processes the job. Only scheduled reports  will present a value for this field. | [optional] 
**tag** | **character** | A tag to identify the nature of the job. It can be one of &#x60;unknown&#x60;, &#x60;build_report&#x60;, &#x60;build_site&#x60;, &#x60;build_jupyter&#x60;, &#x60;packrat_restore&#x60;, &#x60;python_restore&#x60;, &#x60;configure_report&#x60;, &#x60;run_app&#x60;, &#x60;run_api&#x60;, &#x60;run_tensorflow&#x60; (obsolete), &#x60;run_python_api&#x60;, &#x60;run_dash_app&#x60;, &#x60;run_streamlit&#x60;, &#x60;run_bokeh_app&#x60;, &#x60;run_fastapi_app&#x60;, &#x60;run_pyshiny_app&#x60;, &#x60;render_shiny&#x60;, &#x60;run_voila_app&#x60;, &#x60;testing&#x60;, &#x60;git&#x60;, &#x60;val_py_ext_pkg&#x60;, &#x60;val_r_ext_pkg&#x60;, &#x60;val_r_install&#x60;. | [optional] 
**exit_code** | **integer** | The job&#39;s exit code. Present only when job is finished. | [optional] 
**status** | **integer** | The current status of the job. It can be one of Active: &#x60;0&#x60;, Finished: &#x60;1&#x60;, Finalized: &#x60;2&#x60;. | [optional] 
**hostname** | **character** | The name of the node which processes the job. | [optional] 
**cluster** | **character** | The location where this content runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string &#x60;Local&#x60;. Gives the name of the cluster when run external to the Connect host. | [optional] 
**image** | **character** | The location where this content runs. Content running on the same server as Connect will have either a &#x60;null&#x60; value or the string &#x60;Local&#x60;. References the name of the target image when content runs in a clustered environment such as Kubernetes. | [optional] 
**run_as** | **character** | The UNIX user that executed this job. | [optional] 


