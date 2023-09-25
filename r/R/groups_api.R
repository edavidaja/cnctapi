#' Posit Connect API Reference
#'
#' The Posit Connect Server API can be used to perform certain user actions remotely. You will need to install a tool or library that can make HTTP requests, such as: - [httr](http://httr.r-lib.org/) (R HTTP library) - [curl](https://curl.se/) (Linux tool for making HTTP calls) - [requests](https://requests.readthedocs.io/en/master/) (Python HTTP library)  Please note that all API paths are relative to the base API URL (e.g., <code>http:/localhost:3939/\\_\\_api\\_\\_</code>). Unless otherwise noted, all endpoints which accept a request body will require the body to be in JSON format. Similarly, all response bodies will be returned in JSON format.  <a id=\"download\"></a> ## Specifications  The Posit Connect Server API Swagger specification is available for download as either JSON or YAML. Both formats contain the same information, also presented on this page.  * <a href=\"swagger.json\" title=\"Swagger (JSON)\" target=\"_blank\">Swagger (JSON)</a> * <a href=\"swagger.yaml\" title=\"Swagger (YAML)\" target=\"_blank\">Swagger (YAML)</a>  <a id=\"versioning-policy\"></a> ## Versioning of the API  The Posit Connect Server API uses a simple, single number versioning scheme as noted as the first part of each endpoint path.  This version number will only be incremented in the event that non-backward compatible changes are made to an existing endpoint. Note that this occurs on a per-endpoint basis; see the section on [deprecation](#deprecation) below for more information.  Changes that are considered backward compatible are:  * New fields in responses. * New non-required fields in requests. * New endpoint behavior which does not violate the current functional intent of the   endpoint.  Changes that are considered non-backward compatible are:  * Removal or rename of request or response fields. * A change of the type or format of one or more request or response fields. * Addition of new required request fields. * A substantial deviation from the current functional intent of the endpoint.  The points relating to functional intent are assumed to be extremely rare as more often such situations will result in a completely new endpoint, which makes the change a backward compatible addition.  ### Experimentation  Posit Connect labels experimental endpoints in the API by including `/experimental` in the endpoint path immediately after the version indicator.  If an endpoint is noted as experimental, it should not be relied upon for any production work.  These are endpoints that Posit Connect is making available to our customers to solicit feedback; they are subject to change without notice.  Such changes include anything from altered request/response shapes, to complete abandonment of the endpoint.  This public review of an experimental endpoint will last as long as necessary to either prove its viability or to determine that it’s not really needed.  The time for this will vary based on the intricacies of each endpoint.  When the endpoint is finalized, the next release of Posit Connect will mark the experimental path as deprecated while adding the endpoint without the `/experimental` prefix. The path with the experimental prefix will be removed six months later.  The documentation for the endpoint will also note, during that time, the original, experimental, path.  All experimental endpoints are clearly marked as such in this documentation.  <a id=\"deprecation\"></a> ### Deprecation and Removal of Old Versions  It is possible that Posit Connect may decide to deprecate an endpoint.  This will happen if either the endpoint serves no useful purpose because it’s functionality is now handled by a different endpoint or because there is a newer version of the endpoint that should be used.  If a deprecated endpoint is called, the response to it will include an extra HTTP header called, `X-Deprecated-Endpoint` and will have as a value the path of the endpoint that should be used instead.  If the functionality has no direct replacement, the value will be set to `n/a`.  Deprecated versions of an endpoint will be supported for 1 year from the release date of Posit Connect in which the endpoint was marked as deprecated.  At that time, the endpoint is subject to removal at the discretion of Posit Connect.  The life cycle of an endpoint will follow these steps.  1. The `/v1/endpoint` is public and in use by Posit Connect customers. 1. Posit Connect makes `/v2/experimental/endpoint` available for testing and feedback.    Customers should still use `/v1/endpoint` for production work. 1. Posit Connect moves version 2 of the endpoint out of experimentation so, all within    the same release:     1. `/v1/endpoint` is marked as deprecated.     1. `/v2/experimental/endpoint` is marked as deprecated.     1. `/v2/endpoint` is made public. 1. Six months later, `/v2/experimental/endpoint` is removed from the product. 1. Twelve months later, `/v1/endpoint` is removed from the product.  Note that it is possible that Posit Connect may produce a new version of an existing endpoint without making an experimental version of it first.  The same life cycle, without those parts, will still be followed.  <a id=\"authentication\"> </a> ## Authentication  Most endpoints require you to identify yourself as a valid Posit Connect user. You do this by specifying an API Key when you make a call to the server. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  <a id=\"api-keys\"></a> ### API Keys  API Keys are managed by each user in the Posit Connect dashboard. If you ever lose an API Key or otherwise feel it has been compromised, use the dashboard to revoke the key and create another one.  **WARNING**: Keep your API Key safe.  If your Posit Connect server's URL does not begin with `https`, your API Key could be intercepted and used by a malicious actor.  Once you have an API Key, you can authenticate by passing the key with a prefix of `\"Key \"` (the space is important) in the Authorization header.  Below are examples of invoking the \"Get R Information\" endpoint.  **cURL** ```bash curl -H \"Authorization: Key XXXXXXXXXXX\" \\      https://positconnect.example.com/__api__/v1/server_settings/r ```  **R** ```r library(httr) apiKey <- \"XXXXXXXXXXX\" result <- GET(\"https://positconnect.example.com/__api__/v1/server_settings/r\",   add_headers(Authorization = paste(\"Key\", apiKey))) ```  **Python** ```python import requests r = requests.get(   'https://positconnect.example.com/__api__/v1/server_settings/r',   headers = { 'Authorization': 'Key XXXXXXXXXXX' } ) ```  <a id=\"api-cors-considerations\"></a> ## API CORS considerations  When accessing the Posit Connect API via a context that enforces CORS restrictions such as a browser, there are some configuration values that will likely need to be set.  Connect does not enable CORS headers and pre-flight requests by default; it must be enabled via the `CORS.Enabled` configuration option.  The CORS header values that are the same for all requests are  - `Access-Control-Allow-Methods` is set to `GET, POST, PUT, PATCH, DELETE, HEAD` - `Access-Control-Allow-Headers` is set to `Origin, Content-Length, Content-Type` - `Access-Control-Max-Age` is set to 12 hours - `Access-Control-Allow-Credentials` is set to `true`  The remaining header value that may be configured is  - `Access-Control-Allow-Origin` which is set from the   `CORS.AllowOrigin` config value and is empty by   default, meaning only local origins and `Server.Address` are   allowed.  <a id=\"API-Error-Codes\"></a> ## API Error Codes  <table> <thead> <tr><th>Error&nbsp;Code</th><th>Message</th><th>HTTP status</th><th>HTTP message</th></tr> </thead> <tbody> <tr><td>1</td><td>An internal failure occurred.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>2</td><td>The requested method or endpoint is not supported.</td><td>404</td><td>Not Found</td></tr> <tr><td>3</td><td>The requested object ID is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>4</td><td>The requested object does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>5</td><td>Application name must be between 3 and 64 alphanumeric characters, dashes, and underscores.</td><td>400</td><td>Bad Request</td></tr> <tr><td>6</td><td>The password is not strong enough. Please try again.</td><td>400</td><td>Bad Request</td></tr> <tr><td>7</td><td>The requested username is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>8</td><td>The requested username is already in use. Usernames are case sensitive. Please ensure you are using the correct case.</td><td>409</td><td>Conflict</td></tr> <tr><td>9</td><td>The requested user could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>10</td><td>The requested object doesn&#39;t belong to you.</td><td>403</td><td>Forbidden</td></tr> <tr><td>11</td><td>The requested filter could not be applied.</td><td>400</td><td>Bad Request</td></tr> <tr><td>12</td><td>A required parameter is missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>13</td><td>The requested range is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>14</td><td>Group name must be between less than 4096 alphanumeric characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>15</td><td>The requested group name is already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>16</td><td>The user is already a member of the group.</td><td>409</td><td>Conflict</td></tr> <tr><td>17</td><td>The requested item could not be removed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>18</td><td>The requested item could not be changed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>19</td><td>You don&#39;t have permission to access this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>20</td><td>You don&#39;t have permission to remove this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>21</td><td>You don&#39;t have permission to change this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>22</td><td>You don&#39;t have permission to perform this operation.</td><td>403</td><td>Forbidden</td></tr> <tr><td>23</td><td>You don&#39;t have permission to give the user this role.</td><td>403</td><td>Forbidden</td></tr> <tr><td>24</td><td>The requested operation requires authentication.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>25</td><td>The parameter is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>26</td><td>An object with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>27</td><td>This version of R is in use and cannot be deleted.</td><td>409</td><td>Conflict</td></tr> <tr><td>28</td><td>No application bundle to deploy.</td><td>404</td><td>Not Found</td></tr> <tr><td>29</td><td>The token is expired. Authentication tokens must be claimed within one hour.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>30</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>31</td><td>Password change prohibited.</td><td>403</td><td>Forbidden</td></tr> <tr><td>32</td><td>The requested filter is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>33</td><td>This user cannot be added as a collaborator because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>34</td><td>The application&#39;s owner cannot be added as a collaborator or viewer.</td><td>400</td><td>Bad Request</td></tr> <tr><td>35</td><td>Cannot delete object as it is being used elsewhere.</td><td>409</td><td>Conflict</td></tr> <tr><td>36</td><td>This user&#39;s username has already been set and cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>37</td><td>Schedules must have a start time and it must be after 1/1/2010.</td><td>400</td><td>Bad Request</td></tr> <tr><td>38</td><td>The application&#39;s manifest is invalid or missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>39</td><td>The application does not support this action.</td><td>400</td><td>Bad Request</td></tr> <tr><td>40</td><td>The current user has not been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>41</td><td>The initial user must specify a password; it cannot be generated.</td><td>400</td><td>Bad Request</td></tr> <tr><td>42</td><td>The user has already been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>43</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>44</td><td>The current user does not have an email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>45</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the Scheduler.MinProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>46</td><td>Internal user fields cannot be changed via API.</td><td>400</td><td>Bad Request</td></tr> <tr><td>47</td><td>You cannot log in because the configured policy requires that the Posit Connect administrator provision your account first. Please contact your administrator.</td><td>403</td><td>Forbidden</td></tr> <tr><td>48</td><td>You cannot change the type of application once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>49</td><td>You don&#39;t have permission to lock/unlock this user.</td><td>403</td><td>Forbidden</td></tr> <tr><td>50</td><td>This user is locked.</td><td>403</td><td>Forbidden</td></tr> <tr><td>51</td><td>Vanity path conflicts with one or more already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>52</td><td>Vanity path is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>53</td><td>Immutable field cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>54</td><td>You cannot set this content to run as the current user</td><td>400</td><td>Bad Request</td></tr> <tr><td>55</td><td>Custom RunAs settings are prohibited for static content.</td><td>400</td><td>Bad Request</td></tr> <tr><td>56</td><td>The RunAs setting references a prohibited Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>57</td><td>The RunAs setting does not reference a valid Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>58</td><td>The RunAs setting references a Unix account that does not have the correct group membership.</td><td>400</td><td>Bad Request</td></tr> <tr><td>59</td><td>There is no rendering available.</td><td>400</td><td>Bad Request</td></tr> <tr><td>60</td><td>This email address is not allowed to login to this server.</td><td>400</td><td>Bad Request</td></tr> <tr><td>61</td><td>You cannot change the role of the only remaining administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>62</td><td>An API key name must not be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>63</td><td>There was a problem communicating with the LDAP authentication server. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>64</td><td>The number of users permitted by this license has been exceeded. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>65</td><td>API applications are not permitted by your license.</td><td>403</td><td>Forbidden</td></tr> <tr><td>66</td><td>You cannot assign ownership to another user.</td><td>400</td><td>Bad Request</td></tr> <tr><td>67</td><td>You must provide the source_key for an existing variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>68</td><td>You cannot promote a variant without a valid rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>69</td><td>The bundle ID of the source and target variants must match</td><td>400</td><td>Bad Request</td></tr> <tr><td>70</td><td>Target rendering is more recent than source rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>71</td><td>Only parameterized documents support promoting output</td><td>400</td><td>Bad Request</td></tr> <tr><td>72</td><td>Not allowed to create schedule with different application association than its variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>73</td><td>You may not schedule ad-hoc variants</td><td>400</td><td>Bad Request</td></tr> <tr><td>74</td><td>The requested report name is not permitted</td><td>400</td><td>Bad Request</td></tr> <tr><td>75</td><td>You may not delete the active bundle for an application</td><td>400</td><td>Bad Request</td></tr> <tr><td>76</td><td>A user using the same Unique ID already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>77</td><td>A tag name cannot be more than 255 characters</td><td>400</td><td>Bad Request</td></tr> <tr><td>78</td><td>A tag must have a name</td><td>400</td><td>Bad Request</td></tr> <tr><td>79</td><td>Cannot assign a category to an app</td><td>400</td><td>Bad Request</td></tr> <tr><td>80</td><td>The target object does not match the provided version.</td><td>409</td><td>Conflict</td></tr> <tr><td>81</td><td>Duplicate names are not permitted; a sibling tag or category already has this name</td><td>400</td><td>Bad Request</td></tr> <tr><td>82</td><td>The bundle for deployment must belong to the target application.</td><td>400</td><td>Bad Request</td></tr> <tr><td>83</td><td>Too many search results. Be more specific.</td><td>400</td><td>Bad Request</td></tr> <tr><td>84</td><td>The token has already been claimed. Tokens can only be claimed once.</td><td>403</td><td>Forbidden</td></tr> <tr><td>85</td><td>A token using the same token key already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>86</td><td>A new token MUST contain a public_key and token in the json body.</td><td>400</td><td>Bad Request</td></tr> <tr><td>87</td><td>The request body cannot be parsed</td><td>400</td><td>Bad Request</td></tr> <tr><td>88</td><td>Cannot apply the requested change because it would make the target object an ancestor of itself.</td><td>400</td><td>Bad Request</td></tr> <tr><td>89</td><td>Unable to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>90</td><td>User self-registration is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>91</td><td>The external authentication provider did not provide a valid username.</td><td>400</td><td>Bad Request</td></tr> <tr><td>92</td><td>XSRF token mismatch</td><td>403</td><td>Forbidden</td></tr> <tr><td>93</td><td>Private variants cannot be configured to email users other than the owner</td><td>403</td><td>Forbidden</td></tr> <tr><td>94</td><td>You can only request a permissions upgrade once per 24-hour period.</td><td>400</td><td>Bad Request</td></tr> <tr><td>95</td><td>This API does not allow the current authentication type.</td><td>403</td><td>Forbidden</td></tr> <tr><td>96</td><td>Incorrect current password.</td><td>403</td><td>Forbidden</td></tr> <tr><td>97</td><td>Changing host or scheme in redirect is forbidden.</td><td>403</td><td>Forbidden</td></tr> <tr><td>98</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>99</td><td>Please re-supply your credentials.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>100</td><td>Unable to remove item. It is being processed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>101</td><td>The provided password change token is invalid.</td><td>403</td><td>Forbidden</td></tr> <tr><td>102</td><td>A schedule for this variant already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>103</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>104</td><td>The content checksum header and body MD5 sum are not equal.</td><td>400</td><td>Bad Request</td></tr> <tr><td>105</td><td>TensorFlow Model APIs are not supported.</td><td>502</td><td>Bad Gateway</td></tr> <tr><td>106</td><td>Unable to update environment variables because they were changed while you were editing them.</td><td>409</td><td>Conflict</td></tr> <tr><td>107</td><td>That username is not allowed because it is prohibited by policy.</td><td>400</td><td>Bad Request</td></tr> <tr><td>108</td><td>Environment changes contain a prohibited variable</td><td>409</td><td>Conflict</td></tr> <tr><td>109</td><td>This type of content is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>110</td><td>You cannot change the categorization of content once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>111</td><td>You cannot change if an app is parameterized once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>112</td><td>The provided user role is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>113</td><td>Invalid MaxProcesses setting. The MaxProcesses setting may not exceed the Scheduler.MaxProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>114</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the MaxProcesses setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>115</td><td>The provided status is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>116</td><td>The requested rendering does not match the variant.</td><td>400</td><td>Bad Request</td></tr> <tr><td>117</td><td>Unknown access type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>118</td><td>This access type is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>119</td><td>The authentication provider does not support creating records from a retrieved ticket. POST new content instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>120</td><td>The authentication provider does not support creating records from POST content. PUT a retrieved ticket instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>121</td><td>The request JSON is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>122</td><td>Application title must be between 3 and 1024 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>123</td><td>Application description must be 4096 characters or less.</td><td>400</td><td>Bad Request</td></tr> <tr><td>124</td><td>No administrator has a configured email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>125</td><td>Content-Length cannot be 0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>126</td><td>Request Content-Length did not match the number of bytes received.</td><td>400</td><td>Bad Request</td></tr> <tr><td>127</td><td>The temp_ticket is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>128</td><td>The email address cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>129</td><td>The user unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>130</td><td>The group unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>131</td><td>A group using the same unique ID already exists.</td><td>400</td><td>Bad Request</td></tr> <tr><td>132</td><td>The configured provider cannot access this endpoint.</td><td>400</td><td>Bad Request</td></tr> <tr><td>133</td><td>The source variant belongs to a different app.</td><td>400</td><td>Bad Request</td></tr> <tr><td>134</td><td>Unable to write bundle to disk.</td><td>400</td><td>Bad Request</td></tr> <tr><td>135</td><td>Unable to extract the bundle.</td><td>400</td><td>Bad Request</td></tr> <tr><td>136</td><td>Time values must be in RFC3339 format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>137</td><td>The start of the time interval cannot be in the past, or more than 5 years in the future.</td><td>400</td><td>Bad Request</td></tr> <tr><td>138</td><td>The end of the time interval cannot be earlier than the start time.</td><td>400</td><td>Bad Request</td></tr> <tr><td>139</td><td>The length of the time interval cannot be more than 1 year.</td><td>400</td><td>Bad Request</td></tr> <tr><td>140</td><td>The time interval must have both start and end times.</td><td>400</td><td>Bad Request</td></tr> <tr><td>141</td><td>Task lookup failures can indicate that a load balancer is not using sticky sessions or a client is not including the session cookie. Details: https://docs.posit.co/connect/admin/load-balancing/</td><td>404</td><td>Not Found</td></tr> <tr><td>142</td><td>The app is already managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>143</td><td>The app is not managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>144</td><td>Uploading a content bundle is not allowed for this application since it is managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>145</td><td>Git support is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>146</td><td>Git URLs must be absolute and cannot have username, query, or fragment.</td><td>400</td><td>Bad Request</td></tr> <tr><td>147</td><td>The specified app mode is not executable.</td><td>400</td><td>Bad Request</td></tr> <tr><td>148</td><td>The specified app mode is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>149</td><td>Environment changes contain a duplicated variable name.</td><td>409</td><td>Conflict</td></tr> <tr><td>150</td><td>The load factor must be between 0.0 and 1.0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>151</td><td>The timeout must be between 0 and 2592000 seconds.</td><td>400</td><td>Bad Request</td></tr> <tr><td>152</td><td>The principal type must be &#39;user&#39; or &#39;group&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>153</td><td>The requested group could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>154</td><td>The requested user is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>155</td><td>The requested group is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>156</td><td>This user cannot be assigned as the owner because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>157</td><td>The requested parent tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>158</td><td>The requested tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>159</td><td>The permission request submitted already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>160</td><td>The email notification for a permission request cannot be delivered due to missing or invalid email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>161</td><td>The include option specified is not valid</td><td>400</td><td>Bad Request</td></tr> <tr><td>162</td><td>The specified hostname is not an active Connect host</td><td>400</td><td>Bad Request</td></tr> <tr><td>163</td><td>The specified job cannot be terminated because it is not active</td><td>409</td><td>Conflict</td></tr> <tr><td>164</td><td>Git URLs must use HTTP or HTTPS.</td><td>400</td><td>Bad Request</td></tr> <tr><td>165</td><td>Cannot create bootstrapping user due to existing users</td><td>403</td><td>Forbidden</td></tr> <tr><td>166</td><td>The provided JWT is invalid</td><td>401</td><td>Unauthorized</td></tr> <tr><td>167</td><td>The controls file coundn&#39;t be read.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>168</td><td>The title must be between 1 and 64 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>169</td><td>The description cannot be more than 4096 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>170</td><td>The cluster_name must be &#39;Kubernetes&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>171</td><td>A unique name for the environment must be provided.</td><td>400</td><td>Bad Request</td></tr> <tr><td>172</td><td>Unknown matching type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>173</td><td>The installation path must be an absolute Unix filepath.</td><td>400</td><td>Bad Request</td></tr> <tr><td>174</td><td>The installation version must use semantic version format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>175</td><td>An environment with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>176</td><td>The specified service account name is not a valid DNS subdomain.</td><td>400</td><td>Bad Request</td></tr> <tr><td>177</td><td>The supervisor path may not contain any of the following whitespace control characters: \\t\\n\\b\\f\\n</td><td>400</td><td>Bad Request</td></tr> <tr><td>178</td><td>The specified service account name is not recognized by launcher in the Kubernetes namespace.</td><td>400</td><td>Bad Request</td></tr> <tr><td>179</td><td>Unsupported runtime language identifier</td><td>400</td><td>Bad Request</td></tr> <tr><td>180</td><td>The request did not identify a cache location</td><td>400</td><td>Bad Request</td></tr> <tr><td>181</td><td>Invalid MemoryRequest setting. The MemoryRequest setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>182</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the Scheduler.MaxMemoryRequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>183</td><td>Invalid MemoryLimit setting. The MemoryLimit setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>184</td><td>Invalid MemoryLimit setting. The MemoryLimit setting may not exceed the Scheduler.MaxMemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>185</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the MemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>186</td><td>Invalid CPURequest setting. The CPURequest setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>187</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the Scheduler.MaxCPURequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>188</td><td>Invalid CPULimit setting. The CPULimit setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>189</td><td>Invalid CPULimit setting. The CPULimit setting may not exceed the Scheduler.MaxCPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>190</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the CPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>191</td><td>Invalid MinProcesses setting. The MinProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>192</td><td>Invalid MaxProcesses setting. The MaxProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>193</td><td>When provided, the default_image_name cannot be empty and may not contain any whitespace characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>194</td><td>Runtime cache management is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>195</td><td>Invalid configuration. Service accounts cannot be set on content. Please contact an administrator to update Connect&#39;s server configuration to enable this feature.</td><td>400</td><td>Bad Request</td></tr> </tbody> </table> 
#'
#' The version of the OpenAPI document: 2023.09.0
#' Contact: support@posit.co
#' Generated by: https://openapi-generator.tech
#'
#' @docType class
#' @title Groups operations
#' @description GroupsApi
#' @format An \code{R6Class} generator object
#' @field api_client Handles the client-server communication.
#'
#' @section Methods:
#' \describe{
#' \strong{ AddGroupMember } \emph{ Add a group member }
#' This endpoint adds a user to a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to modify a group you do   not own.
#'
#' \itemize{
#' \item \emph{ @param } group_guid character
#' \item \emph{ @param } user \link{AddGroupMemberRequest}
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 204 | This response is returned only when the user was successfully added to the group.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 409 | The request could not be completed due to a conflict.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ CreateGroup } \emph{ Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) }
#' This endpoint creates the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to create   groups.
#'
#' \itemize{
#' \item \emph{ @param } group \link{CreateGroupRequest}
#' \item \emph{ @returnType } \link{Group} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The group object
#'
#' \item return type : Group
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 409 | The request could not be completed due to a conflict.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ CreateRemoteGroup } \emph{ Create a group using details from a remote authentication provider (LDAP) }
#' This endpoint creates the given group on the Posit Connect server.  - This endpoint is used only for LDAP authentication. Password,   PAM, SAML, OAuth2 and Proxied authentication providers should   use the    <a href=\"#post-/v1/groups\">POST /v1/groups</a>   endpoint. - Publisher or administrator access is required to access this   endpoint. - Group members will be automatically populated from the LDAP server.  #### Group Creation Workflow on LDAP  The API lets you identify an existing group in the LDAP system and create a corresponding group on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/groups/remote\">GET /v1/groups/remote</a>   endpoint. This endpoint will return a list of potential   matching groups in LDAP. A group that does not exist in   Posit Connect will lack a `guid`. Note the `temp_ticket`   for the desired group. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding group on Posit Connect.  The [Create a Group from LDAP](../cookbook/groups/#create-group-ldap) recipe in the API Cookbook has sample code using this workflow.
#'
#' \itemize{
#' \item \emph{ @param } request \link{CreateRemoteGroupRequest}
#' \item \emph{ @returnType } \link{Group} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The group object
#'
#' \item return type : Group
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 409 | The request could not be completed due to a conflict.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ DeleteGroup } \emph{ Delete a group }
#' Delete the given group.  - This endpoint can be used only when groups are enabled in   Posit Connnect and will return an error otherwise. - Administrator access is required to delete a group you do   not own.
#'
#' \itemize{
#' \item \emph{ @param } guid character
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 204 | This response is returned only when the group was successfully removed.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ GetGroup } \emph{ Get group details }
#' Get detailed information on a specific group.  This endpoint is available only when groups are enabled in Posit Connect.
#'
#' \itemize{
#' \item \emph{ @param } guid character
#' \item \emph{ @returnType } \link{Group} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The requested group details.
#'
#' \item return type : Group
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ GetGroupMembers } \emph{ Get group member details }
#' This endpoint gets the group member details. Group member enumeration is currently not supported for LDAP.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled.
#'
#' \itemize{
#' \item \emph{ @param } group_guid character
#' \item \emph{ @returnType } \link{GroupMembers} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The requested group member details.
#'
#' \item return type : GroupMembers
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ GetGroupOwnership } \emph{ List content for which a group with given GUID has access to }
#' This endpoint takes a group GUID and returns a list of content items with access control lists that the given group is listed on. This includes content accessible only by specific users or groups that include the given group, as well as content accessible by anyone or only logged-in users that includes the given group as a collaborator.
#'
#' \itemize{
#' \item \emph{ @param } guid character
#' \item \emph{ @returnType } list( \link{GroupOwnershipContent} ) \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | List of ownership details for each content item to which the requested group has access.
#'
#' \item return type : array[GroupOwnershipContent]
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ GetGroups } \emph{ List or search for group details }
#' This endpoint lists or searches for local groups.  - For a `prefix` search, results are sorted based on   similarity to the `prefix`. A `prefix` search ignores   `asc_order`. The first page of results will always be   returned. - The `prefix` can also be an exact match for the   group's DN (for LDAP) or the auth provider's unique ID   for the group, if any. - For a non-`prefix` search, results are sorted by group name.  This endpoint is available only when groups are enabled in Posit Connect and it will return an error otherwise.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.
#'
#' \itemize{
#' \item \emph{ @param } prefix character
#' \item \emph{ @param } page_number integer
#' \item \emph{ @param } page_size integer
#' \item \emph{ @param } asc_order character
#' \item \emph{ @returnType } \link{Groups} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The search results
#'
#' \item return type : Groups
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ RemoveGroupMember } \emph{ Remove a group member }
#' This endpoint removes a user from a group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. If the auth provider   is configured to provide group membership information,   then it is not possible to add/remove members via this API. - Administrator access is required to remove a user from a   group you do not own, but no special access is needed to   remove yourself from a group.
#'
#' \itemize{
#' \item \emph{ @param } group_guid character
#' \item \emph{ @param } user_guid character
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 204 | This response is returned only when the user was successfully removed from the group.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ SearchRemoteGroups } \emph{ Search for group details from a remote provider }
#' This endpoint is used to support operations against groups not managed by Connect, such as  <a href=\"#post-/v1/groups\">creating LDAP groups</a> See <a href=\"#get-/v1/groups\">GET /v1/groups</a> for listing groups on Posit Connect.  This endpoint searches for groups on Posit Connect and on your LDAP system.  Results are sorted based on similarity to the `prefix`.  - This endpoint can be used only by LDAP authentication and   will return an error otherwise. - Publisher or administrator access is required to access this   endpoint.
#'
#' \itemize{
#' \item \emph{ @param } prefix character
#' \item \emph{ @param } limit integer
#' \item \emph{ @returnType } \link{GroupRemoteSearch} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The search results.
#'
#' \item return type : GroupRemoteSearch
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' \strong{ UpdateGroup } \emph{ Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) }
#' This endpoint modifies the given group.  - This endpoint is available only when groups are enabled   in Posit Connect and only for Password, PAM, OAuth2,   SAML and Proxied authentication. - Publisher or administrator access is required to modify   groups.
#'
#' \itemize{
#' \item \emph{ @param } guid character
#' \item \emph{ @param } group \link{UpdateGroupRequest}
#' \item \emph{ @returnType } \link{Group} \cr
#'
#' \item On encountering errors, an error of subclass ApiException will be thrown.
#'
#' \item status code : 200 | The group object
#'
#' \item return type : Group
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 400 | The requested operation is invalid.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 401 | The requested operation requires authentication.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 403 | You do not have permission to perform this operation.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 404 | The requested object does not exist.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 409 | The request could not be completed due to a conflict.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 500 | A server error occurred.
#'
#'
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' \item status code : 0 | An error occurred invoking the API.
#'
#' \item return type : object
#' \item response headers :
#'
#' \tabular{ll}{
#' }
#' }
#'
#' }
#'
#'
#' @examples
#' \dontrun{
#' ####################  AddGroupMember  ####################
#'
#' library(connectapi2)
#' var_group_guid <- "group_guid_example" # character | The group's unique identifier
#' var_user <- addGroupMember_request$new("user_guid_example") # AddGroupMemberRequest | The user to add as a member
#'
#' #Add a group member
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  CreateGroup  ####################
#'
#' library(connectapi2)
#' var_group <- createGroup_request$new("name_example", "unique_id_example") # CreateGroupRequest | The new group values.
#'
#' #Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  CreateRemoteGroup  ####################
#'
#' library(connectapi2)
#' var_request <- createRemoteGroup_request$new("temp_ticket_example") # CreateRemoteGroupRequest | The request body needed for creating a group on the Posit Connect server.
#'
#' #Create a group using details from a remote authentication provider (LDAP) 
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  DeleteGroup  ####################
#'
#' library(connectapi2)
#' var_guid <- "guid_example" # character | The group's unique identifier
#'
#' #Delete a group
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  GetGroup  ####################
#'
#' library(connectapi2)
#' var_guid <- "guid_example" # character | The group's unique identifier
#'
#' #Get group details
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  GetGroupMembers  ####################
#'
#' library(connectapi2)
#' var_group_guid <- "group_guid_example" # character | The group's unique identifier
#'
#' #Get group member details
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  GetGroupOwnership  ####################
#'
#' library(connectapi2)
#' var_guid <- "guid_example" # character | 
#'
#' #List content for which a group with given GUID has access to
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  GetGroups  ####################
#'
#' library(connectapi2)
#' var_prefix <- "prefix_example" # character | Filters groups by prefix (group name). The filter is case insensitive. (Optional)
#' var_page_number <- 1 # integer | The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. For a `prefix` search, the first page of results will always be returned. (Optional)
#' var_page_size <- 20 # integer | The number of items to include in each page. This parameter is \"best effort\" since there may not be enough groups to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (Optional)
#' var_asc_order <- TRUE # character | Whether or not to return the groups in ascending order, sorted by name. For a `prefix` search, results are sorted first by exact match, then by increasing word length. (Optional)
#'
#' #List or search for group details
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  RemoveGroupMember  ####################
#'
#' library(connectapi2)
#' var_group_guid <- "group_guid_example" # character | The group's unique identifier
#' var_user_guid <- "user_guid_example" # character | The group member's unique identifier
#'
#' #Remove a group member
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  SearchRemoteGroups  ####################
#'
#' library(connectapi2)
#' var_prefix <- "prefix_example" # character | Search groups by prefix. `prefix` is case insensitive.
#' var_limit <- 20 # integer | The maximum number of groups to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (Optional)
#'
#' #Search for group details from a remote provider
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' ####################  UpdateGroup  ####################
#'
#' library(connectapi2)
#' var_guid <- "guid_example" # character | The group's unique identifier
#' var_group <- updateGroup_request$new("name_example", "owner_guid_example") # UpdateGroupRequest | The new group name and/or owner.
#'
#' #Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
#' api_instance <- connectapi2_api$new()
#'
#' # Configure API key authorization: apiKey
#' api_instance$api_client$api_keys["Authorization"] <- Sys.getenv("API_KEY")
#'
#'
#'
#' }
#' @importFrom R6 R6Class
#' @importFrom base64enc base64encode
#' @importFrom rlang abort
#' @export
GroupsApi <- R6::R6Class(
  "GroupsApi",
  public = list(
    api_client = NULL,
    #' Initialize a new GroupsApi.
    #'
    #' @description
    #' Initialize a new GroupsApi.
    #'
    #' @param api_client An instance of API client.
    #' @export
    initialize = function(api_client) {
      if (!missing(api_client)) {
        self$api_client <- api_client
      } else {
        self$api_client <- ApiClient$new()
      }
    },
    #' Add a group member
    #'
    #' @description
    #' Add a group member
    #'
    #' @param group_guid The group's unique identifier
    #' @param user The user to add as a member
    #' @param ... Other optional arguments
    #' @return void
    #' @export
    AddGroupMember = function(group_guid, user, ...) {
      local_var_response <- self$AddGroupMemberWithHttpInfo(group_guid, user, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Add a group member
    #'
    #' @description
    #' Add a group member
    #'
    #' @param group_guid The group's unique identifier
    #' @param user The user to add as a member
    #' @param ... Other optional arguments
    #' @return API response (void) with additional information such as HTTP status code, headers
    #' @export
    AddGroupMemberWithHttpInfo = function(group_guid, user, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`group_guid`)) {
        rlang::abort(message = "Missing required parameter `group_guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `group_guid`."))
      }

      if (missing(`user`)) {
        rlang::abort(message = "Missing required parameter `user`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `user`."))
      }



      if (!is.null(`user`)) {
        local_var_body <- `user`$toJSONString()
      } else {
        body <- NULL
      }

      local_var_url_path <- "/v1/groups/{group_guid}/members"
      if (!missing(`group_guid`)) {
        local_var_url_path <- gsub("\\{group_guid\\}", URLencode(as.character(`group_guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list("application/json")

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "POST",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        local_var_resp$content <- NULL
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @description
    #' Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @param group The new group values.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return Group
    #' @export
    CreateGroup = function(group, data_file = NULL, ...) {
      local_var_response <- self$CreateGroupWithHttpInfo(group, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @description
    #' Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @param group The new group values.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (Group) with additional information such as HTTP status code, headers
    #' @export
    CreateGroupWithHttpInfo = function(group, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`group`)) {
        rlang::abort(message = "Missing required parameter `group`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `group`."))
      }


      if (!is.null(`group`)) {
        local_var_body <- `group`$toJSONString()
      } else {
        body <- NULL
      }

      local_var_url_path <- "/v1/groups"
      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list("application/json")

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "POST",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "Group", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Create a group using details from a remote authentication provider (LDAP) 
    #'
    #' @description
    #' Create a group using details from a remote authentication provider (LDAP) 
    #'
    #' @param request The request body needed for creating a group on the Posit Connect server.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return Group
    #' @export
    CreateRemoteGroup = function(request, data_file = NULL, ...) {
      local_var_response <- self$CreateRemoteGroupWithHttpInfo(request, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Create a group using details from a remote authentication provider (LDAP) 
    #'
    #' @description
    #' Create a group using details from a remote authentication provider (LDAP) 
    #'
    #' @param request The request body needed for creating a group on the Posit Connect server.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (Group) with additional information such as HTTP status code, headers
    #' @export
    CreateRemoteGroupWithHttpInfo = function(request, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`request`)) {
        rlang::abort(message = "Missing required parameter `request`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `request`."))
      }


      if (!is.null(`request`)) {
        local_var_body <- `request`$toJSONString()
      } else {
        body <- NULL
      }

      local_var_url_path <- "/v1/groups"
      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list("application/json")

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "PUT",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "Group", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Delete a group
    #'
    #' @description
    #' Delete a group
    #'
    #' @param guid The group's unique identifier
    #' @param ... Other optional arguments
    #' @return void
    #' @export
    DeleteGroup = function(guid, ...) {
      local_var_response <- self$DeleteGroupWithHttpInfo(guid, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Delete a group
    #'
    #' @description
    #' Delete a group
    #'
    #' @param guid The group's unique identifier
    #' @param ... Other optional arguments
    #' @return API response (void) with additional information such as HTTP status code, headers
    #' @export
    DeleteGroupWithHttpInfo = function(guid, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`guid`)) {
        rlang::abort(message = "Missing required parameter `guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `guid`."))
      }


      local_var_url_path <- "/v1/groups/{guid}"
      if (!missing(`guid`)) {
        local_var_url_path <- gsub("\\{guid\\}", URLencode(as.character(`guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "DELETE",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        local_var_resp$content <- NULL
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Get group details
    #'
    #' @description
    #' Get group details
    #'
    #' @param guid The group's unique identifier
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return Group
    #' @export
    GetGroup = function(guid, data_file = NULL, ...) {
      local_var_response <- self$GetGroupWithHttpInfo(guid, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Get group details
    #'
    #' @description
    #' Get group details
    #'
    #' @param guid The group's unique identifier
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (Group) with additional information such as HTTP status code, headers
    #' @export
    GetGroupWithHttpInfo = function(guid, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`guid`)) {
        rlang::abort(message = "Missing required parameter `guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `guid`."))
      }


      local_var_url_path <- "/v1/groups/{guid}"
      if (!missing(`guid`)) {
        local_var_url_path <- gsub("\\{guid\\}", URLencode(as.character(`guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "GET",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "Group", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Get group member details
    #'
    #' @description
    #' Get group member details
    #'
    #' @param group_guid The group's unique identifier
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return GroupMembers
    #' @export
    GetGroupMembers = function(group_guid, data_file = NULL, ...) {
      local_var_response <- self$GetGroupMembersWithHttpInfo(group_guid, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Get group member details
    #'
    #' @description
    #' Get group member details
    #'
    #' @param group_guid The group's unique identifier
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (GroupMembers) with additional information such as HTTP status code, headers
    #' @export
    GetGroupMembersWithHttpInfo = function(group_guid, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`group_guid`)) {
        rlang::abort(message = "Missing required parameter `group_guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `group_guid`."))
      }


      local_var_url_path <- "/v1/groups/{group_guid}/members"
      if (!missing(`group_guid`)) {
        local_var_url_path <- gsub("\\{group_guid\\}", URLencode(as.character(`group_guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "GET",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "GroupMembers", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' List content for which a group with given GUID has access to
    #'
    #' @description
    #' List content for which a group with given GUID has access to
    #'
    #' @param guid 
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return array[GroupOwnershipContent]
    #' @export
    GetGroupOwnership = function(guid, data_file = NULL, ...) {
      local_var_response <- self$GetGroupOwnershipWithHttpInfo(guid, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' List content for which a group with given GUID has access to
    #'
    #' @description
    #' List content for which a group with given GUID has access to
    #'
    #' @param guid 
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (array[GroupOwnershipContent]) with additional information such as HTTP status code, headers
    #' @export
    GetGroupOwnershipWithHttpInfo = function(guid, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`guid`)) {
        rlang::abort(message = "Missing required parameter `guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `guid`."))
      }


      local_var_url_path <- "/v1/experimental/groups/{guid}/content"
      if (!missing(`guid`)) {
        local_var_url_path <- gsub("\\{guid\\}", URLencode(as.character(`guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "GET",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "array[GroupOwnershipContent]", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' List or search for group details
    #'
    #' @description
    #' List or search for group details
    #'
    #' @param prefix (optional) Filters groups by prefix (group name). The filter is case insensitive.
    #' @param page_number (optional) The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. For a `prefix` search, the first page of results will always be returned. (default value: 1)
    #' @param page_size (optional) The number of items to include in each page. This parameter is \"best effort\" since there may not be enough groups to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (default value: 20)
    #' @param asc_order (optional) Whether or not to return the groups in ascending order, sorted by name. For a `prefix` search, results are sorted first by exact match, then by increasing word length. (default value: TRUE)
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return Groups
    #' @export
    GetGroups = function(prefix = NULL, page_number = 1, page_size = 20, asc_order = TRUE, data_file = NULL, ...) {
      local_var_response <- self$GetGroupsWithHttpInfo(prefix, page_number, page_size, asc_order, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' List or search for group details
    #'
    #' @description
    #' List or search for group details
    #'
    #' @param prefix (optional) Filters groups by prefix (group name). The filter is case insensitive.
    #' @param page_number (optional) The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned. For a `prefix` search, the first page of results will always be returned. (default value: 1)
    #' @param page_size (optional) The number of items to include in each page. This parameter is \"best effort\" since there may not be enough groups to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned. (default value: 20)
    #' @param asc_order (optional) Whether or not to return the groups in ascending order, sorted by name. For a `prefix` search, results are sorted first by exact match, then by increasing word length. (default value: TRUE)
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (Groups) with additional information such as HTTP status code, headers
    #' @export
    GetGroupsWithHttpInfo = function(prefix = NULL, page_number = 1, page_size = 20, asc_order = TRUE, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE


      if (`page_number` < 1) {
        rlang::abort(message = "Invalid value for `page_number` when calling GroupsApi$GetGroups, must be bigger than or equal to 1.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Invalid value for `page_number` when calling GroupsApi$GetGroups, must be bigger than or equal to 1."))
      }

      if (`page_size` > 500) {
        rlang::abort(message = "Invalid value for `page_size` when calling GroupsApi$GetGroups, must be smaller than or equal to 500.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Invalid value for `page_size` when calling GroupsApi$GetGroups, must be smaller than or equal to 500."))
      }
      if (`page_size` < 1) {
        rlang::abort(message = "Invalid value for `page_size` when calling GroupsApi$GetGroups, must be bigger than or equal to 1.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Invalid value for `page_size` when calling GroupsApi$GetGroups, must be bigger than or equal to 1."))
      }


      query_params[["prefix"]] <- `prefix`

      query_params[["page_number"]] <- `page_number`

      query_params[["page_size"]] <- `page_size`

      query_params[["asc_order"]] <- `asc_order`

      local_var_url_path <- "/v1/groups"
      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "GET",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "Groups", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Remove a group member
    #'
    #' @description
    #' Remove a group member
    #'
    #' @param group_guid The group's unique identifier
    #' @param user_guid The group member's unique identifier
    #' @param ... Other optional arguments
    #' @return void
    #' @export
    RemoveGroupMember = function(group_guid, user_guid, ...) {
      local_var_response <- self$RemoveGroupMemberWithHttpInfo(group_guid, user_guid, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Remove a group member
    #'
    #' @description
    #' Remove a group member
    #'
    #' @param group_guid The group's unique identifier
    #' @param user_guid The group member's unique identifier
    #' @param ... Other optional arguments
    #' @return API response (void) with additional information such as HTTP status code, headers
    #' @export
    RemoveGroupMemberWithHttpInfo = function(group_guid, user_guid, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`group_guid`)) {
        rlang::abort(message = "Missing required parameter `group_guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `group_guid`."))
      }

      if (missing(`user_guid`)) {
        rlang::abort(message = "Missing required parameter `user_guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `user_guid`."))
      }



      local_var_url_path <- "/v1/groups/{group_guid}/members/{user_guid}"
      if (!missing(`group_guid`)) {
        local_var_url_path <- gsub("\\{group_guid\\}", URLencode(as.character(`group_guid`), reserved = TRUE), local_var_url_path)
      }

      if (!missing(`user_guid`)) {
        local_var_url_path <- gsub("\\{user_guid\\}", URLencode(as.character(`user_guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "DELETE",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        local_var_resp$content <- NULL
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Search for group details from a remote provider
    #'
    #' @description
    #' Search for group details from a remote provider
    #'
    #' @param prefix Search groups by prefix. `prefix` is case insensitive.
    #' @param limit (optional) The maximum number of groups to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (default value: 20)
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return GroupRemoteSearch
    #' @export
    SearchRemoteGroups = function(prefix, limit = 20, data_file = NULL, ...) {
      local_var_response <- self$SearchRemoteGroupsWithHttpInfo(prefix, limit, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Search for group details from a remote provider
    #'
    #' @description
    #' Search for group details from a remote provider
    #'
    #' @param prefix Search groups by prefix. `prefix` is case insensitive.
    #' @param limit (optional) The maximum number of groups to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned. (default value: 20)
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (GroupRemoteSearch) with additional information such as HTTP status code, headers
    #' @export
    SearchRemoteGroupsWithHttpInfo = function(prefix, limit = 20, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`prefix`)) {
        rlang::abort(message = "Missing required parameter `prefix`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `prefix`."))
      }


      if (`limit` > 500) {
        rlang::abort(message = "Invalid value for `limit` when calling GroupsApi$SearchRemoteGroups, must be smaller than or equal to 500.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Invalid value for `limit` when calling GroupsApi$SearchRemoteGroups, must be smaller than or equal to 500."))
      }
      if (`limit` < 1) {
        rlang::abort(message = "Invalid value for `limit` when calling GroupsApi$SearchRemoteGroups, must be bigger than or equal to 1.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Invalid value for `limit` when calling GroupsApi$SearchRemoteGroups, must be bigger than or equal to 1."))
      }

      query_params[["prefix"]] <- `prefix`

      query_params[["limit"]] <- `limit`

      local_var_url_path <- "/v1/groups/remote"
      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list()

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "GET",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "GroupRemoteSearch", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    },
    #' Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @description
    #' Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @param guid The group's unique identifier
    #' @param group The new group name and/or owner.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return Group
    #' @export
    UpdateGroup = function(guid, group, data_file = NULL, ...) {
      local_var_response <- self$UpdateGroupWithHttpInfo(guid, group, data_file = data_file, ...)
      if (local_var_response$status_code >= 200 && local_var_response$status_code <= 299) {
        local_var_response$content
      } else if (local_var_response$status_code >= 300 && local_var_response$status_code <= 399) {
        local_var_response
      } else if (local_var_response$status_code >= 400 && local_var_response$status_code <= 499) {
        local_var_response
      } else if (local_var_response$status_code >= 500 && local_var_response$status_code <= 599) {
        local_var_response
      }
    },
    #' Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @description
    #' Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
    #'
    #' @param guid The group's unique identifier
    #' @param group The new group name and/or owner.
    #' @param data_file (optional) name of the data file to save the result
    #' @param ... Other optional arguments
    #' @return API response (Group) with additional information such as HTTP status code, headers
    #' @export
    UpdateGroupWithHttpInfo = function(guid, group, data_file = NULL, ...) {
      args <- list(...)
      query_params <- list()
      header_params <- c()
      form_params <- list()
      file_params <- list()
      local_var_body <- NULL
      oauth_scopes <- NULL
      is_oauth <- FALSE

      if (missing(`guid`)) {
        rlang::abort(message = "Missing required parameter `guid`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `guid`."))
      }

      if (missing(`group`)) {
        rlang::abort(message = "Missing required parameter `group`.",
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0,
                                                     reason = "Missing required parameter `group`."))
      }



      if (!is.null(`group`)) {
        local_var_body <- `group`$toJSONString()
      } else {
        body <- NULL
      }

      local_var_url_path <- "/v1/groups/{guid}"
      if (!missing(`guid`)) {
        local_var_url_path <- gsub("\\{guid\\}", URLencode(as.character(`guid`), reserved = TRUE), local_var_url_path)
      }

      # API key authentication
      if ("Authorization" %in% names(self$api_client$api_keys) && nchar(self$api_client$api_keys["Authorization"]) > 0) {
        header_params["Authorization"] <- paste(unlist(self$api_client$api_keys["Authorization"]), collapse = "")
      }

      # The Accept request HTTP header
      local_var_accepts <- list("application/json")

      # The Content-Type representation header
      local_var_content_types <- list("application/json")

      local_var_resp <- self$api_client$CallApi(url = paste0(self$api_client$base_path, local_var_url_path),
                                 method = "POST",
                                 query_params = query_params,
                                 header_params = header_params,
                                 form_params = form_params,
                                 file_params = file_params,
                                 accepts = local_var_accepts,
                                 content_types = local_var_content_types,
                                 body = local_var_body,
                                 is_oauth = is_oauth,
                                 oauth_scopes = oauth_scopes,
                                 ...)

      if (local_var_resp$status_code >= 200 && local_var_resp$status_code <= 299) {
        # save response in a file
        if (!is.null(data_file)) {
          write(local_var_resp$response, data_file)
        }

        deserialized_resp_obj <- tryCatch(
          self$api_client$deserialize(local_var_resp$response, "Group", loadNamespace("connectapi2")),
          error = function(e) {
            rlang::abort(message = "Failed to deserialize response",
                         .subclass = "ApiException",
                         ApiException = ApiException$new(http_response = local_var_resp))
          }
        )
        local_var_resp$content <- deserialized_resp_obj
        local_var_resp
      } else if (local_var_resp$status_code >= 300 && local_var_resp$status_code <= 399) {
        ApiResponse$new(paste("Server returned ", local_var_resp$status_code, " response status code."), local_var_resp)
      } else if (local_var_resp$status_code >= 400 && local_var_resp$status_code <= 499) {
        ApiResponse$new("API client error", local_var_resp)
      } else if (local_var_resp$status_code >= 500 && local_var_resp$status_code <= 599) {
        if (is.null(local_var_resp$response) || local_var_resp$response == "") {
          local_var_resp$response <- "API server error"
        }
        local_var_resp
      }
    }
  )
)
