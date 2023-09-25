# connectapi2::BundleMetadata

Metadata object associated with this bundle.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source** | **character** | Source for this bundle. &#x60;null&#x60; for uploaded bundles, or &#x60;git&#x60; for bundles fetched from a git repository. | [optional] [readonly] 
**source_repo** | **character** | Git repository URL for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] [readonly] 
**source_branch** | **character** | Git repository branch name for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] [readonly] 
**source_commit** | **character** | Git commit ID (hash) for this bundle. &#x60;null&#x60; for bundles that were not fetched from a git repository. | [optional] [readonly] 
**archive_md5** | **character** | MD5 hash of the archive file for this bundle. &#x60;null&#x60; for bundles uploaded before this field was added. | [optional] [readonly] 
**archive_sha1** | **character** | SHA1 hash of the archive file for this bundle. &#x60;null&#x60; for bundles uploaded before this field was added. | [optional] [readonly] 


