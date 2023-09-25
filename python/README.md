# connectapi
The Posit Connect Server API can be used to perform certain user actions remotely. You will need to install a tool or library that can make HTTP requests, such as: - [httr](http://httr.r-lib.org/) (R HTTP library) - [curl](https://curl.se/) (Linux tool for making HTTP calls) - [requests](https://requests.readthedocs.io/en/master/) (Python HTTP library)  Please note that all API paths are relative to the base API URL (e.g., <code>http:/localhost:3939/\\_\\_api\\_\\_</code>). Unless otherwise noted, all endpoints which accept a request body will require the body to be in JSON format. Similarly, all response bodies will be returned in JSON format.  <a id=\"download\"></a> ## Specifications  The Posit Connect Server API Swagger specification is available for download as either JSON or YAML. Both formats contain the same information, also presented on this page.  * <a href=\"swagger.json\" title=\"Swagger (JSON)\" target=\"_blank\">Swagger (JSON)</a> * <a href=\"swagger.yaml\" title=\"Swagger (YAML)\" target=\"_blank\">Swagger (YAML)</a>  <a id=\"versioning-policy\"></a> ## Versioning of the API  The Posit Connect Server API uses a simple, single number versioning scheme as noted as the first part of each endpoint path.  This version number will only be incremented in the event that non-backward compatible changes are made to an existing endpoint. Note that this occurs on a per-endpoint basis; see the section on [deprecation](#deprecation) below for more information.  Changes that are considered backward compatible are:  * New fields in responses. * New non-required fields in requests. * New endpoint behavior which does not violate the current functional intent of the   endpoint.  Changes that are considered non-backward compatible are:  * Removal or rename of request or response fields. * A change of the type or format of one or more request or response fields. * Addition of new required request fields. * A substantial deviation from the current functional intent of the endpoint.  The points relating to functional intent are assumed to be extremely rare as more often such situations will result in a completely new endpoint, which makes the change a backward compatible addition.  ### Experimentation  Posit Connect labels experimental endpoints in the API by including `/experimental` in the endpoint path immediately after the version indicator.  If an endpoint is noted as experimental, it should not be relied upon for any production work.  These are endpoints that Posit Connect is making available to our customers to solicit feedback; they are subject to change without notice.  Such changes include anything from altered request/response shapes, to complete abandonment of the endpoint.  This public review of an experimental endpoint will last as long as necessary to either prove its viability or to determine that it’s not really needed.  The time for this will vary based on the intricacies of each endpoint.  When the endpoint is finalized, the next release of Posit Connect will mark the experimental path as deprecated while adding the endpoint without the `/experimental` prefix. The path with the experimental prefix will be removed six months later.  The documentation for the endpoint will also note, during that time, the original, experimental, path.  All experimental endpoints are clearly marked as such in this documentation.  <a id=\"deprecation\"></a> ### Deprecation and Removal of Old Versions  It is possible that Posit Connect may decide to deprecate an endpoint.  This will happen if either the endpoint serves no useful purpose because it’s functionality is now handled by a different endpoint or because there is a newer version of the endpoint that should be used.  If a deprecated endpoint is called, the response to it will include an extra HTTP header called, `X-Deprecated-Endpoint` and will have as a value the path of the endpoint that should be used instead.  If the functionality has no direct replacement, the value will be set to `n/a`.  Deprecated versions of an endpoint will be supported for 1 year from the release date of Posit Connect in which the endpoint was marked as deprecated.  At that time, the endpoint is subject to removal at the discretion of Posit Connect.  The life cycle of an endpoint will follow these steps.  1. The `/v1/endpoint` is public and in use by Posit Connect customers. 1. Posit Connect makes `/v2/experimental/endpoint` available for testing and feedback.    Customers should still use `/v1/endpoint` for production work. 1. Posit Connect moves version 2 of the endpoint out of experimentation so, all within    the same release:     1. `/v1/endpoint` is marked as deprecated.     1. `/v2/experimental/endpoint` is marked as deprecated.     1. `/v2/endpoint` is made public. 1. Six months later, `/v2/experimental/endpoint` is removed from the product. 1. Twelve months later, `/v1/endpoint` is removed from the product.  Note that it is possible that Posit Connect may produce a new version of an existing endpoint without making an experimental version of it first.  The same life cycle, without those parts, will still be followed.  <a id=\"authentication\"> </a> ## Authentication  Most endpoints require you to identify yourself as a valid Posit Connect user. You do this by specifying an API Key when you make a call to the server. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  <a id=\"api-keys\"></a> ### API Keys  API Keys are managed by each user in the Posit Connect dashboard. If you ever lose an API Key or otherwise feel it has been compromised, use the dashboard to revoke the key and create another one.  **WARNING**: Keep your API Key safe.  If your Posit Connect server's URL does not begin with `https`, your API Key could be intercepted and used by a malicious actor.  Once you have an API Key, you can authenticate by passing the key with a prefix of `\"Key \"` (the space is important) in the Authorization header.  Below are examples of invoking the \"Get R Information\" endpoint.  **cURL** ```bash curl -H \"Authorization: Key XXXXXXXXXXX\" \\      https://positconnect.example.com/__api__/v1/server_settings/r ```  **R** ```r library(httr) apiKey <- \"XXXXXXXXXXX\" result <- GET(\"https://positconnect.example.com/__api__/v1/server_settings/r\",   add_headers(Authorization = paste(\"Key\", apiKey))) ```  **Python** ```python import requests r = requests.get(   'https://positconnect.example.com/__api__/v1/server_settings/r',   headers = { 'Authorization': 'Key XXXXXXXXXXX' } ) ```  <a id=\"api-cors-considerations\"></a> ## API CORS considerations  When accessing the Posit Connect API via a context that enforces CORS restrictions such as a browser, there are some configuration values that will likely need to be set.  Connect does not enable CORS headers and pre-flight requests by default; it must be enabled via the `CORS.Enabled` configuration option.  The CORS header values that are the same for all requests are  - `Access-Control-Allow-Methods` is set to `GET, POST, PUT, PATCH, DELETE, HEAD` - `Access-Control-Allow-Headers` is set to `Origin, Content-Length, Content-Type` - `Access-Control-Max-Age` is set to 12 hours - `Access-Control-Allow-Credentials` is set to `true`  The remaining header value that may be configured is  - `Access-Control-Allow-Origin` which is set from the   `CORS.AllowOrigin` config value and is empty by   default, meaning only local origins and `Server.Address` are   allowed.  <a id=\"API-Error-Codes\"></a> ## API Error Codes  <table> <thead> <tr><th>Error&nbsp;Code</th><th>Message</th><th>HTTP status</th><th>HTTP message</th></tr> </thead> <tbody> <tr><td>1</td><td>An internal failure occurred.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>2</td><td>The requested method or endpoint is not supported.</td><td>404</td><td>Not Found</td></tr> <tr><td>3</td><td>The requested object ID is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>4</td><td>The requested object does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>5</td><td>Application name must be between 3 and 64 alphanumeric characters, dashes, and underscores.</td><td>400</td><td>Bad Request</td></tr> <tr><td>6</td><td>The password is not strong enough. Please try again.</td><td>400</td><td>Bad Request</td></tr> <tr><td>7</td><td>The requested username is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>8</td><td>The requested username is already in use. Usernames are case sensitive. Please ensure you are using the correct case.</td><td>409</td><td>Conflict</td></tr> <tr><td>9</td><td>The requested user could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>10</td><td>The requested object doesn&#39;t belong to you.</td><td>403</td><td>Forbidden</td></tr> <tr><td>11</td><td>The requested filter could not be applied.</td><td>400</td><td>Bad Request</td></tr> <tr><td>12</td><td>A required parameter is missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>13</td><td>The requested range is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>14</td><td>Group name must be between less than 4096 alphanumeric characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>15</td><td>The requested group name is already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>16</td><td>The user is already a member of the group.</td><td>409</td><td>Conflict</td></tr> <tr><td>17</td><td>The requested item could not be removed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>18</td><td>The requested item could not be changed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>19</td><td>You don&#39;t have permission to access this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>20</td><td>You don&#39;t have permission to remove this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>21</td><td>You don&#39;t have permission to change this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>22</td><td>You don&#39;t have permission to perform this operation.</td><td>403</td><td>Forbidden</td></tr> <tr><td>23</td><td>You don&#39;t have permission to give the user this role.</td><td>403</td><td>Forbidden</td></tr> <tr><td>24</td><td>The requested operation requires authentication.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>25</td><td>The parameter is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>26</td><td>An object with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>27</td><td>This version of R is in use and cannot be deleted.</td><td>409</td><td>Conflict</td></tr> <tr><td>28</td><td>No application bundle to deploy.</td><td>404</td><td>Not Found</td></tr> <tr><td>29</td><td>The token is expired. Authentication tokens must be claimed within one hour.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>30</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>31</td><td>Password change prohibited.</td><td>403</td><td>Forbidden</td></tr> <tr><td>32</td><td>The requested filter is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>33</td><td>This user cannot be added as a collaborator because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>34</td><td>The application&#39;s owner cannot be added as a collaborator or viewer.</td><td>400</td><td>Bad Request</td></tr> <tr><td>35</td><td>Cannot delete object as it is being used elsewhere.</td><td>409</td><td>Conflict</td></tr> <tr><td>36</td><td>This user&#39;s username has already been set and cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>37</td><td>Schedules must have a start time and it must be after 1/1/2010.</td><td>400</td><td>Bad Request</td></tr> <tr><td>38</td><td>The application&#39;s manifest is invalid or missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>39</td><td>The application does not support this action.</td><td>400</td><td>Bad Request</td></tr> <tr><td>40</td><td>The current user has not been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>41</td><td>The initial user must specify a password; it cannot be generated.</td><td>400</td><td>Bad Request</td></tr> <tr><td>42</td><td>The user has already been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>43</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>44</td><td>The current user does not have an email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>45</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the Scheduler.MinProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>46</td><td>Internal user fields cannot be changed via API.</td><td>400</td><td>Bad Request</td></tr> <tr><td>47</td><td>You cannot log in because the configured policy requires that the Posit Connect administrator provision your account first. Please contact your administrator.</td><td>403</td><td>Forbidden</td></tr> <tr><td>48</td><td>You cannot change the type of application once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>49</td><td>You don&#39;t have permission to lock/unlock this user.</td><td>403</td><td>Forbidden</td></tr> <tr><td>50</td><td>This user is locked.</td><td>403</td><td>Forbidden</td></tr> <tr><td>51</td><td>Vanity path conflicts with one or more already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>52</td><td>Vanity path is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>53</td><td>Immutable field cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>54</td><td>You cannot set this content to run as the current user</td><td>400</td><td>Bad Request</td></tr> <tr><td>55</td><td>Custom RunAs settings are prohibited for static content.</td><td>400</td><td>Bad Request</td></tr> <tr><td>56</td><td>The RunAs setting references a prohibited Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>57</td><td>The RunAs setting does not reference a valid Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>58</td><td>The RunAs setting references a Unix account that does not have the correct group membership.</td><td>400</td><td>Bad Request</td></tr> <tr><td>59</td><td>There is no rendering available.</td><td>400</td><td>Bad Request</td></tr> <tr><td>60</td><td>This email address is not allowed to login to this server.</td><td>400</td><td>Bad Request</td></tr> <tr><td>61</td><td>You cannot change the role of the only remaining administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>62</td><td>An API key name must not be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>63</td><td>There was a problem communicating with the LDAP authentication server. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>64</td><td>The number of users permitted by this license has been exceeded. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>65</td><td>API applications are not permitted by your license.</td><td>403</td><td>Forbidden</td></tr> <tr><td>66</td><td>You cannot assign ownership to another user.</td><td>400</td><td>Bad Request</td></tr> <tr><td>67</td><td>You must provide the source_key for an existing variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>68</td><td>You cannot promote a variant without a valid rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>69</td><td>The bundle ID of the source and target variants must match</td><td>400</td><td>Bad Request</td></tr> <tr><td>70</td><td>Target rendering is more recent than source rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>71</td><td>Only parameterized documents support promoting output</td><td>400</td><td>Bad Request</td></tr> <tr><td>72</td><td>Not allowed to create schedule with different application association than its variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>73</td><td>You may not schedule ad-hoc variants</td><td>400</td><td>Bad Request</td></tr> <tr><td>74</td><td>The requested report name is not permitted</td><td>400</td><td>Bad Request</td></tr> <tr><td>75</td><td>You may not delete the active bundle for an application</td><td>400</td><td>Bad Request</td></tr> <tr><td>76</td><td>A user using the same Unique ID already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>77</td><td>A tag name cannot be more than 255 characters</td><td>400</td><td>Bad Request</td></tr> <tr><td>78</td><td>A tag must have a name</td><td>400</td><td>Bad Request</td></tr> <tr><td>79</td><td>Cannot assign a category to an app</td><td>400</td><td>Bad Request</td></tr> <tr><td>80</td><td>The target object does not match the provided version.</td><td>409</td><td>Conflict</td></tr> <tr><td>81</td><td>Duplicate names are not permitted; a sibling tag or category already has this name</td><td>400</td><td>Bad Request</td></tr> <tr><td>82</td><td>The bundle for deployment must belong to the target application.</td><td>400</td><td>Bad Request</td></tr> <tr><td>83</td><td>Too many search results. Be more specific.</td><td>400</td><td>Bad Request</td></tr> <tr><td>84</td><td>The token has already been claimed. Tokens can only be claimed once.</td><td>403</td><td>Forbidden</td></tr> <tr><td>85</td><td>A token using the same token key already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>86</td><td>A new token MUST contain a public_key and token in the json body.</td><td>400</td><td>Bad Request</td></tr> <tr><td>87</td><td>The request body cannot be parsed</td><td>400</td><td>Bad Request</td></tr> <tr><td>88</td><td>Cannot apply the requested change because it would make the target object an ancestor of itself.</td><td>400</td><td>Bad Request</td></tr> <tr><td>89</td><td>Unable to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>90</td><td>User self-registration is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>91</td><td>The external authentication provider did not provide a valid username.</td><td>400</td><td>Bad Request</td></tr> <tr><td>92</td><td>XSRF token mismatch</td><td>403</td><td>Forbidden</td></tr> <tr><td>93</td><td>Private variants cannot be configured to email users other than the owner</td><td>403</td><td>Forbidden</td></tr> <tr><td>94</td><td>You can only request a permissions upgrade once per 24-hour period.</td><td>400</td><td>Bad Request</td></tr> <tr><td>95</td><td>This API does not allow the current authentication type.</td><td>403</td><td>Forbidden</td></tr> <tr><td>96</td><td>Incorrect current password.</td><td>403</td><td>Forbidden</td></tr> <tr><td>97</td><td>Changing host or scheme in redirect is forbidden.</td><td>403</td><td>Forbidden</td></tr> <tr><td>98</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>99</td><td>Please re-supply your credentials.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>100</td><td>Unable to remove item. It is being processed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>101</td><td>The provided password change token is invalid.</td><td>403</td><td>Forbidden</td></tr> <tr><td>102</td><td>A schedule for this variant already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>103</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>104</td><td>The content checksum header and body MD5 sum are not equal.</td><td>400</td><td>Bad Request</td></tr> <tr><td>105</td><td>TensorFlow Model APIs are not supported.</td><td>502</td><td>Bad Gateway</td></tr> <tr><td>106</td><td>Unable to update environment variables because they were changed while you were editing them.</td><td>409</td><td>Conflict</td></tr> <tr><td>107</td><td>That username is not allowed because it is prohibited by policy.</td><td>400</td><td>Bad Request</td></tr> <tr><td>108</td><td>Environment changes contain a prohibited variable</td><td>409</td><td>Conflict</td></tr> <tr><td>109</td><td>This type of content is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>110</td><td>You cannot change the categorization of content once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>111</td><td>You cannot change if an app is parameterized once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>112</td><td>The provided user role is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>113</td><td>Invalid MaxProcesses setting. The MaxProcesses setting may not exceed the Scheduler.MaxProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>114</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the MaxProcesses setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>115</td><td>The provided status is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>116</td><td>The requested rendering does not match the variant.</td><td>400</td><td>Bad Request</td></tr> <tr><td>117</td><td>Unknown access type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>118</td><td>This access type is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>119</td><td>The authentication provider does not support creating records from a retrieved ticket. POST new content instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>120</td><td>The authentication provider does not support creating records from POST content. PUT a retrieved ticket instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>121</td><td>The request JSON is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>122</td><td>Application title must be between 3 and 1024 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>123</td><td>Application description must be 4096 characters or less.</td><td>400</td><td>Bad Request</td></tr> <tr><td>124</td><td>No administrator has a configured email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>125</td><td>Content-Length cannot be 0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>126</td><td>Request Content-Length did not match the number of bytes received.</td><td>400</td><td>Bad Request</td></tr> <tr><td>127</td><td>The temp_ticket is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>128</td><td>The email address cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>129</td><td>The user unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>130</td><td>The group unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>131</td><td>A group using the same unique ID already exists.</td><td>400</td><td>Bad Request</td></tr> <tr><td>132</td><td>The configured provider cannot access this endpoint.</td><td>400</td><td>Bad Request</td></tr> <tr><td>133</td><td>The source variant belongs to a different app.</td><td>400</td><td>Bad Request</td></tr> <tr><td>134</td><td>Unable to write bundle to disk.</td><td>400</td><td>Bad Request</td></tr> <tr><td>135</td><td>Unable to extract the bundle.</td><td>400</td><td>Bad Request</td></tr> <tr><td>136</td><td>Time values must be in RFC3339 format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>137</td><td>The start of the time interval cannot be in the past, or more than 5 years in the future.</td><td>400</td><td>Bad Request</td></tr> <tr><td>138</td><td>The end of the time interval cannot be earlier than the start time.</td><td>400</td><td>Bad Request</td></tr> <tr><td>139</td><td>The length of the time interval cannot be more than 1 year.</td><td>400</td><td>Bad Request</td></tr> <tr><td>140</td><td>The time interval must have both start and end times.</td><td>400</td><td>Bad Request</td></tr> <tr><td>141</td><td>Task lookup failures can indicate that a load balancer is not using sticky sessions or a client is not including the session cookie. Details: https://docs.posit.co/connect/admin/load-balancing/</td><td>404</td><td>Not Found</td></tr> <tr><td>142</td><td>The app is already managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>143</td><td>The app is not managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>144</td><td>Uploading a content bundle is not allowed for this application since it is managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>145</td><td>Git support is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>146</td><td>Git URLs must be absolute and cannot have username, query, or fragment.</td><td>400</td><td>Bad Request</td></tr> <tr><td>147</td><td>The specified app mode is not executable.</td><td>400</td><td>Bad Request</td></tr> <tr><td>148</td><td>The specified app mode is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>149</td><td>Environment changes contain a duplicated variable name.</td><td>409</td><td>Conflict</td></tr> <tr><td>150</td><td>The load factor must be between 0.0 and 1.0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>151</td><td>The timeout must be between 0 and 2592000 seconds.</td><td>400</td><td>Bad Request</td></tr> <tr><td>152</td><td>The principal type must be &#39;user&#39; or &#39;group&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>153</td><td>The requested group could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>154</td><td>The requested user is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>155</td><td>The requested group is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>156</td><td>This user cannot be assigned as the owner because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>157</td><td>The requested parent tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>158</td><td>The requested tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>159</td><td>The permission request submitted already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>160</td><td>The email notification for a permission request cannot be delivered due to missing or invalid email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>161</td><td>The include option specified is not valid</td><td>400</td><td>Bad Request</td></tr> <tr><td>162</td><td>The specified hostname is not an active Connect host</td><td>400</td><td>Bad Request</td></tr> <tr><td>163</td><td>The specified job cannot be terminated because it is not active</td><td>409</td><td>Conflict</td></tr> <tr><td>164</td><td>Git URLs must use HTTP or HTTPS.</td><td>400</td><td>Bad Request</td></tr> <tr><td>165</td><td>Cannot create bootstrapping user due to existing users</td><td>403</td><td>Forbidden</td></tr> <tr><td>166</td><td>The provided JWT is invalid</td><td>401</td><td>Unauthorized</td></tr> <tr><td>167</td><td>The controls file coundn&#39;t be read.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>168</td><td>The title must be between 1 and 64 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>169</td><td>The description cannot be more than 4096 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>170</td><td>The cluster_name must be &#39;Kubernetes&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>171</td><td>A unique name for the environment must be provided.</td><td>400</td><td>Bad Request</td></tr> <tr><td>172</td><td>Unknown matching type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>173</td><td>The installation path must be an absolute Unix filepath.</td><td>400</td><td>Bad Request</td></tr> <tr><td>174</td><td>The installation version must use semantic version format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>175</td><td>An environment with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>176</td><td>The specified service account name is not a valid DNS subdomain.</td><td>400</td><td>Bad Request</td></tr> <tr><td>177</td><td>The supervisor path may not contain any of the following whitespace control characters: \\t\\n\\b\\f\\n</td><td>400</td><td>Bad Request</td></tr> <tr><td>178</td><td>The specified service account name is not recognized by launcher in the Kubernetes namespace.</td><td>400</td><td>Bad Request</td></tr> <tr><td>179</td><td>Unsupported runtime language identifier</td><td>400</td><td>Bad Request</td></tr> <tr><td>180</td><td>The request did not identify a cache location</td><td>400</td><td>Bad Request</td></tr> <tr><td>181</td><td>Invalid MemoryRequest setting. The MemoryRequest setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>182</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the Scheduler.MaxMemoryRequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>183</td><td>Invalid MemoryLimit setting. The MemoryLimit setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>184</td><td>Invalid MemoryLimit setting. The MemoryLimit setting may not exceed the Scheduler.MaxMemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>185</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the MemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>186</td><td>Invalid CPURequest setting. The CPURequest setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>187</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the Scheduler.MaxCPURequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>188</td><td>Invalid CPULimit setting. The CPULimit setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>189</td><td>Invalid CPULimit setting. The CPULimit setting may not exceed the Scheduler.MaxCPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>190</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the CPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>191</td><td>Invalid MinProcesses setting. The MinProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>192</td><td>Invalid MaxProcesses setting. The MaxProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>193</td><td>When provided, the default_image_name cannot be empty and may not contain any whitespace characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>194</td><td>Runtime cache management is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>195</td><td>Invalid configuration. Service accounts cannot be set on content. Please contact an administrator to update Connect&#39;s server configuration to enable this feature.</td><td>400</td><td>Bad Request</td></tr> </tbody> </table> 

This Python package is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2023.09.0
- Package version: 1.0.0
- Build package: io.swagger.codegen.v3.generators.python.PythonClientCodegen
For more information, please visit [https://support.posit.co/hc/en-us](https://support.posit.co/hc/en-us)

## Requirements.

Python 2.7 and 3.4+

## Installation & Usage
### pip install

If the python package is hosted on Github, you can install directly from Github

```sh
pip install git+https://github.com/GIT_USER_ID/GIT_REPO_ID.git
```
(you may need to run `pip` with root permission: `sudo pip install git+https://github.com/GIT_USER_ID/GIT_REPO_ID.git`)

Then import the package:
```python
import connectapi 
```

### Setuptools

Install via [Setuptools](http://pypi.python.org/pypi/setuptools).

```sh
python setup.py install --user
```
(or `sudo python setup.py install` to install the package for all users)

Then import the package:
```python
import connectapi
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```python
from __future__ import print_function
import time
import connectapi
from connectapi.rest import ApiException
from pprint import pprint

# Configure API key authorization: apiKey
configuration = connectapi.Configuration()
configuration.api_key['Authorization'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['Authorization'] = 'Bearer'

# create an instance of the API class
api_instance = connectapi.AuditLogsApi(connectapi.ApiClient(configuration))
limit = 20 # int | Number of logs to return. The minimum supported value is 1 and maximum supported value is 500. Note that `limit` is a \"best effort\" request since there may not be enough logs to satisfy the limit. (optional) (default to 20)
previous = 'previous_example' # str | Gets the previous page of audit logs relative to the given id. (optional)
next = 'next_example' # str | Gets the next page of audit logs relative to the given id. (optional)
asc_order = true # bool | Whether the audit logs should be listed in ascending order (optional) (default to true)

try:
    # Get audit logs
    api_response = api_instance.get_audit_logs(limit=limit, previous=previous, next=next, asc_order=asc_order)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling AuditLogsApi->get_audit_logs: %s\n" % e)
```

## Documentation for API Endpoints

All URIs are relative to */__api__*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*AuditLogsApi* | [**get_audit_logs**](docs/AuditLogsApi.md#get_audit_logs) | **GET** /v1/audit_logs | Get audit logs
*BootstrapV1ExperimentalApi* | [**bootstrap**](docs/BootstrapV1ExperimentalApi.md#bootstrap) | **POST** /v1/experimental/bootstrap | Create first admininistrator and API key
*BundlesApi* | [**delete_bundle**](docs/BundlesApi.md#delete_bundle) | **DELETE** /v1/content/{guid}/bundles/{id} | Delete bundle
*BundlesApi* | [**download_bundle**](docs/BundlesApi.md#download_bundle) | **GET** /v1/content/{guid}/bundles/{id}/download | Download the bundle archive
*BundlesApi* | [**get_bundle**](docs/BundlesApi.md#get_bundle) | **GET** /v1/content/{guid}/bundles/{id} | Get bundle details
*BundlesApi* | [**get_bundles**](docs/BundlesApi.md#get_bundles) | **GET** /v1/content/{guid}/bundles | List bundles
*BundlesApi* | [**upload_content_bundle**](docs/BundlesApi.md#upload_content_bundle) | **POST** /v1/content/{guid}/bundles | Create a bundle by uploading an archive
*BundlesV1ExperimentalApi* | [**delete_bundle**](docs/BundlesV1ExperimentalApi.md#delete_bundle) | **DELETE** /v1/experimental/bundles/{id} | Delete bundle
*BundlesV1ExperimentalApi* | [**download_bundle**](docs/BundlesV1ExperimentalApi.md#download_bundle) | **GET** /v1/experimental/bundles/{id}/download | Download the bundle archive
*BundlesV1ExperimentalApi* | [**get_bundle**](docs/BundlesV1ExperimentalApi.md#get_bundle) | **GET** /v1/experimental/bundles/{id} | Get bundle details
*BundlesV1ExperimentalApi* | [**get_bundles**](docs/BundlesV1ExperimentalApi.md#get_bundles) | **GET** /v1/experimental/content/{guid}/bundles | List bundles
*ContentApi* | [**build_content_bundle**](docs/ContentApi.md#build_content_bundle) | **POST** /v1/content/{guid}/build | Build deployment bundle
*ContentApi* | [**create_content**](docs/ContentApi.md#create_content) | **POST** /v1/content | Create content item
*ContentApi* | [**delete_content**](docs/ContentApi.md#delete_content) | **DELETE** /v1/content/{guid} | Delete content
*ContentApi* | [**deploy_content_bundle**](docs/ContentApi.md#deploy_content_bundle) | **POST** /v1/content/{guid}/deploy | Deploy deployment bundle
*ContentApi* | [**get_content**](docs/ContentApi.md#get_content) | **GET** /v1/content/{guid} | Get content details
*ContentApi* | [**get_content_environment**](docs/ContentApi.md#get_content_environment) | **GET** /v1/content/{guid}/environment | Get environment variables
*ContentApi* | [**get_contents**](docs/ContentApi.md#get_contents) | **GET** /v1/content | List content items
*ContentApi* | [**set_content_environment**](docs/ContentApi.md#set_content_environment) | **PUT** /v1/content/{guid}/environment | Set all environment variables
*ContentApi* | [**update_content**](docs/ContentApi.md#update_content) | **PATCH** /v1/content/{guid} | Update content
*ContentApi* | [**update_content_environment**](docs/ContentApi.md#update_content_environment) | **PATCH** /v1/content/{guid}/environment | Update environment variables
*ContentPermissionsApi* | [**add_content_permission**](docs/ContentPermissionsApi.md#add_content_permission) | **POST** /v1/content/{guid}/permissions | Add permission
*ContentPermissionsApi* | [**delete_content_permission**](docs/ContentPermissionsApi.md#delete_content_permission) | **DELETE** /v1/content/{guid}/permissions/{id} | Delete permission
*ContentPermissionsApi* | [**get_content_permission**](docs/ContentPermissionsApi.md#get_content_permission) | **GET** /v1/content/{guid}/permissions/{id} | Get permission
*ContentPermissionsApi* | [**list_content_permissions**](docs/ContentPermissionsApi.md#list_content_permissions) | **GET** /v1/content/{guid}/permissions | List permissions
*ContentPermissionsApi* | [**update_content_permission**](docs/ContentPermissionsApi.md#update_content_permission) | **PUT** /v1/content/{guid}/permissions/{id} | Update permission
*ContentV1ExperimentalApi* | [**create_content**](docs/ContentV1ExperimentalApi.md#create_content) | **POST** /v1/experimental/content | Create content item
*ContentV1ExperimentalApi* | [**delete_content**](docs/ContentV1ExperimentalApi.md#delete_content) | **DELETE** /v1/experimental/content/{guid} | Delete content
*ContentV1ExperimentalApi* | [**deploy_content_bundle**](docs/ContentV1ExperimentalApi.md#deploy_content_bundle) | **POST** /v1/experimental/content/{guid}/deploy | Deploy deployment bundle
*ContentV1ExperimentalApi* | [**get_content**](docs/ContentV1ExperimentalApi.md#get_content) | **GET** /v1/experimental/content/{guid} | Get content details
*ContentV1ExperimentalApi* | [**update_content**](docs/ContentV1ExperimentalApi.md#update_content) | **POST** /v1/experimental/content/{guid} | Update content
*ContentV1ExperimentalApi* | [**upload_content_bundle**](docs/ContentV1ExperimentalApi.md#upload_content_bundle) | **POST** /v1/experimental/content/{guid}/upload | Upload deployment bundle
*EnvironmentsApi* | [**create_environment**](docs/EnvironmentsApi.md#create_environment) | **POST** /v1/environments | Create execution environment
*EnvironmentsApi* | [**delete_environment**](docs/EnvironmentsApi.md#delete_environment) | **DELETE** /v1/environments/{guid} | Delete an execution environment
*EnvironmentsApi* | [**get_environment**](docs/EnvironmentsApi.md#get_environment) | **GET** /v1/environments/{guid} | Get execution environment details
*EnvironmentsApi* | [**list_environments**](docs/EnvironmentsApi.md#list_environments) | **GET** /v1/environments | List execution environments
*EnvironmentsApi* | [**update_environment**](docs/EnvironmentsApi.md#update_environment) | **PUT** /v1/environments/{guid} | Update an execution environment
*GroupsApi* | [**add_group_member**](docs/GroupsApi.md#add_group_member) | **POST** /v1/groups/{group_guid}/members | Add a group member
*GroupsApi* | [**create_group**](docs/GroupsApi.md#create_group) | **POST** /v1/groups | Create a group from caller-supplied details (Password, PAM, OAuth2, SAML, Proxied) 
*GroupsApi* | [**create_remote_group**](docs/GroupsApi.md#create_remote_group) | **PUT** /v1/groups | Create a group using details from a remote authentication provider (LDAP) 
*GroupsApi* | [**delete_group**](docs/GroupsApi.md#delete_group) | **DELETE** /v1/groups/{guid} | Delete a group
*GroupsApi* | [**get_group**](docs/GroupsApi.md#get_group) | **GET** /v1/groups/{guid} | Get group details
*GroupsApi* | [**get_group_members**](docs/GroupsApi.md#get_group_members) | **GET** /v1/groups/{group_guid}/members | Get group member details
*GroupsApi* | [**get_group_ownership**](docs/GroupsApi.md#get_group_ownership) | **GET** /v1/experimental/groups/{guid}/content | List content for which a group with given GUID has access to
*GroupsApi* | [**get_groups**](docs/GroupsApi.md#get_groups) | **GET** /v1/groups | List or search for group details
*GroupsApi* | [**remove_group_member**](docs/GroupsApi.md#remove_group_member) | **DELETE** /v1/groups/{group_guid}/members/{user_guid} | Remove a group member
*GroupsApi* | [**search_remote_groups**](docs/GroupsApi.md#search_remote_groups) | **GET** /v1/groups/remote | Search for group details from a remote provider
*GroupsApi* | [**update_group**](docs/GroupsApi.md#update_group) | **POST** /v1/groups/{guid} | Modify a group name or owner (Password, PAM, OAuth2, SAML, Proxied) 
*InstrumentationApi* | [**get_content_visits**](docs/InstrumentationApi.md#get_content_visits) | **GET** /v1/instrumentation/content/visits | Get Content Visits
*InstrumentationApi* | [**get_shiny_app_usage**](docs/InstrumentationApi.md#get_shiny_app_usage) | **GET** /v1/instrumentation/shiny/usage | Get Shiny App Usage
*JobsApi* | [**get_job**](docs/JobsApi.md#get_job) | **GET** /v1/content/{guid}/jobs/{key} | Get job
*JobsApi* | [**get_jobs**](docs/JobsApi.md#get_jobs) | **GET** /v1/content/{guid}/jobs | Get jobs
*JobsApi* | [**job_download_log**](docs/JobsApi.md#job_download_log) | **GET** /v1/content/{guid}/jobs/{key}/download | Download job log file
*JobsApi* | [**job_error**](docs/JobsApi.md#job_error) | **GET** /v1/content/{guid}/jobs/{key}/error | Get job error
*JobsApi* | [**job_logs**](docs/JobsApi.md#job_logs) | **GET** /v1/content/{guid}/jobs/{key}/log | Get job log
*JobsApi* | [**job_tail_log**](docs/JobsApi.md#job_tail_log) | **GET** /v1/content/{guid}/jobs/{key}/tail | Tail job log
*JobsApi* | [**kill_job**](docs/JobsApi.md#kill_job) | **DELETE** /v1/content/{guid}/jobs/{key} | Register job kill order
*PythonInformationApi* | [**get_python_information**](docs/PythonInformationApi.md#get_python_information) | **GET** /v1/server_settings/python | Get Python Information
*QuartoInformationApi* | [**get_quarto_information**](docs/QuartoInformationApi.md#get_quarto_information) | **GET** /v1/server_settings/quarto | Get Quarto Information
*RInformationApi* | [**get_r_information**](docs/RInformationApi.md#get_r_information) | **GET** /v1/server_settings/r | Get R Information
*RuntimeCachesApi* | [**delete_runtime_cache**](docs/RuntimeCachesApi.md#delete_runtime_cache) | **DELETE** /v1/system/caches/runtime | Delete a runtime cache
*RuntimeCachesApi* | [**list_runtime_caches**](docs/RuntimeCachesApi.md#list_runtime_caches) | **GET** /v1/system/caches/runtime | List runtime caches
*TagsApi* | [**add_tag**](docs/TagsApi.md#add_tag) | **POST** /v1/content/{guid}/tags | Add tag to content
*TagsApi* | [**create_tag**](docs/TagsApi.md#create_tag) | **POST** /v1/tags | Create tag
*TagsApi* | [**delete_tag**](docs/TagsApi.md#delete_tag) | **DELETE** /v1/tags/{id} | Delete tag
*TagsApi* | [**get_tag**](docs/TagsApi.md#get_tag) | **GET** /v1/tags/{id} | Get tag
*TagsApi* | [**get_tag_by_path**](docs/TagsApi.md#get_tag_by_path) | **GET** /v1/tags/{path} | Get tag by path
*TagsApi* | [**list_content_tags**](docs/TagsApi.md#list_content_tags) | **GET** /v1/content/{guid}/tags | List tags for content
*TagsApi* | [**list_tag_content**](docs/TagsApi.md#list_tag_content) | **GET** /v1/tags/{id}/content | List content for tags
*TagsApi* | [**list_tags**](docs/TagsApi.md#list_tags) | **GET** /v1/tags | List tags
*TagsApi* | [**remove_tag**](docs/TagsApi.md#remove_tag) | **DELETE** /v1/content/{guid}/tags/{id} | Remove tag from content
*TagsApi* | [**update_tag**](docs/TagsApi.md#update_tag) | **PATCH** /v1/tags/{id} | Update tag
*TasksApi* | [**get_task**](docs/TasksApi.md#get_task) | **GET** /v1/tasks/{id} | Get task details
*TasksV1ExperimentalApi* | [**get_task**](docs/TasksV1ExperimentalApi.md#get_task) | **GET** /v1/experimental/tasks/{id} | Get task details
*UsersApi* | [**create_pull_user**](docs/UsersApi.md#create_pull_user) | **PUT** /v1/users | Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google) 
*UsersApi* | [**create_push_user**](docs/UsersApi.md#create_push_user) | **POST** /v1/users | Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google) 
*UsersApi* | [**get_current_user**](docs/UsersApi.md#get_current_user) | **GET** /v1/user | Get current user details
*UsersApi* | [**get_user**](docs/UsersApi.md#get_user) | **GET** /v1/users/{guid} | Get user details
*UsersApi* | [**get_users**](docs/UsersApi.md#get_users) | **GET** /v1/users | List or search for user details
*UsersApi* | [**lock_user**](docs/UsersApi.md#lock_user) | **POST** /v1/users/{guid}/lock | Lock a user
*UsersApi* | [**search_remote_users**](docs/UsersApi.md#search_remote_users) | **GET** /v1/users/remote | Search for user details from a remote provider
*UsersApi* | [**update_user**](docs/UsersApi.md#update_user) | **PUT** /v1/users/{guid} | Update a user
*VanityURLsApi* | [**delete_vanity**](docs/VanityURLsApi.md#delete_vanity) | **DELETE** /v1/content/{guid}/vanity | Delete vanity URL
*VanityURLsApi* | [**get_vanity**](docs/VanityURLsApi.md#get_vanity) | **GET** /v1/content/{guid}/vanity | Get vanity URL
*VanityURLsApi* | [**list_vanities**](docs/VanityURLsApi.md#list_vanities) | **GET** /v1/vanities | List vanity URLs
*VanityURLsApi* | [**set_vanity**](docs/VanityURLsApi.md#set_vanity) | **PUT** /v1/content/{guid}/vanity | Set vanity URL

## Documentation For Models

 - [APIError](docs/APIError.md)
 - [AuditEntry](docs/AuditEntry.md)
 - [AuditLogs](docs/AuditLogs.md)
 - [AuditPager](docs/AuditPager.md)
 - [AuditPagerCursors](docs/AuditPagerCursors.md)
 - [BootstrapSuccess](docs/BootstrapSuccess.md)
 - [Bundle](docs/Bundle.md)
 - [BundleMetadata](docs/BundleMetadata.md)
 - [BundleV1Exp](docs/BundleV1Exp.md)
 - [BundlesV1Exp](docs/BundlesV1Exp.md)
 - [CachesRuntimeBody](docs/CachesRuntimeBody.md)
 - [Content](docs/Content.md)
 - [ContentGuidBody](docs/ContentGuidBody.md)
 - [ContentGuidBody1](docs/ContentGuidBody1.md)
 - [ContentV1Exp](docs/ContentV1Exp.md)
 - [ContentVisit](docs/ContentVisit.md)
 - [ContentVisitLogs](docs/ContentVisitLogs.md)
 - [ContentVisitPager](docs/ContentVisitPager.md)
 - [CreateEnvironmentInput](docs/CreateEnvironmentInput.md)
 - [CreateEnvironmentInputPython](docs/CreateEnvironmentInputPython.md)
 - [CreateEnvironmentInputQuarto](docs/CreateEnvironmentInputQuarto.md)
 - [CreateEnvironmentInputR](docs/CreateEnvironmentInputR.md)
 - [DeleteRuntimeCacheResponse](docs/DeleteRuntimeCacheResponse.md)
 - [EditableUser](docs/EditableUser.md)
 - [Environment](docs/Environment.md)
 - [EnvironmentVariable](docs/EnvironmentVariable.md)
 - [ExperimentalContentBody](docs/ExperimentalContentBody.md)
 - [Group](docs/Group.md)
 - [GroupGuidMembersBody](docs/GroupGuidMembersBody.md)
 - [GroupMembers](docs/GroupMembers.md)
 - [GroupOwnership](docs/GroupOwnership.md)
 - [GroupOwnershipContent](docs/GroupOwnershipContent.md)
 - [GroupOwnershipPermission](docs/GroupOwnershipPermission.md)
 - [GroupRemoteSearch](docs/GroupRemoteSearch.md)
 - [GroupWithTicket](docs/GroupWithTicket.md)
 - [Groups](docs/Groups.md)
 - [GroupsGuidBody](docs/GroupsGuidBody.md)
 - [GuidBuildBody](docs/GuidBuildBody.md)
 - [GuidDeployBody](docs/GuidDeployBody.md)
 - [GuidDeployBody1](docs/GuidDeployBody1.md)
 - [GuidLockBody](docs/GuidLockBody.md)
 - [GuidPermissionsBody](docs/GuidPermissionsBody.md)
 - [GuidTagsBody](docs/GuidTagsBody.md)
 - [GuidVanityBody](docs/GuidVanityBody.md)
 - [InlineResponse200](docs/InlineResponse200.md)
 - [InlineResponse2001](docs/InlineResponse2001.md)
 - [InlineResponse2002](docs/InlineResponse2002.md)
 - [InlineResponse2003](docs/InlineResponse2003.md)
 - [InlineResponse2004](docs/InlineResponse2004.md)
 - [InlineResponse2005](docs/InlineResponse2005.md)
 - [InlineResponse2006](docs/InlineResponse2006.md)
 - [InlineResponse2007](docs/InlineResponse2007.md)
 - [InlineResponse2007Result](docs/InlineResponse2007Result.md)
 - [InlineResponse202](docs/InlineResponse202.md)
 - [InlineResponse400](docs/InlineResponse400.md)
 - [InlineResponse4001](docs/InlineResponse4001.md)
 - [InlineResponse401](docs/InlineResponse401.md)
 - [InlineResponse4011](docs/InlineResponse4011.md)
 - [InlineResponse403](docs/InlineResponse403.md)
 - [InlineResponse4031](docs/InlineResponse4031.md)
 - [InlineResponse404](docs/InlineResponse404.md)
 - [InlineResponse4041](docs/InlineResponse4041.md)
 - [InlineResponse409](docs/InlineResponse409.md)
 - [InlineResponse4091](docs/InlineResponse4091.md)
 - [InlineResponseDefault](docs/InlineResponseDefault.md)
 - [InlineResponseDefault1](docs/InlineResponseDefault1.md)
 - [Installation](docs/Installation.md)
 - [JobItem](docs/JobItem.md)
 - [JobItems](docs/JobItems.md)
 - [KillJobOrder](docs/KillJobOrder.md)
 - [LogEntries](docs/LogEntries.md)
 - [LogEntry](docs/LogEntry.md)
 - [LoggedError](docs/LoggedError.md)
 - [Permission](docs/Permission.md)
 - [PermissionsIdBody](docs/PermissionsIdBody.md)
 - [PyInstallation](docs/PyInstallation.md)
 - [PythonInfo](docs/PythonInfo.md)
 - [QuartoInstallation](docs/QuartoInstallation.md)
 - [QuartoInstallations](docs/QuartoInstallations.md)
 - [RInstallation](docs/RInstallation.md)
 - [RInstallations](docs/RInstallations.md)
 - [RemoteSearchResults](docs/RemoteSearchResults.md)
 - [RuntimeCache](docs/RuntimeCache.md)
 - [RuntimeCaches](docs/RuntimeCaches.md)
 - [ShinyAppUsage](docs/ShinyAppUsage.md)
 - [ShinyAppUsageLogs](docs/ShinyAppUsageLogs.md)
 - [ShinyAppUsagePager](docs/ShinyAppUsagePager.md)
 - [Tag](docs/Tag.md)
 - [TagsIdBody](docs/TagsIdBody.md)
 - [UpdateEnvironmentInput](docs/UpdateEnvironmentInput.md)
 - [User](docs/User.md)
 - [UserWithTicket](docs/UserWithTicket.md)
 - [Users](docs/Users.md)
 - [UsersGuidBody](docs/UsersGuidBody.md)
 - [V1ContentBody](docs/V1ContentBody.md)
 - [V1GroupsBody](docs/V1GroupsBody.md)
 - [V1GroupsBody1](docs/V1GroupsBody1.md)
 - [V1TagsBody](docs/V1TagsBody.md)
 - [V1UsersBody](docs/V1UsersBody.md)
 - [V1UsersBody1](docs/V1UsersBody1.md)

## Documentation For Authorization


## apiKey

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author

support@posit.co
