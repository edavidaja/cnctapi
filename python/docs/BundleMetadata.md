# BundleMetadata

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source** | **str** | Source for this bundle. &#x60;null&#x60; for uploaded bundles, or &#x60;git&#x60; for bundles fetched from a git repository. | [optional] 
**source_repo** | **str** | Git repository URL for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] 
**source_branch** | **str** | Git repository branch name for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] 
**source_commit** | **str** | Git commit ID (hash) for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] 
**archive_md5** | **str** | MD5 hash of the archive file for this bundle. &#x60;null&#x60; for bundles uploaded before this field was added. | [optional] 
**archive_sha1** | **str** | SHA1 hash of the archive file for this bundle. &#x60;null&#x60; for bundles uploaded before this field was added. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

