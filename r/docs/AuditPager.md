# connectapi2::AuditPager

Paging object that can be used for navigation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cursors** | [**AuditPagerCursors**](AuditPager_cursors.md) |  | 
**first** | **character** | A full URL of the first page of results.  It will be &#x60;null&#x60; if the current response represents the first page of results. | 
**previous** | **character** | A full URL of the previous page of results when the curent request was made.  It will be &#x60;null&#x60; if the current response represents the first page of results. | 
**next** | **character** | A full URL of the next page of results when the current request was made.  It will be &#x60;null&#x60; if the current response represents the last page of results. | 
**last** | **character** | A full URL of the last page of results.  It will be &#x60;null&#x60; if the current response represents the last page of results. | 


