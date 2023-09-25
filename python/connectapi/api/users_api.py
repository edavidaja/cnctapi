# coding: utf-8

"""
    Posit Connect API Reference

    The Posit Connect Server API can be used to perform certain user actions remotely. You will need to install a tool or library that can make HTTP requests, such as: - [httr](http://httr.r-lib.org/) (R HTTP library) - [curl](https://curl.se/) (Linux tool for making HTTP calls) - [requests](https://requests.readthedocs.io/en/master/) (Python HTTP library)  Please note that all API paths are relative to the base API URL (e.g., <code>http:/localhost:3939/\\_\\_api\\_\\_</code>). Unless otherwise noted, all endpoints which accept a request body will require the body to be in JSON format. Similarly, all response bodies will be returned in JSON format.  <a id=\"download\"></a> ## Specifications  The Posit Connect Server API Swagger specification is available for download as either JSON or YAML. Both formats contain the same information, also presented on this page.  * <a href=\"swagger.json\" title=\"Swagger (JSON)\" target=\"_blank\">Swagger (JSON)</a> * <a href=\"swagger.yaml\" title=\"Swagger (YAML)\" target=\"_blank\">Swagger (YAML)</a>  <a id=\"versioning-policy\"></a> ## Versioning of the API  The Posit Connect Server API uses a simple, single number versioning scheme as noted as the first part of each endpoint path.  This version number will only be incremented in the event that non-backward compatible changes are made to an existing endpoint. Note that this occurs on a per-endpoint basis; see the section on [deprecation](#deprecation) below for more information.  Changes that are considered backward compatible are:  * New fields in responses. * New non-required fields in requests. * New endpoint behavior which does not violate the current functional intent of the   endpoint.  Changes that are considered non-backward compatible are:  * Removal or rename of request or response fields. * A change of the type or format of one or more request or response fields. * Addition of new required request fields. * A substantial deviation from the current functional intent of the endpoint.  The points relating to functional intent are assumed to be extremely rare as more often such situations will result in a completely new endpoint, which makes the change a backward compatible addition.  ### Experimentation  Posit Connect labels experimental endpoints in the API by including `/experimental` in the endpoint path immediately after the version indicator.  If an endpoint is noted as experimental, it should not be relied upon for any production work.  These are endpoints that Posit Connect is making available to our customers to solicit feedback; they are subject to change without notice.  Such changes include anything from altered request/response shapes, to complete abandonment of the endpoint.  This public review of an experimental endpoint will last as long as necessary to either prove its viability or to determine that it’s not really needed.  The time for this will vary based on the intricacies of each endpoint.  When the endpoint is finalized, the next release of Posit Connect will mark the experimental path as deprecated while adding the endpoint without the `/experimental` prefix. The path with the experimental prefix will be removed six months later.  The documentation for the endpoint will also note, during that time, the original, experimental, path.  All experimental endpoints are clearly marked as such in this documentation.  <a id=\"deprecation\"></a> ### Deprecation and Removal of Old Versions  It is possible that Posit Connect may decide to deprecate an endpoint.  This will happen if either the endpoint serves no useful purpose because it’s functionality is now handled by a different endpoint or because there is a newer version of the endpoint that should be used.  If a deprecated endpoint is called, the response to it will include an extra HTTP header called, `X-Deprecated-Endpoint` and will have as a value the path of the endpoint that should be used instead.  If the functionality has no direct replacement, the value will be set to `n/a`.  Deprecated versions of an endpoint will be supported for 1 year from the release date of Posit Connect in which the endpoint was marked as deprecated.  At that time, the endpoint is subject to removal at the discretion of Posit Connect.  The life cycle of an endpoint will follow these steps.  1. The `/v1/endpoint` is public and in use by Posit Connect customers. 1. Posit Connect makes `/v2/experimental/endpoint` available for testing and feedback.    Customers should still use `/v1/endpoint` for production work. 1. Posit Connect moves version 2 of the endpoint out of experimentation so, all within    the same release:     1. `/v1/endpoint` is marked as deprecated.     1. `/v2/experimental/endpoint` is marked as deprecated.     1. `/v2/endpoint` is made public. 1. Six months later, `/v2/experimental/endpoint` is removed from the product. 1. Twelve months later, `/v1/endpoint` is removed from the product.  Note that it is possible that Posit Connect may produce a new version of an existing endpoint without making an experimental version of it first.  The same life cycle, without those parts, will still be followed.  <a id=\"authentication\"> </a> ## Authentication  Most endpoints require you to identify yourself as a valid Posit Connect user. You do this by specifying an API Key when you make a call to the server. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  <a id=\"api-keys\"></a> ### API Keys  API Keys are managed by each user in the Posit Connect dashboard. If you ever lose an API Key or otherwise feel it has been compromised, use the dashboard to revoke the key and create another one.  **WARNING**: Keep your API Key safe.  If your Posit Connect server's URL does not begin with `https`, your API Key could be intercepted and used by a malicious actor.  Once you have an API Key, you can authenticate by passing the key with a prefix of `\"Key \"` (the space is important) in the Authorization header.  Below are examples of invoking the \"Get R Information\" endpoint.  **cURL** ```bash curl -H \"Authorization: Key XXXXXXXXXXX\" \\      https://positconnect.example.com/__api__/v1/server_settings/r ```  **R** ```r library(httr) apiKey <- \"XXXXXXXXXXX\" result <- GET(\"https://positconnect.example.com/__api__/v1/server_settings/r\",   add_headers(Authorization = paste(\"Key\", apiKey))) ```  **Python** ```python import requests r = requests.get(   'https://positconnect.example.com/__api__/v1/server_settings/r',   headers = { 'Authorization': 'Key XXXXXXXXXXX' } ) ```  <a id=\"api-cors-considerations\"></a> ## API CORS considerations  When accessing the Posit Connect API via a context that enforces CORS restrictions such as a browser, there are some configuration values that will likely need to be set.  Connect does not enable CORS headers and pre-flight requests by default; it must be enabled via the `CORS.Enabled` configuration option.  The CORS header values that are the same for all requests are  - `Access-Control-Allow-Methods` is set to `GET, POST, PUT, PATCH, DELETE, HEAD` - `Access-Control-Allow-Headers` is set to `Origin, Content-Length, Content-Type` - `Access-Control-Max-Age` is set to 12 hours - `Access-Control-Allow-Credentials` is set to `true`  The remaining header value that may be configured is  - `Access-Control-Allow-Origin` which is set from the   `CORS.AllowOrigin` config value and is empty by   default, meaning only local origins and `Server.Address` are   allowed.  <a id=\"API-Error-Codes\"></a> ## API Error Codes  <table> <thead> <tr><th>Error&nbsp;Code</th><th>Message</th><th>HTTP status</th><th>HTTP message</th></tr> </thead> <tbody> <tr><td>1</td><td>An internal failure occurred.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>2</td><td>The requested method or endpoint is not supported.</td><td>404</td><td>Not Found</td></tr> <tr><td>3</td><td>The requested object ID is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>4</td><td>The requested object does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>5</td><td>Application name must be between 3 and 64 alphanumeric characters, dashes, and underscores.</td><td>400</td><td>Bad Request</td></tr> <tr><td>6</td><td>The password is not strong enough. Please try again.</td><td>400</td><td>Bad Request</td></tr> <tr><td>7</td><td>The requested username is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>8</td><td>The requested username is already in use. Usernames are case sensitive. Please ensure you are using the correct case.</td><td>409</td><td>Conflict</td></tr> <tr><td>9</td><td>The requested user could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>10</td><td>The requested object doesn&#39;t belong to you.</td><td>403</td><td>Forbidden</td></tr> <tr><td>11</td><td>The requested filter could not be applied.</td><td>400</td><td>Bad Request</td></tr> <tr><td>12</td><td>A required parameter is missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>13</td><td>The requested range is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>14</td><td>Group name must be between less than 4096 alphanumeric characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>15</td><td>The requested group name is already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>16</td><td>The user is already a member of the group.</td><td>409</td><td>Conflict</td></tr> <tr><td>17</td><td>The requested item could not be removed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>18</td><td>The requested item could not be changed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>19</td><td>You don&#39;t have permission to access this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>20</td><td>You don&#39;t have permission to remove this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>21</td><td>You don&#39;t have permission to change this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>22</td><td>You don&#39;t have permission to perform this operation.</td><td>403</td><td>Forbidden</td></tr> <tr><td>23</td><td>You don&#39;t have permission to give the user this role.</td><td>403</td><td>Forbidden</td></tr> <tr><td>24</td><td>The requested operation requires authentication.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>25</td><td>The parameter is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>26</td><td>An object with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>27</td><td>This version of R is in use and cannot be deleted.</td><td>409</td><td>Conflict</td></tr> <tr><td>28</td><td>No application bundle to deploy.</td><td>404</td><td>Not Found</td></tr> <tr><td>29</td><td>The token is expired. Authentication tokens must be claimed within one hour.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>30</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>31</td><td>Password change prohibited.</td><td>403</td><td>Forbidden</td></tr> <tr><td>32</td><td>The requested filter is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>33</td><td>This user cannot be added as a collaborator because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>34</td><td>The application&#39;s owner cannot be added as a collaborator or viewer.</td><td>400</td><td>Bad Request</td></tr> <tr><td>35</td><td>Cannot delete object as it is being used elsewhere.</td><td>409</td><td>Conflict</td></tr> <tr><td>36</td><td>This user&#39;s username has already been set and cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>37</td><td>Schedules must have a start time and it must be after 1/1/2010.</td><td>400</td><td>Bad Request</td></tr> <tr><td>38</td><td>The application&#39;s manifest is invalid or missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>39</td><td>The application does not support this action.</td><td>400</td><td>Bad Request</td></tr> <tr><td>40</td><td>The current user has not been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>41</td><td>The initial user must specify a password; it cannot be generated.</td><td>400</td><td>Bad Request</td></tr> <tr><td>42</td><td>The user has already been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>43</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>44</td><td>The current user does not have an email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>45</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the Scheduler.MinProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>46</td><td>Internal user fields cannot be changed via API.</td><td>400</td><td>Bad Request</td></tr> <tr><td>47</td><td>You cannot log in because the configured policy requires that the Posit Connect administrator provision your account first. Please contact your administrator.</td><td>403</td><td>Forbidden</td></tr> <tr><td>48</td><td>You cannot change the type of application once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>49</td><td>You don&#39;t have permission to lock/unlock this user.</td><td>403</td><td>Forbidden</td></tr> <tr><td>50</td><td>This user is locked.</td><td>403</td><td>Forbidden</td></tr> <tr><td>51</td><td>Vanity path conflicts with one or more already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>52</td><td>Vanity path is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>53</td><td>Immutable field cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>54</td><td>You cannot set this content to run as the current user</td><td>400</td><td>Bad Request</td></tr> <tr><td>55</td><td>Custom RunAs settings are prohibited for static content.</td><td>400</td><td>Bad Request</td></tr> <tr><td>56</td><td>The RunAs setting references a prohibited Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>57</td><td>The RunAs setting does not reference a valid Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>58</td><td>The RunAs setting references a Unix account that does not have the correct group membership.</td><td>400</td><td>Bad Request</td></tr> <tr><td>59</td><td>There is no rendering available.</td><td>400</td><td>Bad Request</td></tr> <tr><td>60</td><td>This email address is not allowed to login to this server.</td><td>400</td><td>Bad Request</td></tr> <tr><td>61</td><td>You cannot change the role of the only remaining administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>62</td><td>An API key name must not be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>63</td><td>There was a problem communicating with the LDAP authentication server. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>64</td><td>The number of users permitted by this license has been exceeded. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>65</td><td>API applications are not permitted by your license.</td><td>403</td><td>Forbidden</td></tr> <tr><td>66</td><td>You cannot assign ownership to another user.</td><td>400</td><td>Bad Request</td></tr> <tr><td>67</td><td>You must provide the source_key for an existing variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>68</td><td>You cannot promote a variant without a valid rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>69</td><td>The bundle ID of the source and target variants must match</td><td>400</td><td>Bad Request</td></tr> <tr><td>70</td><td>Target rendering is more recent than source rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>71</td><td>Only parameterized documents support promoting output</td><td>400</td><td>Bad Request</td></tr> <tr><td>72</td><td>Not allowed to create schedule with different application association than its variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>73</td><td>You may not schedule ad-hoc variants</td><td>400</td><td>Bad Request</td></tr> <tr><td>74</td><td>The requested report name is not permitted</td><td>400</td><td>Bad Request</td></tr> <tr><td>75</td><td>You may not delete the active bundle for an application</td><td>400</td><td>Bad Request</td></tr> <tr><td>76</td><td>A user using the same Unique ID already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>77</td><td>A tag name cannot be more than 255 characters</td><td>400</td><td>Bad Request</td></tr> <tr><td>78</td><td>A tag must have a name</td><td>400</td><td>Bad Request</td></tr> <tr><td>79</td><td>Cannot assign a category to an app</td><td>400</td><td>Bad Request</td></tr> <tr><td>80</td><td>The target object does not match the provided version.</td><td>409</td><td>Conflict</td></tr> <tr><td>81</td><td>Duplicate names are not permitted; a sibling tag or category already has this name</td><td>400</td><td>Bad Request</td></tr> <tr><td>82</td><td>The bundle for deployment must belong to the target application.</td><td>400</td><td>Bad Request</td></tr> <tr><td>83</td><td>Too many search results. Be more specific.</td><td>400</td><td>Bad Request</td></tr> <tr><td>84</td><td>The token has already been claimed. Tokens can only be claimed once.</td><td>403</td><td>Forbidden</td></tr> <tr><td>85</td><td>A token using the same token key already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>86</td><td>A new token MUST contain a public_key and token in the json body.</td><td>400</td><td>Bad Request</td></tr> <tr><td>87</td><td>The request body cannot be parsed</td><td>400</td><td>Bad Request</td></tr> <tr><td>88</td><td>Cannot apply the requested change because it would make the target object an ancestor of itself.</td><td>400</td><td>Bad Request</td></tr> <tr><td>89</td><td>Unable to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>90</td><td>User self-registration is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>91</td><td>The external authentication provider did not provide a valid username.</td><td>400</td><td>Bad Request</td></tr> <tr><td>92</td><td>XSRF token mismatch</td><td>403</td><td>Forbidden</td></tr> <tr><td>93</td><td>Private variants cannot be configured to email users other than the owner</td><td>403</td><td>Forbidden</td></tr> <tr><td>94</td><td>You can only request a permissions upgrade once per 24-hour period.</td><td>400</td><td>Bad Request</td></tr> <tr><td>95</td><td>This API does not allow the current authentication type.</td><td>403</td><td>Forbidden</td></tr> <tr><td>96</td><td>Incorrect current password.</td><td>403</td><td>Forbidden</td></tr> <tr><td>97</td><td>Changing host or scheme in redirect is forbidden.</td><td>403</td><td>Forbidden</td></tr> <tr><td>98</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>99</td><td>Please re-supply your credentials.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>100</td><td>Unable to remove item. It is being processed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>101</td><td>The provided password change token is invalid.</td><td>403</td><td>Forbidden</td></tr> <tr><td>102</td><td>A schedule for this variant already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>103</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>104</td><td>The content checksum header and body MD5 sum are not equal.</td><td>400</td><td>Bad Request</td></tr> <tr><td>105</td><td>TensorFlow Model APIs are not supported.</td><td>502</td><td>Bad Gateway</td></tr> <tr><td>106</td><td>Unable to update environment variables because they were changed while you were editing them.</td><td>409</td><td>Conflict</td></tr> <tr><td>107</td><td>That username is not allowed because it is prohibited by policy.</td><td>400</td><td>Bad Request</td></tr> <tr><td>108</td><td>Environment changes contain a prohibited variable</td><td>409</td><td>Conflict</td></tr> <tr><td>109</td><td>This type of content is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>110</td><td>You cannot change the categorization of content once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>111</td><td>You cannot change if an app is parameterized once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>112</td><td>The provided user role is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>113</td><td>Invalid MaxProcesses setting. The MaxProcesses setting may not exceed the Scheduler.MaxProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>114</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the MaxProcesses setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>115</td><td>The provided status is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>116</td><td>The requested rendering does not match the variant.</td><td>400</td><td>Bad Request</td></tr> <tr><td>117</td><td>Unknown access type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>118</td><td>This access type is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>119</td><td>The authentication provider does not support creating records from a retrieved ticket. POST new content instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>120</td><td>The authentication provider does not support creating records from POST content. PUT a retrieved ticket instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>121</td><td>The request JSON is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>122</td><td>Application title must be between 3 and 1024 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>123</td><td>Application description must be 4096 characters or less.</td><td>400</td><td>Bad Request</td></tr> <tr><td>124</td><td>No administrator has a configured email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>125</td><td>Content-Length cannot be 0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>126</td><td>Request Content-Length did not match the number of bytes received.</td><td>400</td><td>Bad Request</td></tr> <tr><td>127</td><td>The temp_ticket is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>128</td><td>The email address cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>129</td><td>The user unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>130</td><td>The group unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>131</td><td>A group using the same unique ID already exists.</td><td>400</td><td>Bad Request</td></tr> <tr><td>132</td><td>The configured provider cannot access this endpoint.</td><td>400</td><td>Bad Request</td></tr> <tr><td>133</td><td>The source variant belongs to a different app.</td><td>400</td><td>Bad Request</td></tr> <tr><td>134</td><td>Unable to write bundle to disk.</td><td>400</td><td>Bad Request</td></tr> <tr><td>135</td><td>Unable to extract the bundle.</td><td>400</td><td>Bad Request</td></tr> <tr><td>136</td><td>Time values must be in RFC3339 format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>137</td><td>The start of the time interval cannot be in the past, or more than 5 years in the future.</td><td>400</td><td>Bad Request</td></tr> <tr><td>138</td><td>The end of the time interval cannot be earlier than the start time.</td><td>400</td><td>Bad Request</td></tr> <tr><td>139</td><td>The length of the time interval cannot be more than 1 year.</td><td>400</td><td>Bad Request</td></tr> <tr><td>140</td><td>The time interval must have both start and end times.</td><td>400</td><td>Bad Request</td></tr> <tr><td>141</td><td>Task lookup failures can indicate that a load balancer is not using sticky sessions or a client is not including the session cookie. Details: https://docs.posit.co/connect/admin/load-balancing/</td><td>404</td><td>Not Found</td></tr> <tr><td>142</td><td>The app is already managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>143</td><td>The app is not managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>144</td><td>Uploading a content bundle is not allowed for this application since it is managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>145</td><td>Git support is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>146</td><td>Git URLs must be absolute and cannot have username, query, or fragment.</td><td>400</td><td>Bad Request</td></tr> <tr><td>147</td><td>The specified app mode is not executable.</td><td>400</td><td>Bad Request</td></tr> <tr><td>148</td><td>The specified app mode is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>149</td><td>Environment changes contain a duplicated variable name.</td><td>409</td><td>Conflict</td></tr> <tr><td>150</td><td>The load factor must be between 0.0 and 1.0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>151</td><td>The timeout must be between 0 and 2592000 seconds.</td><td>400</td><td>Bad Request</td></tr> <tr><td>152</td><td>The principal type must be &#39;user&#39; or &#39;group&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>153</td><td>The requested group could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>154</td><td>The requested user is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>155</td><td>The requested group is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>156</td><td>This user cannot be assigned as the owner because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>157</td><td>The requested parent tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>158</td><td>The requested tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>159</td><td>The permission request submitted already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>160</td><td>The email notification for a permission request cannot be delivered due to missing or invalid email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>161</td><td>The include option specified is not valid</td><td>400</td><td>Bad Request</td></tr> <tr><td>162</td><td>The specified hostname is not an active Connect host</td><td>400</td><td>Bad Request</td></tr> <tr><td>163</td><td>The specified job cannot be terminated because it is not active</td><td>409</td><td>Conflict</td></tr> <tr><td>164</td><td>Git URLs must use HTTP or HTTPS.</td><td>400</td><td>Bad Request</td></tr> <tr><td>165</td><td>Cannot create bootstrapping user due to existing users</td><td>403</td><td>Forbidden</td></tr> <tr><td>166</td><td>The provided JWT is invalid</td><td>401</td><td>Unauthorized</td></tr> <tr><td>167</td><td>The controls file coundn&#39;t be read.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>168</td><td>The title must be between 1 and 64 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>169</td><td>The description cannot be more than 4096 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>170</td><td>The cluster_name must be &#39;Kubernetes&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>171</td><td>A unique name for the environment must be provided.</td><td>400</td><td>Bad Request</td></tr> <tr><td>172</td><td>Unknown matching type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>173</td><td>The installation path must be an absolute Unix filepath.</td><td>400</td><td>Bad Request</td></tr> <tr><td>174</td><td>The installation version must use semantic version format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>175</td><td>An environment with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>176</td><td>The specified service account name is not a valid DNS subdomain.</td><td>400</td><td>Bad Request</td></tr> <tr><td>177</td><td>The supervisor path may not contain any of the following whitespace control characters: \\t\\n\\b\\f\\n</td><td>400</td><td>Bad Request</td></tr> <tr><td>178</td><td>The specified service account name is not recognized by launcher in the Kubernetes namespace.</td><td>400</td><td>Bad Request</td></tr> <tr><td>179</td><td>Unsupported runtime language identifier</td><td>400</td><td>Bad Request</td></tr> <tr><td>180</td><td>The request did not identify a cache location</td><td>400</td><td>Bad Request</td></tr> <tr><td>181</td><td>Invalid MemoryRequest setting. The MemoryRequest setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>182</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the Scheduler.MaxMemoryRequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>183</td><td>Invalid MemoryLimit setting. The MemoryLimit setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>184</td><td>Invalid MemoryLimit setting. The MemoryLimit setting may not exceed the Scheduler.MaxMemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>185</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the MemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>186</td><td>Invalid CPURequest setting. The CPURequest setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>187</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the Scheduler.MaxCPURequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>188</td><td>Invalid CPULimit setting. The CPULimit setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>189</td><td>Invalid CPULimit setting. The CPULimit setting may not exceed the Scheduler.MaxCPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>190</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the CPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>191</td><td>Invalid MinProcesses setting. The MinProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>192</td><td>Invalid MaxProcesses setting. The MaxProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>193</td><td>When provided, the default_image_name cannot be empty and may not contain any whitespace characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>194</td><td>Runtime cache management is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>195</td><td>Invalid configuration. Service accounts cannot be set on content. Please contact an administrator to update Connect&#39;s server configuration to enable this feature.</td><td>400</td><td>Bad Request</td></tr> </tbody> </table>   # noqa: E501

    OpenAPI spec version: 2023.09.0
    Contact: support@posit.co
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""

from __future__ import absolute_import

import re  # noqa: F401

# python 2 and python 3 compatibility library
import six

from connectapi.api_client import ApiClient


class UsersApi(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    Ref: https://github.com/swagger-api/swagger-codegen
    """

    def __init__(self, api_client=None):
        if api_client is None:
            api_client = ApiClient()
        self.api_client = api_client

    def create_pull_user(self, body, **kwargs):  # noqa: E501
        """Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google)   # noqa: E501

        This endpoint creates the given user on the Posit Connect server.  - This endpoint is used only for LDAP and OAuth2 with Google   authentication. All other authentication providers should   use the    <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint. - Unlike the   <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint, publisher or administrator access is required to access this   endpoint.  #### User Creation Workflow on LDAP and OAuth2 with Google  This endpoint requires authentication, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect? The first user can be created by simply logging into Posit Connect. The Posit Connect Server API cannot be used to create the first user. Once logged in, you can create an API Key.  For LDAP and OAuth2 with Google, the API lets you identify an existing user in the LDAP or OAuth2 with Google system and create a corresponding account on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/users/remote\">GET /v1/users/remote</a>   endpoint. This   endpoint will return a list of potential matching accounts   in LDAP or OAuth2 with Google. A user with no account on Posit Connect will   lack a `guid`. Note the `temp_ticket` for the desired user   account. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding account on Posit Connect.  The [Create a User from LDAP/OAuth](../cookbook/users/#create-user-ldap-oauth2) recipe in the API Cookbook has sample code using this workflow.  #### LDAP and OAuth2 with Google Authentication  - The created user role will default to the role specified by   the config setting `Authorization.DefaultUserRole`.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_pull_user(body, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param V1UsersBody body: The request body needed for creating a user on the Posit Connect
server. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.create_pull_user_with_http_info(body, **kwargs)  # noqa: E501
        else:
            (data) = self.create_pull_user_with_http_info(body, **kwargs)  # noqa: E501
            return data

    def create_pull_user_with_http_info(self, body, **kwargs):  # noqa: E501
        """Create a user using details from a remote authentication provider (LDAP, OAuth2 with Google)   # noqa: E501

        This endpoint creates the given user on the Posit Connect server.  - This endpoint is used only for LDAP and OAuth2 with Google   authentication. All other authentication providers should   use the    <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint. - Unlike the   <a href=\"#post-/v1/users\">POST /v1/users</a>   endpoint, publisher or administrator access is required to access this   endpoint.  #### User Creation Workflow on LDAP and OAuth2 with Google  This endpoint requires authentication, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect? The first user can be created by simply logging into Posit Connect. The Posit Connect Server API cannot be used to create the first user. Once logged in, you can create an API Key.  For LDAP and OAuth2 with Google, the API lets you identify an existing user in the LDAP or OAuth2 with Google system and create a corresponding account on Posit Connect. This is a two-step process:  - Use the    <a href=\"#get-/v1/users/remote\">GET /v1/users/remote</a>   endpoint. This   endpoint will return a list of potential matching accounts   in LDAP or OAuth2 with Google. A user with no account on Posit Connect will   lack a `guid`. Note the `temp_ticket` for the desired user   account. - Use this PUT endpoint with the `temp_ticket` to create a   corresponding account on Posit Connect.  The [Create a User from LDAP/OAuth](../cookbook/users/#create-user-ldap-oauth2) recipe in the API Cookbook has sample code using this workflow.  #### LDAP and OAuth2 with Google Authentication  - The created user role will default to the role specified by   the config setting `Authorization.DefaultUserRole`.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_pull_user_with_http_info(body, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param V1UsersBody body: The request body needed for creating a user on the Posit Connect
server. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method create_pull_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'body' is set
        if ('body' not in params or
                params['body'] is None):
            raise ValueError("Missing the required parameter `body` when calling `create_pull_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users', 'PUT',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def create_push_user(self, body, **kwargs):  # noqa: E501
        """Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google)   # noqa: E501

        This endpoint creates the given user.  - This endpoint is used only for SAML, OAuth2 (non-Google), password, PAM, and proxied   authentication. All other authentication providers should   use the    <a href=\"#put-/v1/users\">PUT /v1/users</a>   endpoint. - Administrator access is required to create *other* users.  #### Initial User Creation Workflow  This endpoint requires authentication to create *other* users, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect?  - For password authentication, you can use this endpoint   without an API Key to create the first user. The first user   will be an administrator. - For SAML, OAuth2 (non-Google), PAM or proxied authentication, the first user can be   created by logging into Posit Connect. The API cannot be used.  Once the first user is created, an API Key can be used to access this endpoint and create subsequent users. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  #### All Authentication Providers  - When `user_role` is not specified, it will default to the   role specified by the config setting   `Authorization.DefaultUserRole`.  #### SAML, OAuth2 (non-Google), PAM and Proxied Authentication  - An API Key must always be used. Users cannot use this   endpoint to create their own account. - Administrator access is always required to create accounts.  #### Password Authentication  - Users must confirm their account through an email. This   feature is unique to password authentication. - Administrator access is always required except for the first   created user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_push_user(body, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param V1UsersBody1 body: The new user values. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.create_push_user_with_http_info(body, **kwargs)  # noqa: E501
        else:
            (data) = self.create_push_user_with_http_info(body, **kwargs)  # noqa: E501
            return data

    def create_push_user_with_http_info(self, body, **kwargs):  # noqa: E501
        """Create a user from caller-supplied details (SAML, password, PAM, proxied, OAuth2 except with Google)   # noqa: E501

        This endpoint creates the given user.  - This endpoint is used only for SAML, OAuth2 (non-Google), password, PAM, and proxied   authentication. All other authentication providers should   use the    <a href=\"#put-/v1/users\">PUT /v1/users</a>   endpoint. - Administrator access is required to create *other* users.  #### Initial User Creation Workflow  This endpoint requires authentication to create *other* users, which means that you need an API Key for access. How do you get an API Key if there are no users in Posit Connect?  - For password authentication, you can use this endpoint   without an API Key to create the first user. The first user   will be an administrator. - For SAML, OAuth2 (non-Google), PAM or proxied authentication, the first user can be   created by logging into Posit Connect. The API cannot be used.  Once the first user is created, an API Key can be used to access this endpoint and create subsequent users. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  #### All Authentication Providers  - When `user_role` is not specified, it will default to the   role specified by the config setting   `Authorization.DefaultUserRole`.  #### SAML, OAuth2 (non-Google), PAM and Proxied Authentication  - An API Key must always be used. Users cannot use this   endpoint to create their own account. - Administrator access is always required to create accounts.  #### Password Authentication  - Users must confirm their account through an email. This   feature is unique to password authentication. - Administrator access is always required except for the first   created user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.create_push_user_with_http_info(body, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param V1UsersBody1 body: The new user values. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method create_push_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'body' is set
        if ('body' not in params or
                params['body'] is None):
            raise ValueError("Missing the required parameter `body` when calling `create_push_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def get_current_user(self, **kwargs):  # noqa: E501
        """Get current user details  # noqa: E501

        Get detailed information on the requesting user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_current_user(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.get_current_user_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.get_current_user_with_http_info(**kwargs)  # noqa: E501
            return data

    def get_current_user_with_http_info(self, **kwargs):  # noqa: E501
        """Get current user details  # noqa: E501

        Get detailed information on the requesting user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_current_user_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = []  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method get_current_user" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/user', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def get_user(self, guid, **kwargs):  # noqa: E501
        """Get user details  # noqa: E501

        Get detailed information on a specific user.  The `email` field is not populated for non-admins when `Server.HideEmailAddresses` is enabled.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_user(guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.get_user_with_http_info(guid, **kwargs)  # noqa: E501
        else:
            (data) = self.get_user_with_http_info(guid, **kwargs)  # noqa: E501
            return data

    def get_user_with_http_info(self, guid, **kwargs):  # noqa: E501
        """Get user details  # noqa: E501

        Get detailed information on a specific user.  The `email` field is not populated for non-admins when `Server.HideEmailAddresses` is enabled.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_user_with_http_info(guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: User
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['guid']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method get_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'guid' is set
        if ('guid' not in params or
                params['guid'] is None):
            raise ValueError("Missing the required parameter `guid` when calling `get_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'guid' in params:
            path_params['guid'] = params['guid']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users/{guid}', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='User',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def get_users(self, **kwargs):  # noqa: E501
        """List or search for user details  # noqa: E501

        This endpoint lists local users. When called with a prefix parameter, it searches for local users matching the prefix.  Results are sorted by first name, then last name, then username, then email. `prefix` searches are first sorted based on similarity to the prefix and then by first name, last name, username, email. The `prefix` can also be an exact match for the user's DN (for LDAP) or the auth provider's unique ID for the user, if any.  - Administrator access is required for filtering by   `account_status`. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.  Note that searching by `prefix` will always return the first page of results.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_users(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str prefix: Filters users by prefix (username, first name, or last name). The filter is case insensitive.
        :param str user_role: Filter by user role. \"|\" represents logical OR. For example, `user_role=viewer|publisher` means users who are either a viewer or a publisher will be included in the result.  Note that for `user_role`, logical AND is also supported but always returns no results. For example, `user_role=viewer&user_role=publisher` tries to return users who are both viewers and publishers.
        :param str account_status: Filter by account status. \"|\" represents logical OR. For example, `account_status=locked|licensed` means users who are either locked or licensed. - `locked` - Users with a locked account. - `licensed` - Users regarded as licensed (unlocked and   recently active). - `inactive` - Users not locked and not recently active.  Note that for `account_status`, logical AND is also supported but always returns no results. For example, `account_status=locked&account_status=licensed` tries to return users who are both locked and licensed.
        :param int page_number: The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned.
        :param int page_size: The number of items to include in each page. This parameter is \"best effort\" since there may not be enough users to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned.
        :param bool asc_order: Whether or not to return the users in ascending order, sorted by first name, last name, username, and email.
        :return: Users
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.get_users_with_http_info(**kwargs)  # noqa: E501
        else:
            (data) = self.get_users_with_http_info(**kwargs)  # noqa: E501
            return data

    def get_users_with_http_info(self, **kwargs):  # noqa: E501
        """List or search for user details  # noqa: E501

        This endpoint lists local users. When called with a prefix parameter, it searches for local users matching the prefix.  Results are sorted by first name, then last name, then username, then email. `prefix` searches are first sorted based on similarity to the prefix and then by first name, last name, username, email. The `prefix` can also be an exact match for the user's DN (for LDAP) or the auth provider's unique ID for the user, if any.  - Administrator access is required for filtering by   `account_status`. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.  #### Pagination  This endpoint uses offset pagination (using page numbers). The [Offset Pagination](../cookbook/pagination/#offset-pagination) recipe in the Posit Connect API Cookbook has sample code for fetching multiple pages from a list endpoint.  Note that searching by `prefix` will always return the first page of results.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.get_users_with_http_info(async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str prefix: Filters users by prefix (username, first name, or last name). The filter is case insensitive.
        :param str user_role: Filter by user role. \"|\" represents logical OR. For example, `user_role=viewer|publisher` means users who are either a viewer or a publisher will be included in the result.  Note that for `user_role`, logical AND is also supported but always returns no results. For example, `user_role=viewer&user_role=publisher` tries to return users who are both viewers and publishers.
        :param str account_status: Filter by account status. \"|\" represents logical OR. For example, `account_status=locked|licensed` means users who are either locked or licensed. - `locked` - Users with a locked account. - `licensed` - Users regarded as licensed (unlocked and   recently active). - `inactive` - Users not locked and not recently active.  Note that for `account_status`, logical AND is also supported but always returns no results. For example, `account_status=locked&account_status=licensed` tries to return users who are both locked and licensed.
        :param int page_number: The page to return relative to the given `page_size`. If `page_number` is 0 or negative, an error will be returned.
        :param int page_size: The number of items to include in each page. This parameter is \"best effort\" since there may not be enough users to honor the request. If `page_size` is less than 1 or greater than 500, an error will be returned.
        :param bool asc_order: Whether or not to return the users in ascending order, sorted by first name, last name, username, and email.
        :return: Users
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['prefix', 'user_role', 'account_status', 'page_number', 'page_size', 'asc_order']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method get_users" % key
                )
            params[key] = val
        del params['kwargs']

        collection_formats = {}

        path_params = {}

        query_params = []
        if 'prefix' in params:
            query_params.append(('prefix', params['prefix']))  # noqa: E501
        if 'user_role' in params:
            query_params.append(('user_role', params['user_role']))  # noqa: E501
        if 'account_status' in params:
            query_params.append(('account_status', params['account_status']))  # noqa: E501
        if 'page_number' in params:
            query_params.append(('page_number', params['page_number']))  # noqa: E501
        if 'page_size' in params:
            query_params.append(('page_size', params['page_size']))  # noqa: E501
        if 'asc_order' in params:
            query_params.append(('asc_order', params['asc_order']))  # noqa: E501

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='Users',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def lock_user(self, body, guid, **kwargs):  # noqa: E501
        """Lock a user  # noqa: E501

        This endpoint locks or unlocks a given user account.  - License limits are taken into account when unlocking a user. - Administrator access is required to access this endpoint. - Users are able to lock themselves.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.lock_user(body, guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param GuidLockBody body: The lock request (required)
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.lock_user_with_http_info(body, guid, **kwargs)  # noqa: E501
        else:
            (data) = self.lock_user_with_http_info(body, guid, **kwargs)  # noqa: E501
            return data

    def lock_user_with_http_info(self, body, guid, **kwargs):  # noqa: E501
        """Lock a user  # noqa: E501

        This endpoint locks or unlocks a given user account.  - License limits are taken into account when unlocking a user. - Administrator access is required to access this endpoint. - Users are able to lock themselves.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.lock_user_with_http_info(body, guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param GuidLockBody body: The lock request (required)
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: None
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body', 'guid']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method lock_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'body' is set
        if ('body' not in params or
                params['body'] is None):
            raise ValueError("Missing the required parameter `body` when calling `lock_user`")  # noqa: E501
        # verify the required parameter 'guid' is set
        if ('guid' not in params or
                params['guid'] is None):
            raise ValueError("Missing the required parameter `guid` when calling `lock_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'guid' in params:
            path_params['guid'] = params['guid']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users/{guid}/lock', 'POST',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type=None,  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def search_remote_users(self, prefix, **kwargs):  # noqa: E501
        """Search for user details from a remote provider  # noqa: E501

        This endpoint is used to support operations against users who do not have an Posit Connect account, such as <a href=\"#put-/v1/users\">creating LDAP and OAuth2 with Google users</a> See <a href=\"#get-/v1/users\">GET /v1/users</a> for listing users.  This endpoint searches for users on Posit Connect and on your LDAP or OAuth2 with Google system.  Results are first sorted based on similarity to the `prefix` and then by first name, last name, username, and email.  - This endpoint can be used only by LDAP or OAuth2 with Google   authentication and will return an error otherwise. - Publisher or administrator access is required to access this   endpoint. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_remote_users(prefix, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str prefix: Search users by prefix (username, first name, or last name). `prefix` is case insensitive. (required)
        :param int limit: The maximum number of users to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned.
        :return: RemoteSearchResults
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.search_remote_users_with_http_info(prefix, **kwargs)  # noqa: E501
        else:
            (data) = self.search_remote_users_with_http_info(prefix, **kwargs)  # noqa: E501
            return data

    def search_remote_users_with_http_info(self, prefix, **kwargs):  # noqa: E501
        """Search for user details from a remote provider  # noqa: E501

        This endpoint is used to support operations against users who do not have an Posit Connect account, such as <a href=\"#put-/v1/users\">creating LDAP and OAuth2 with Google users</a> See <a href=\"#get-/v1/users\">GET /v1/users</a> for listing users.  This endpoint searches for users on Posit Connect and on your LDAP or OAuth2 with Google system.  Results are first sorted based on similarity to the `prefix` and then by first name, last name, username, and email.  - This endpoint can be used only by LDAP or OAuth2 with Google   authentication and will return an error otherwise. - Publisher or administrator access is required to access this   endpoint. - The `email` field is not populated for non-admins when   `Server.HideEmailAddresses` is enabled. - When the user making the request is a viewer and   `Authorization.ViewersCanOnlySeeThemselves` is being used,   the results contain only the given user.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.search_remote_users_with_http_info(prefix, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param str prefix: Search users by prefix (username, first name, or last name). `prefix` is case insensitive. (required)
        :param int limit: The maximum number of users to include in the results. If `limit` is less than 1 or greater than 500, an error will be returned.
        :return: RemoteSearchResults
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['prefix', 'limit']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method search_remote_users" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'prefix' is set
        if ('prefix' not in params or
                params['prefix'] is None):
            raise ValueError("Missing the required parameter `prefix` when calling `search_remote_users`")  # noqa: E501

        collection_formats = {}

        path_params = {}

        query_params = []
        if 'prefix' in params:
            query_params.append(('prefix', params['prefix']))  # noqa: E501
        if 'limit' in params:
            query_params.append(('limit', params['limit']))  # noqa: E501

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users/remote', 'GET',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='RemoteSearchResults',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)

    def update_user(self, body, guid, **kwargs):  # noqa: E501
        """Update a user  # noqa: E501

        This endpoint updates a given user and returns the updated user properties. Note that it returns only the properties that can be modified by this endpoint.  If the authentication provider allows it:  - a user can change their own user properties. - another user's properties can be changed with administrator   access. - The configuration setting `Authorization.UserInfoEditableBy`   controls whether or not non-admins can edit their own properties.  #### Password Authentication  - Emails are required. - Changing an unconfirmed user's email will cause the   confirmation email to be resent to the new email.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user(body, guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param UsersGuidBody body: The new user values. (required)
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: EditableUser
                 If the method is called asynchronously,
                 returns the request thread.
        """
        kwargs['_return_http_data_only'] = True
        if kwargs.get('async_req'):
            return self.update_user_with_http_info(body, guid, **kwargs)  # noqa: E501
        else:
            (data) = self.update_user_with_http_info(body, guid, **kwargs)  # noqa: E501
            return data

    def update_user_with_http_info(self, body, guid, **kwargs):  # noqa: E501
        """Update a user  # noqa: E501

        This endpoint updates a given user and returns the updated user properties. Note that it returns only the properties that can be modified by this endpoint.  If the authentication provider allows it:  - a user can change their own user properties. - another user's properties can be changed with administrator   access. - The configuration setting `Authorization.UserInfoEditableBy`   controls whether or not non-admins can edit their own properties.  #### Password Authentication  - Emails are required. - Changing an unconfirmed user's email will cause the   confirmation email to be resent to the new email.  # noqa: E501
        This method makes a synchronous HTTP request by default. To make an
        asynchronous HTTP request, please pass async_req=True
        >>> thread = api.update_user_with_http_info(body, guid, async_req=True)
        >>> result = thread.get()

        :param async_req bool
        :param UsersGuidBody body: The new user values. (required)
        :param str guid: The user's GUID, or unique identifier  Example value = `6f300623-1e0c-48e6-a473-ddf630c0c0c3` using UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122) format. (required)
        :return: EditableUser
                 If the method is called asynchronously,
                 returns the request thread.
        """

        all_params = ['body', 'guid']  # noqa: E501
        all_params.append('async_req')
        all_params.append('_return_http_data_only')
        all_params.append('_preload_content')
        all_params.append('_request_timeout')

        params = locals()
        for key, val in six.iteritems(params['kwargs']):
            if key not in all_params:
                raise TypeError(
                    "Got an unexpected keyword argument '%s'"
                    " to method update_user" % key
                )
            params[key] = val
        del params['kwargs']
        # verify the required parameter 'body' is set
        if ('body' not in params or
                params['body'] is None):
            raise ValueError("Missing the required parameter `body` when calling `update_user`")  # noqa: E501
        # verify the required parameter 'guid' is set
        if ('guid' not in params or
                params['guid'] is None):
            raise ValueError("Missing the required parameter `guid` when calling `update_user`")  # noqa: E501

        collection_formats = {}

        path_params = {}
        if 'guid' in params:
            path_params['guid'] = params['guid']  # noqa: E501

        query_params = []

        header_params = {}

        form_params = []
        local_var_files = {}

        body_params = None
        if 'body' in params:
            body_params = params['body']
        # HTTP header `Accept`
        header_params['Accept'] = self.api_client.select_header_accept(
            ['application/json'])  # noqa: E501

        # HTTP header `Content-Type`
        header_params['Content-Type'] = self.api_client.select_header_content_type(  # noqa: E501
            ['application/json'])  # noqa: E501

        # Authentication setting
        auth_settings = ['apiKey']  # noqa: E501

        return self.api_client.call_api(
            '/v1/users/{guid}', 'PUT',
            path_params,
            query_params,
            header_params,
            body=body_params,
            post_params=form_params,
            files=local_var_files,
            response_type='EditableUser',  # noqa: E501
            auth_settings=auth_settings,
            async_req=params.get('async_req'),
            _return_http_data_only=params.get('_return_http_data_only'),
            _preload_content=params.get('_preload_content', True),
            _request_timeout=params.get('_request_timeout'),
            collection_formats=collection_formats)
