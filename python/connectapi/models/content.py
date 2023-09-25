# coding: utf-8

"""
    Posit Connect API Reference

    The Posit Connect Server API can be used to perform certain user actions remotely. You will need to install a tool or library that can make HTTP requests, such as: - [httr](http://httr.r-lib.org/) (R HTTP library) - [curl](https://curl.se/) (Linux tool for making HTTP calls) - [requests](https://requests.readthedocs.io/en/master/) (Python HTTP library)  Please note that all API paths are relative to the base API URL (e.g., <code>http:/localhost:3939/\\_\\_api\\_\\_</code>). Unless otherwise noted, all endpoints which accept a request body will require the body to be in JSON format. Similarly, all response bodies will be returned in JSON format.  <a id=\"download\"></a> ## Specifications  The Posit Connect Server API Swagger specification is available for download as either JSON or YAML. Both formats contain the same information, also presented on this page.  * <a href=\"swagger.json\" title=\"Swagger (JSON)\" target=\"_blank\">Swagger (JSON)</a> * <a href=\"swagger.yaml\" title=\"Swagger (YAML)\" target=\"_blank\">Swagger (YAML)</a>  <a id=\"versioning-policy\"></a> ## Versioning of the API  The Posit Connect Server API uses a simple, single number versioning scheme as noted as the first part of each endpoint path.  This version number will only be incremented in the event that non-backward compatible changes are made to an existing endpoint. Note that this occurs on a per-endpoint basis; see the section on [deprecation](#deprecation) below for more information.  Changes that are considered backward compatible are:  * New fields in responses. * New non-required fields in requests. * New endpoint behavior which does not violate the current functional intent of the   endpoint.  Changes that are considered non-backward compatible are:  * Removal or rename of request or response fields. * A change of the type or format of one or more request or response fields. * Addition of new required request fields. * A substantial deviation from the current functional intent of the endpoint.  The points relating to functional intent are assumed to be extremely rare as more often such situations will result in a completely new endpoint, which makes the change a backward compatible addition.  ### Experimentation  Posit Connect labels experimental endpoints in the API by including `/experimental` in the endpoint path immediately after the version indicator.  If an endpoint is noted as experimental, it should not be relied upon for any production work.  These are endpoints that Posit Connect is making available to our customers to solicit feedback; they are subject to change without notice.  Such changes include anything from altered request/response shapes, to complete abandonment of the endpoint.  This public review of an experimental endpoint will last as long as necessary to either prove its viability or to determine that it’s not really needed.  The time for this will vary based on the intricacies of each endpoint.  When the endpoint is finalized, the next release of Posit Connect will mark the experimental path as deprecated while adding the endpoint without the `/experimental` prefix. The path with the experimental prefix will be removed six months later.  The documentation for the endpoint will also note, during that time, the original, experimental, path.  All experimental endpoints are clearly marked as such in this documentation.  <a id=\"deprecation\"></a> ### Deprecation and Removal of Old Versions  It is possible that Posit Connect may decide to deprecate an endpoint.  This will happen if either the endpoint serves no useful purpose because it’s functionality is now handled by a different endpoint or because there is a newer version of the endpoint that should be used.  If a deprecated endpoint is called, the response to it will include an extra HTTP header called, `X-Deprecated-Endpoint` and will have as a value the path of the endpoint that should be used instead.  If the functionality has no direct replacement, the value will be set to `n/a`.  Deprecated versions of an endpoint will be supported for 1 year from the release date of Posit Connect in which the endpoint was marked as deprecated.  At that time, the endpoint is subject to removal at the discretion of Posit Connect.  The life cycle of an endpoint will follow these steps.  1. The `/v1/endpoint` is public and in use by Posit Connect customers. 1. Posit Connect makes `/v2/experimental/endpoint` available for testing and feedback.    Customers should still use `/v1/endpoint` for production work. 1. Posit Connect moves version 2 of the endpoint out of experimentation so, all within    the same release:     1. `/v1/endpoint` is marked as deprecated.     1. `/v2/experimental/endpoint` is marked as deprecated.     1. `/v2/endpoint` is made public. 1. Six months later, `/v2/experimental/endpoint` is removed from the product. 1. Twelve months later, `/v1/endpoint` is removed from the product.  Note that it is possible that Posit Connect may produce a new version of an existing endpoint without making an experimental version of it first.  The same life cycle, without those parts, will still be followed.  <a id=\"authentication\"> </a> ## Authentication  Most endpoints require you to identify yourself as a valid Posit Connect user. You do this by specifying an API Key when you make a call to the server. The [API Keys](../user/api-keys/) chapter of the Posit Connect User Guide explains how to create an API Key.  <a id=\"api-keys\"></a> ### API Keys  API Keys are managed by each user in the Posit Connect dashboard. If you ever lose an API Key or otherwise feel it has been compromised, use the dashboard to revoke the key and create another one.  **WARNING**: Keep your API Key safe.  If your Posit Connect server's URL does not begin with `https`, your API Key could be intercepted and used by a malicious actor.  Once you have an API Key, you can authenticate by passing the key with a prefix of `\"Key \"` (the space is important) in the Authorization header.  Below are examples of invoking the \"Get R Information\" endpoint.  **cURL** ```bash curl -H \"Authorization: Key XXXXXXXXXXX\" \\      https://positconnect.example.com/__api__/v1/server_settings/r ```  **R** ```r library(httr) apiKey <- \"XXXXXXXXXXX\" result <- GET(\"https://positconnect.example.com/__api__/v1/server_settings/r\",   add_headers(Authorization = paste(\"Key\", apiKey))) ```  **Python** ```python import requests r = requests.get(   'https://positconnect.example.com/__api__/v1/server_settings/r',   headers = { 'Authorization': 'Key XXXXXXXXXXX' } ) ```  <a id=\"api-cors-considerations\"></a> ## API CORS considerations  When accessing the Posit Connect API via a context that enforces CORS restrictions such as a browser, there are some configuration values that will likely need to be set.  Connect does not enable CORS headers and pre-flight requests by default; it must be enabled via the `CORS.Enabled` configuration option.  The CORS header values that are the same for all requests are  - `Access-Control-Allow-Methods` is set to `GET, POST, PUT, PATCH, DELETE, HEAD` - `Access-Control-Allow-Headers` is set to `Origin, Content-Length, Content-Type` - `Access-Control-Max-Age` is set to 12 hours - `Access-Control-Allow-Credentials` is set to `true`  The remaining header value that may be configured is  - `Access-Control-Allow-Origin` which is set from the   `CORS.AllowOrigin` config value and is empty by   default, meaning only local origins and `Server.Address` are   allowed.  <a id=\"API-Error-Codes\"></a> ## API Error Codes  <table> <thead> <tr><th>Error&nbsp;Code</th><th>Message</th><th>HTTP status</th><th>HTTP message</th></tr> </thead> <tbody> <tr><td>1</td><td>An internal failure occurred.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>2</td><td>The requested method or endpoint is not supported.</td><td>404</td><td>Not Found</td></tr> <tr><td>3</td><td>The requested object ID is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>4</td><td>The requested object does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>5</td><td>Application name must be between 3 and 64 alphanumeric characters, dashes, and underscores.</td><td>400</td><td>Bad Request</td></tr> <tr><td>6</td><td>The password is not strong enough. Please try again.</td><td>400</td><td>Bad Request</td></tr> <tr><td>7</td><td>The requested username is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>8</td><td>The requested username is already in use. Usernames are case sensitive. Please ensure you are using the correct case.</td><td>409</td><td>Conflict</td></tr> <tr><td>9</td><td>The requested user could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>10</td><td>The requested object doesn&#39;t belong to you.</td><td>403</td><td>Forbidden</td></tr> <tr><td>11</td><td>The requested filter could not be applied.</td><td>400</td><td>Bad Request</td></tr> <tr><td>12</td><td>A required parameter is missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>13</td><td>The requested range is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>14</td><td>Group name must be between less than 4096 alphanumeric characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>15</td><td>The requested group name is already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>16</td><td>The user is already a member of the group.</td><td>409</td><td>Conflict</td></tr> <tr><td>17</td><td>The requested item could not be removed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>18</td><td>The requested item could not be changed because it does not exist.</td><td>404</td><td>Not Found</td></tr> <tr><td>19</td><td>You don&#39;t have permission to access this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>20</td><td>You don&#39;t have permission to remove this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>21</td><td>You don&#39;t have permission to change this item.</td><td>403</td><td>Forbidden</td></tr> <tr><td>22</td><td>You don&#39;t have permission to perform this operation.</td><td>403</td><td>Forbidden</td></tr> <tr><td>23</td><td>You don&#39;t have permission to give the user this role.</td><td>403</td><td>Forbidden</td></tr> <tr><td>24</td><td>The requested operation requires authentication.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>25</td><td>The parameter is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>26</td><td>An object with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>27</td><td>This version of R is in use and cannot be deleted.</td><td>409</td><td>Conflict</td></tr> <tr><td>28</td><td>No application bundle to deploy.</td><td>404</td><td>Not Found</td></tr> <tr><td>29</td><td>The token is expired. Authentication tokens must be claimed within one hour.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>30</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>31</td><td>Password change prohibited.</td><td>403</td><td>Forbidden</td></tr> <tr><td>32</td><td>The requested filter is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>33</td><td>This user cannot be added as a collaborator because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>34</td><td>The application&#39;s owner cannot be added as a collaborator or viewer.</td><td>400</td><td>Bad Request</td></tr> <tr><td>35</td><td>Cannot delete object as it is being used elsewhere.</td><td>409</td><td>Conflict</td></tr> <tr><td>36</td><td>This user&#39;s username has already been set and cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>37</td><td>Schedules must have a start time and it must be after 1/1/2010.</td><td>400</td><td>Bad Request</td></tr> <tr><td>38</td><td>The application&#39;s manifest is invalid or missing.</td><td>400</td><td>Bad Request</td></tr> <tr><td>39</td><td>The application does not support this action.</td><td>400</td><td>Bad Request</td></tr> <tr><td>40</td><td>The current user has not been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>41</td><td>The initial user must specify a password; it cannot be generated.</td><td>400</td><td>Bad Request</td></tr> <tr><td>42</td><td>The user has already been confirmed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>43</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>44</td><td>The current user does not have an email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>45</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the Scheduler.MinProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>46</td><td>Internal user fields cannot be changed via API.</td><td>400</td><td>Bad Request</td></tr> <tr><td>47</td><td>You cannot log in because the configured policy requires that the Posit Connect administrator provision your account first. Please contact your administrator.</td><td>403</td><td>Forbidden</td></tr> <tr><td>48</td><td>You cannot change the type of application once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>49</td><td>You don&#39;t have permission to lock/unlock this user.</td><td>403</td><td>Forbidden</td></tr> <tr><td>50</td><td>This user is locked.</td><td>403</td><td>Forbidden</td></tr> <tr><td>51</td><td>Vanity path conflicts with one or more already in use.</td><td>409</td><td>Conflict</td></tr> <tr><td>52</td><td>Vanity path is not permitted.</td><td>400</td><td>Bad Request</td></tr> <tr><td>53</td><td>Immutable field cannot be changed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>54</td><td>You cannot set this content to run as the current user</td><td>400</td><td>Bad Request</td></tr> <tr><td>55</td><td>Custom RunAs settings are prohibited for static content.</td><td>400</td><td>Bad Request</td></tr> <tr><td>56</td><td>The RunAs setting references a prohibited Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>57</td><td>The RunAs setting does not reference a valid Unix account.</td><td>400</td><td>Bad Request</td></tr> <tr><td>58</td><td>The RunAs setting references a Unix account that does not have the correct group membership.</td><td>400</td><td>Bad Request</td></tr> <tr><td>59</td><td>There is no rendering available.</td><td>400</td><td>Bad Request</td></tr> <tr><td>60</td><td>This email address is not allowed to login to this server.</td><td>400</td><td>Bad Request</td></tr> <tr><td>61</td><td>You cannot change the role of the only remaining administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>62</td><td>An API key name must not be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>63</td><td>There was a problem communicating with the LDAP authentication server. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>64</td><td>The number of users permitted by this license has been exceeded. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>65</td><td>API applications are not permitted by your license.</td><td>403</td><td>Forbidden</td></tr> <tr><td>66</td><td>You cannot assign ownership to another user.</td><td>400</td><td>Bad Request</td></tr> <tr><td>67</td><td>You must provide the source_key for an existing variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>68</td><td>You cannot promote a variant without a valid rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>69</td><td>The bundle ID of the source and target variants must match</td><td>400</td><td>Bad Request</td></tr> <tr><td>70</td><td>Target rendering is more recent than source rendering</td><td>400</td><td>Bad Request</td></tr> <tr><td>71</td><td>Only parameterized documents support promoting output</td><td>400</td><td>Bad Request</td></tr> <tr><td>72</td><td>Not allowed to create schedule with different application association than its variant</td><td>400</td><td>Bad Request</td></tr> <tr><td>73</td><td>You may not schedule ad-hoc variants</td><td>400</td><td>Bad Request</td></tr> <tr><td>74</td><td>The requested report name is not permitted</td><td>400</td><td>Bad Request</td></tr> <tr><td>75</td><td>You may not delete the active bundle for an application</td><td>400</td><td>Bad Request</td></tr> <tr><td>76</td><td>A user using the same Unique ID already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>77</td><td>A tag name cannot be more than 255 characters</td><td>400</td><td>Bad Request</td></tr> <tr><td>78</td><td>A tag must have a name</td><td>400</td><td>Bad Request</td></tr> <tr><td>79</td><td>Cannot assign a category to an app</td><td>400</td><td>Bad Request</td></tr> <tr><td>80</td><td>The target object does not match the provided version.</td><td>409</td><td>Conflict</td></tr> <tr><td>81</td><td>Duplicate names are not permitted; a sibling tag or category already has this name</td><td>400</td><td>Bad Request</td></tr> <tr><td>82</td><td>The bundle for deployment must belong to the target application.</td><td>400</td><td>Bad Request</td></tr> <tr><td>83</td><td>Too many search results. Be more specific.</td><td>400</td><td>Bad Request</td></tr> <tr><td>84</td><td>The token has already been claimed. Tokens can only be claimed once.</td><td>403</td><td>Forbidden</td></tr> <tr><td>85</td><td>A token using the same token key already exists</td><td>400</td><td>Bad Request</td></tr> <tr><td>86</td><td>A new token MUST contain a public_key and token in the json body.</td><td>400</td><td>Bad Request</td></tr> <tr><td>87</td><td>The request body cannot be parsed</td><td>400</td><td>Bad Request</td></tr> <tr><td>88</td><td>Cannot apply the requested change because it would make the target object an ancestor of itself.</td><td>400</td><td>Bad Request</td></tr> <tr><td>89</td><td>Unable to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>90</td><td>User self-registration is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>91</td><td>The external authentication provider did not provide a valid username.</td><td>400</td><td>Bad Request</td></tr> <tr><td>92</td><td>XSRF token mismatch</td><td>403</td><td>Forbidden</td></tr> <tr><td>93</td><td>Private variants cannot be configured to email users other than the owner</td><td>403</td><td>Forbidden</td></tr> <tr><td>94</td><td>You can only request a permissions upgrade once per 24-hour period.</td><td>400</td><td>Bad Request</td></tr> <tr><td>95</td><td>This API does not allow the current authentication type.</td><td>403</td><td>Forbidden</td></tr> <tr><td>96</td><td>Incorrect current password.</td><td>403</td><td>Forbidden</td></tr> <tr><td>97</td><td>Changing host or scheme in redirect is forbidden.</td><td>403</td><td>Forbidden</td></tr> <tr><td>98</td><td>We couldn&#39;t log you in with the provided credentials. Please ask your administrator for assistance.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>99</td><td>Please re-supply your credentials.</td><td>401</td><td>Unauthorized</td></tr> <tr><td>100</td><td>Unable to remove item. It is being processed.</td><td>400</td><td>Bad Request</td></tr> <tr><td>101</td><td>The provided password change token is invalid.</td><td>403</td><td>Forbidden</td></tr> <tr><td>102</td><td>A schedule for this variant already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>103</td><td>This system has not been configured to send email. Please contact your administrator.</td><td>400</td><td>Bad Request</td></tr> <tr><td>104</td><td>The content checksum header and body MD5 sum are not equal.</td><td>400</td><td>Bad Request</td></tr> <tr><td>105</td><td>TensorFlow Model APIs are not supported.</td><td>502</td><td>Bad Gateway</td></tr> <tr><td>106</td><td>Unable to update environment variables because they were changed while you were editing them.</td><td>409</td><td>Conflict</td></tr> <tr><td>107</td><td>That username is not allowed because it is prohibited by policy.</td><td>400</td><td>Bad Request</td></tr> <tr><td>108</td><td>Environment changes contain a prohibited variable</td><td>409</td><td>Conflict</td></tr> <tr><td>109</td><td>This type of content is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>110</td><td>You cannot change the categorization of content once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>111</td><td>You cannot change if an app is parameterized once deployed. Try deploying this as a new application instead of updating an existing one.</td><td>403</td><td>Forbidden</td></tr> <tr><td>112</td><td>The provided user role is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>113</td><td>Invalid MaxProcesses setting. The MaxProcesses setting may not exceed the Scheduler.MaxProcessesLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>114</td><td>Invalid MinProcesses setting. The MinProcesses setting may not exceed the MaxProcesses setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>115</td><td>The provided status is not recognized.</td><td>400</td><td>Bad Request</td></tr> <tr><td>116</td><td>The requested rendering does not match the variant.</td><td>400</td><td>Bad Request</td></tr> <tr><td>117</td><td>Unknown access type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>118</td><td>This access type is not allowed because it is prohibited by policy.</td><td>403</td><td>Forbidden</td></tr> <tr><td>119</td><td>The authentication provider does not support creating records from a retrieved ticket. POST new content instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>120</td><td>The authentication provider does not support creating records from POST content. PUT a retrieved ticket instead.</td><td>400</td><td>Bad Request</td></tr> <tr><td>121</td><td>The request JSON is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>122</td><td>Application title must be between 3 and 1024 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>123</td><td>Application description must be 4096 characters or less.</td><td>400</td><td>Bad Request</td></tr> <tr><td>124</td><td>No administrator has a configured email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>125</td><td>Content-Length cannot be 0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>126</td><td>Request Content-Length did not match the number of bytes received.</td><td>400</td><td>Bad Request</td></tr> <tr><td>127</td><td>The temp_ticket is invalid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>128</td><td>The email address cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>129</td><td>The user unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>130</td><td>The group unique ID cannot be blank.</td><td>400</td><td>Bad Request</td></tr> <tr><td>131</td><td>A group using the same unique ID already exists.</td><td>400</td><td>Bad Request</td></tr> <tr><td>132</td><td>The configured provider cannot access this endpoint.</td><td>400</td><td>Bad Request</td></tr> <tr><td>133</td><td>The source variant belongs to a different app.</td><td>400</td><td>Bad Request</td></tr> <tr><td>134</td><td>Unable to write bundle to disk.</td><td>400</td><td>Bad Request</td></tr> <tr><td>135</td><td>Unable to extract the bundle.</td><td>400</td><td>Bad Request</td></tr> <tr><td>136</td><td>Time values must be in RFC3339 format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>137</td><td>The start of the time interval cannot be in the past, or more than 5 years in the future.</td><td>400</td><td>Bad Request</td></tr> <tr><td>138</td><td>The end of the time interval cannot be earlier than the start time.</td><td>400</td><td>Bad Request</td></tr> <tr><td>139</td><td>The length of the time interval cannot be more than 1 year.</td><td>400</td><td>Bad Request</td></tr> <tr><td>140</td><td>The time interval must have both start and end times.</td><td>400</td><td>Bad Request</td></tr> <tr><td>141</td><td>Task lookup failures can indicate that a load balancer is not using sticky sessions or a client is not including the session cookie. Details: https://docs.posit.co/connect/admin/load-balancing/</td><td>404</td><td>Not Found</td></tr> <tr><td>142</td><td>The app is already managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>143</td><td>The app is not managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>144</td><td>Uploading a content bundle is not allowed for this application since it is managed by git.</td><td>409</td><td>Conflict</td></tr> <tr><td>145</td><td>Git support is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>146</td><td>Git URLs must be absolute and cannot have username, query, or fragment.</td><td>400</td><td>Bad Request</td></tr> <tr><td>147</td><td>The specified app mode is not executable.</td><td>400</td><td>Bad Request</td></tr> <tr><td>148</td><td>The specified app mode is not valid.</td><td>400</td><td>Bad Request</td></tr> <tr><td>149</td><td>Environment changes contain a duplicated variable name.</td><td>409</td><td>Conflict</td></tr> <tr><td>150</td><td>The load factor must be between 0.0 and 1.0.</td><td>400</td><td>Bad Request</td></tr> <tr><td>151</td><td>The timeout must be between 0 and 2592000 seconds.</td><td>400</td><td>Bad Request</td></tr> <tr><td>152</td><td>The principal type must be &#39;user&#39; or &#39;group&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>153</td><td>The requested group could not be found.</td><td>404</td><td>Not Found</td></tr> <tr><td>154</td><td>The requested user is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>155</td><td>The requested group is already in the content permission list.</td><td>409</td><td>Conflict</td></tr> <tr><td>156</td><td>This user cannot be assigned as the owner because they don&#39;t have permission to publish content.</td><td>403</td><td>Forbidden</td></tr> <tr><td>157</td><td>The requested parent tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>158</td><td>The requested tag does not exist</td><td>400</td><td>Bad Request</td></tr> <tr><td>159</td><td>The permission request submitted already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>160</td><td>The email notification for a permission request cannot be delivered due to missing or invalid email address.</td><td>400</td><td>Bad Request</td></tr> <tr><td>161</td><td>The include option specified is not valid</td><td>400</td><td>Bad Request</td></tr> <tr><td>162</td><td>The specified hostname is not an active Connect host</td><td>400</td><td>Bad Request</td></tr> <tr><td>163</td><td>The specified job cannot be terminated because it is not active</td><td>409</td><td>Conflict</td></tr> <tr><td>164</td><td>Git URLs must use HTTP or HTTPS.</td><td>400</td><td>Bad Request</td></tr> <tr><td>165</td><td>Cannot create bootstrapping user due to existing users</td><td>403</td><td>Forbidden</td></tr> <tr><td>166</td><td>The provided JWT is invalid</td><td>401</td><td>Unauthorized</td></tr> <tr><td>167</td><td>The controls file coundn&#39;t be read.</td><td>500</td><td>Internal Server Error</td></tr> <tr><td>168</td><td>The title must be between 1 and 64 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>169</td><td>The description cannot be more than 4096 characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>170</td><td>The cluster_name must be &#39;Kubernetes&#39;.</td><td>400</td><td>Bad Request</td></tr> <tr><td>171</td><td>A unique name for the environment must be provided.</td><td>400</td><td>Bad Request</td></tr> <tr><td>172</td><td>Unknown matching type.</td><td>400</td><td>Bad Request</td></tr> <tr><td>173</td><td>The installation path must be an absolute Unix filepath.</td><td>400</td><td>Bad Request</td></tr> <tr><td>174</td><td>The installation version must use semantic version format.</td><td>400</td><td>Bad Request</td></tr> <tr><td>175</td><td>An environment with that name already exists.</td><td>409</td><td>Conflict</td></tr> <tr><td>176</td><td>The specified service account name is not a valid DNS subdomain.</td><td>400</td><td>Bad Request</td></tr> <tr><td>177</td><td>The supervisor path may not contain any of the following whitespace control characters: \\t\\n\\b\\f\\n</td><td>400</td><td>Bad Request</td></tr> <tr><td>178</td><td>The specified service account name is not recognized by launcher in the Kubernetes namespace.</td><td>400</td><td>Bad Request</td></tr> <tr><td>179</td><td>Unsupported runtime language identifier</td><td>400</td><td>Bad Request</td></tr> <tr><td>180</td><td>The request did not identify a cache location</td><td>400</td><td>Bad Request</td></tr> <tr><td>181</td><td>Invalid MemoryRequest setting. The MemoryRequest setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>182</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the Scheduler.MaxMemoryRequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>183</td><td>Invalid MemoryLimit setting. The MemoryLimit setting cannot be less than 0 or greater than 9007198180999168.</td><td>400</td><td>Bad Request</td></tr> <tr><td>184</td><td>Invalid MemoryLimit setting. The MemoryLimit setting may not exceed the Scheduler.MaxMemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>185</td><td>Invalid MemoryRequest setting. The MemoryRequest setting may not exceed the MemoryLimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>186</td><td>Invalid CPURequest setting. The CPURequest setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>187</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the Scheduler.MaxCPURequest setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>188</td><td>Invalid CPULimit setting. The CPULimit setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>189</td><td>Invalid CPULimit setting. The CPULimit setting may not exceed the Scheduler.MaxCPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>190</td><td>Invalid CPURequest setting. The CPURequest setting may not exceed the CPULimit setting.</td><td>400</td><td>Bad Request</td></tr> <tr><td>191</td><td>Invalid MinProcesses setting. The MinProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>192</td><td>Invalid MaxProcesses setting. The MaxProcesses setting must be a positive number.</td><td>400</td><td>Bad Request</td></tr> <tr><td>193</td><td>When provided, the default_image_name cannot be empty and may not contain any whitespace characters.</td><td>400</td><td>Bad Request</td></tr> <tr><td>194</td><td>Runtime cache management is disabled.</td><td>400</td><td>Bad Request</td></tr> <tr><td>195</td><td>Invalid configuration. Service accounts cannot be set on content. Please contact an administrator to update Connect&#39;s server configuration to enable this feature.</td><td>400</td><td>Bad Request</td></tr> </tbody> </table>   # noqa: E501

    OpenAPI spec version: 2023.09.0
    Contact: support@posit.co
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""

import pprint
import re  # noqa: F401

import six

class Content(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """
    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'guid': 'str',
        'name': 'str',
        'title': 'str',
        'description': 'str',
        'access_type': 'str',
        'connection_timeout': 'int',
        'read_timeout': 'int',
        'init_timeout': 'int',
        'idle_timeout': 'int',
        'max_processes': 'int',
        'min_processes': 'int',
        'max_conns_per_process': 'int',
        'load_factor': 'float',
        'cpu_request': 'float',
        'cpu_limit': 'float',
        'memory_request': 'int',
        'memory_limit': 'int',
        'created_time': 'datetime',
        'last_deployed_time': 'datetime',
        'bundle_id': 'str',
        'app_mode': 'str',
        'content_category': 'str',
        'parameterized': 'bool',
        'cluster_name': 'str',
        'image_name': 'str',
        'default_image_name': 'str',
        'default_r_environment_management': 'bool',
        'default_py_environment_management': 'bool',
        'service_account_name': 'str',
        'r_version': 'str',
        'r_environment_management': 'bool',
        'py_version': 'str',
        'py_environment_management': 'bool',
        'quarto_version': 'str',
        'run_as': 'str',
        'run_as_current_user': 'bool',
        'owner_guid': 'str',
        'content_url': 'str',
        'dashboard_url': 'str',
        'role': 'str',
        'id': 'str'
    }

    attribute_map = {
        'guid': 'guid',
        'name': 'name',
        'title': 'title',
        'description': 'description',
        'access_type': 'access_type',
        'connection_timeout': 'connection_timeout',
        'read_timeout': 'read_timeout',
        'init_timeout': 'init_timeout',
        'idle_timeout': 'idle_timeout',
        'max_processes': 'max_processes',
        'min_processes': 'min_processes',
        'max_conns_per_process': 'max_conns_per_process',
        'load_factor': 'load_factor',
        'cpu_request': 'cpu_request',
        'cpu_limit': 'cpu_limit',
        'memory_request': 'memory_request',
        'memory_limit': 'memory_limit',
        'created_time': 'created_time',
        'last_deployed_time': 'last_deployed_time',
        'bundle_id': 'bundle_id',
        'app_mode': 'app_mode',
        'content_category': 'content_category',
        'parameterized': 'parameterized',
        'cluster_name': 'cluster_name',
        'image_name': 'image_name',
        'default_image_name': 'default_image_name',
        'default_r_environment_management': 'default_r_environment_management',
        'default_py_environment_management': 'default_py_environment_management',
        'service_account_name': 'service_account_name',
        'r_version': 'r_version',
        'r_environment_management': 'r_environment_management',
        'py_version': 'py_version',
        'py_environment_management': 'py_environment_management',
        'quarto_version': 'quarto_version',
        'run_as': 'run_as',
        'run_as_current_user': 'run_as_current_user',
        'owner_guid': 'owner_guid',
        'content_url': 'content_url',
        'dashboard_url': 'dashboard_url',
        'role': 'role',
        'id': 'id'
    }

    def __init__(self, guid=None, name='', title='null', description='', access_type='acl', connection_timeout=None, read_timeout=None, init_timeout=None, idle_timeout=None, max_processes=None, min_processes=None, max_conns_per_process=None, load_factor=None, cpu_request=None, cpu_limit=None, memory_request=None, memory_limit=None, created_time=None, last_deployed_time=None, bundle_id=None, app_mode=None, content_category=None, parameterized=None, cluster_name=None, image_name=None, default_image_name='null', default_r_environment_management=False, default_py_environment_management=False, service_account_name='null', r_version=None, r_environment_management=None, py_version=None, py_environment_management=None, quarto_version=None, run_as='null', run_as_current_user=False, owner_guid=None, content_url=None, dashboard_url=None, role=None, id=None):  # noqa: E501
        """Content - a model defined in Swagger"""  # noqa: E501
        self._guid = None
        self._name = None
        self._title = None
        self._description = None
        self._access_type = None
        self._connection_timeout = None
        self._read_timeout = None
        self._init_timeout = None
        self._idle_timeout = None
        self._max_processes = None
        self._min_processes = None
        self._max_conns_per_process = None
        self._load_factor = None
        self._cpu_request = None
        self._cpu_limit = None
        self._memory_request = None
        self._memory_limit = None
        self._created_time = None
        self._last_deployed_time = None
        self._bundle_id = None
        self._app_mode = None
        self._content_category = None
        self._parameterized = None
        self._cluster_name = None
        self._image_name = None
        self._default_image_name = None
        self._default_r_environment_management = None
        self._default_py_environment_management = None
        self._service_account_name = None
        self._r_version = None
        self._r_environment_management = None
        self._py_version = None
        self._py_environment_management = None
        self._quarto_version = None
        self._run_as = None
        self._run_as_current_user = None
        self._owner_guid = None
        self._content_url = None
        self._dashboard_url = None
        self._role = None
        self._id = None
        self.discriminator = None
        if guid is not None:
            self.guid = guid
        if name is not None:
            self.name = name
        if title is not None:
            self.title = title
        if description is not None:
            self.description = description
        if access_type is not None:
            self.access_type = access_type
        if connection_timeout is not None:
            self.connection_timeout = connection_timeout
        if read_timeout is not None:
            self.read_timeout = read_timeout
        if init_timeout is not None:
            self.init_timeout = init_timeout
        if idle_timeout is not None:
            self.idle_timeout = idle_timeout
        if max_processes is not None:
            self.max_processes = max_processes
        if min_processes is not None:
            self.min_processes = min_processes
        if max_conns_per_process is not None:
            self.max_conns_per_process = max_conns_per_process
        if load_factor is not None:
            self.load_factor = load_factor
        if cpu_request is not None:
            self.cpu_request = cpu_request
        if cpu_limit is not None:
            self.cpu_limit = cpu_limit
        if memory_request is not None:
            self.memory_request = memory_request
        if memory_limit is not None:
            self.memory_limit = memory_limit
        if created_time is not None:
            self.created_time = created_time
        if last_deployed_time is not None:
            self.last_deployed_time = last_deployed_time
        if bundle_id is not None:
            self.bundle_id = bundle_id
        if app_mode is not None:
            self.app_mode = app_mode
        if content_category is not None:
            self.content_category = content_category
        if parameterized is not None:
            self.parameterized = parameterized
        if cluster_name is not None:
            self.cluster_name = cluster_name
        if image_name is not None:
            self.image_name = image_name
        if default_image_name is not None:
            self.default_image_name = default_image_name
        if default_r_environment_management is not None:
            self.default_r_environment_management = default_r_environment_management
        if default_py_environment_management is not None:
            self.default_py_environment_management = default_py_environment_management
        if service_account_name is not None:
            self.service_account_name = service_account_name
        if r_version is not None:
            self.r_version = r_version
        if r_environment_management is not None:
            self.r_environment_management = r_environment_management
        if py_version is not None:
            self.py_version = py_version
        if py_environment_management is not None:
            self.py_environment_management = py_environment_management
        if quarto_version is not None:
            self.quarto_version = quarto_version
        if run_as is not None:
            self.run_as = run_as
        if run_as_current_user is not None:
            self.run_as_current_user = run_as_current_user
        if owner_guid is not None:
            self.owner_guid = owner_guid
        if content_url is not None:
            self.content_url = content_url
        if dashboard_url is not None:
            self.dashboard_url = dashboard_url
        if role is not None:
            self.role = role
        if id is not None:
            self.id = id

    @property
    def guid(self):
        """Gets the guid of this Content.  # noqa: E501

        The unique identifier of this content item.  # noqa: E501

        :return: The guid of this Content.  # noqa: E501
        :rtype: str
        """
        return self._guid

    @guid.setter
    def guid(self, guid):
        """Sets the guid of this Content.

        The unique identifier of this content item.  # noqa: E501

        :param guid: The guid of this Content.  # noqa: E501
        :type: str
        """

        self._guid = guid

    @property
    def name(self):
        """Gets the name of this Content.  # noqa: E501

        A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`).  # noqa: E501

        :return: The name of this Content.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this Content.

        A simple, URL-friendly identifier. Allows alpha-numeric characters, hyphens (`\"-\"`), and underscores (`\"_\"`).  # noqa: E501

        :param name: The name of this Content.  # noqa: E501
        :type: str
        """

        self._name = name

    @property
    def title(self):
        """Gets the title of this Content.  # noqa: E501

        The title of this content.  # noqa: E501

        :return: The title of this Content.  # noqa: E501
        :rtype: str
        """
        return self._title

    @title.setter
    def title(self, title):
        """Sets the title of this Content.

        The title of this content.  # noqa: E501

        :param title: The title of this Content.  # noqa: E501
        :type: str
        """

        self._title = title

    @property
    def description(self):
        """Gets the description of this Content.  # noqa: E501

        A rich description of this content.  # noqa: E501

        :return: The description of this Content.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this Content.

        A rich description of this content.  # noqa: E501

        :param description: The description of this Content.  # noqa: E501
        :type: str
        """

        self._description = description

    @property
    def access_type(self):
        """Gets the access_type of this Content.  # noqa: E501

        Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content.  # noqa: E501

        :return: The access_type of this Content.  # noqa: E501
        :rtype: str
        """
        return self._access_type

    @access_type.setter
    def access_type(self, access_type):
        """Sets the access_type of this Content.

        Access type describes how this content manages its viewers. The value `all` is the most permissive; any visitor to Posit Connect will be able to view this content. The value `logged_in` indicates that all Posit Connect accounts may view the content. The `acl` value lets specifically enumerated users and groups view the content. Users configured as collaborators may always view content.  # noqa: E501

        :param access_type: The access_type of this Content.  # noqa: E501
        :type: str
        """
        allowed_values = ["all", "logged_in", "acl"]  # noqa: E501
        if access_type not in allowed_values:
            raise ValueError(
                "Invalid value for `access_type` ({0}), must be one of {1}"  # noqa: E501
                .format(access_type, allowed_values)
            )

        self._access_type = access_type

    @property
    def connection_timeout(self):
        """Gets the connection_timeout of this Content.  # noqa: E501

        Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The connection_timeout of this Content.  # noqa: E501
        :rtype: int
        """
        return self._connection_timeout

    @connection_timeout.setter
    def connection_timeout(self, connection_timeout):
        """Sets the connection_timeout of this Content.

        Maximum number of seconds allowed without data sent or received across a client connection. A value of `0` means connections will never time-out (not recommended). When `null`, the default `Scheduler.ConnectionTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param connection_timeout: The connection_timeout of this Content.  # noqa: E501
        :type: int
        """

        self._connection_timeout = connection_timeout

    @property
    def read_timeout(self):
        """Gets the read_timeout of this Content.  # noqa: E501

        Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The read_timeout of this Content.  # noqa: E501
        :rtype: int
        """
        return self._read_timeout

    @read_timeout.setter
    def read_timeout(self, read_timeout):
        """Sets the read_timeout of this Content.

        Maximum number of seconds allowed without data received from a client connection. A value of `0` means a lack of client (browser) interaction never causes the connection to close. When `null`, the default `Scheduler.ReadTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param read_timeout: The read_timeout of this Content.  # noqa: E501
        :type: int
        """

        self._read_timeout = read_timeout

    @property
    def init_timeout(self):
        """Gets the init_timeout of this Content.  # noqa: E501

        The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The init_timeout of this Content.  # noqa: E501
        :rtype: int
        """
        return self._init_timeout

    @init_timeout.setter
    def init_timeout(self, init_timeout):
        """Sets the init_timeout of this Content.

        The maximum number of seconds allowed for an interactive application to start. Posit Connect must be able to connect to a newly launched application before this threshold has elapsed. When `null`, the default `Scheduler.InitTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param init_timeout: The init_timeout of this Content.  # noqa: E501
        :type: int
        """

        self._init_timeout = init_timeout

    @property
    def idle_timeout(self):
        """Gets the idle_timeout of this Content.  # noqa: E501

        The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The idle_timeout of this Content.  # noqa: E501
        :rtype: int
        """
        return self._idle_timeout

    @idle_timeout.setter
    def idle_timeout(self, idle_timeout):
        """Sets the idle_timeout of this Content.

        The maximum number of seconds a worker process for an interactive application to remain alive after it goes idle (no active connections). When `null`, the default `Scheduler.IdleTimeout` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param idle_timeout: The idle_timeout of this Content.  # noqa: E501
        :type: int
        """

        self._idle_timeout = idle_timeout

    @property
    def max_processes(self):
        """Gets the max_processes of this Content.  # noqa: E501

        Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The max_processes of this Content.  # noqa: E501
        :rtype: int
        """
        return self._max_processes

    @max_processes.setter
    def max_processes(self, max_processes):
        """Sets the max_processes of this Content.

        Specifies the total number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MaxProcesses` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param max_processes: The max_processes of this Content.  # noqa: E501
        :type: int
        """

        self._max_processes = max_processes

    @property
    def min_processes(self):
        """Gets the min_processes of this Content.  # noqa: E501

        Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The min_processes of this Content.  # noqa: E501
        :rtype: int
        """
        return self._min_processes

    @min_processes.setter
    def min_processes(self, min_processes):
        """Sets the min_processes of this Content.

        Specifies the minimum number of concurrent processes allowed for a single interactive application. When `null`, the default `Scheduler.MinProcesses` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param min_processes: The min_processes of this Content.  # noqa: E501
        :type: int
        """

        self._min_processes = min_processes

    @property
    def max_conns_per_process(self):
        """Gets the max_conns_per_process of this Content.  # noqa: E501

        Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The max_conns_per_process of this Content.  # noqa: E501
        :rtype: int
        """
        return self._max_conns_per_process

    @max_conns_per_process.setter
    def max_conns_per_process(self, max_conns_per_process):
        """Sets the max_conns_per_process of this Content.

        Specifies the maximum number of client connections allowed to an individual process. Incoming connections which will exceed this limit are routed to a new process or rejected. When `null`, the default `Scheduler.MaxConnsPerProcess` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param max_conns_per_process: The max_conns_per_process of this Content.  # noqa: E501
        :type: int
        """

        self._max_conns_per_process = max_conns_per_process

    @property
    def load_factor(self):
        """Gets the load_factor of this Content.  # noqa: E501

        Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :return: The load_factor of this Content.  # noqa: E501
        :rtype: float
        """
        return self._load_factor

    @load_factor.setter
    def load_factor(self, load_factor):
        """Sets the load_factor of this Content.

        Controls how aggressively new processes are spawned. When `null`, the default `Scheduler.LoadFactor` is used. Applies only to content types that are executed on demand.  # noqa: E501

        :param load_factor: The load_factor of this Content.  # noqa: E501
        :type: float
        """

        self._load_factor = load_factor

    @property
    def cpu_request(self):
        """Gets the cpu_request of this Content.  # noqa: E501

        The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used.  # noqa: E501

        :return: The cpu_request of this Content.  # noqa: E501
        :rtype: float
        """
        return self._cpu_request

    @cpu_request.setter
    def cpu_request(self, cpu_request):
        """Sets the cpu_request of this Content.

        The minimum amount of compute power this content needs when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.CPURequest` is used.  # noqa: E501

        :param cpu_request: The cpu_request of this Content.  # noqa: E501
        :type: float
        """

        self._cpu_request = cpu_request

    @property
    def cpu_limit(self):
        """Gets the cpu_limit of this Content.  # noqa: E501

        The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used.  # noqa: E501

        :return: The cpu_limit of this Content.  # noqa: E501
        :rtype: float
        """
        return self._cpu_limit

    @cpu_limit.setter
    def cpu_limit(self, cpu_limit):
        """Sets the cpu_limit of this Content.

        The maximum amount of compute power this content will be allowed to consume when executing or rendering, expressed in [\"CPU Units\"](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu), where 1.0 unit is equivalent to 1 physical or virtual core. Fractional values are allowed. This is used when running in an off-host execution configuration. If the process tries to use more CPU than allowed, it will be throttled. When `null`, the default `Scheduler.CPULimit` is used.  # noqa: E501

        :param cpu_limit: The cpu_limit of this Content.  # noqa: E501
        :type: float
        """

        self._cpu_limit = cpu_limit

    @property
    def memory_request(self):
        """Gets the memory_request of this Content.  # noqa: E501

        The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used.  # noqa: E501

        :return: The memory_request of this Content.  # noqa: E501
        :rtype: int
        """
        return self._memory_request

    @memory_request.setter
    def memory_request(self, memory_request):
        """Sets the memory_request of this Content.

        The minimum amount of RAM this content needs when executing or rendering, expressed in bytes. This is used when running in an off-host execution configuration to determine where the content should be run. When `null`, the default `Scheduler.MemoryRequest` is used.  # noqa: E501

        :param memory_request: The memory_request of this Content.  # noqa: E501
        :type: int
        """

        self._memory_request = memory_request

    @property
    def memory_limit(self):
        """Gets the memory_limit of this Content.  # noqa: E501

        The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used.  # noqa: E501

        :return: The memory_limit of this Content.  # noqa: E501
        :rtype: int
        """
        return self._memory_limit

    @memory_limit.setter
    def memory_limit(self, memory_limit):
        """Sets the memory_limit of this Content.

        The maximum amount of RAM this content will be allowed to consume when executing or rendering, expressed in bytes. If the process tries to use more memory than allowed, it will be terminated. When `null`, the default `Scheduler.MemoryLimit` is used.  # noqa: E501

        :param memory_limit: The memory_limit of this Content.  # noqa: E501
        :type: int
        """

        self._memory_limit = memory_limit

    @property
    def created_time(self):
        """Gets the created_time of this Content.  # noqa: E501

        The timestamp (RFC3339) indicating when this content was created.  # noqa: E501

        :return: The created_time of this Content.  # noqa: E501
        :rtype: datetime
        """
        return self._created_time

    @created_time.setter
    def created_time(self, created_time):
        """Sets the created_time of this Content.

        The timestamp (RFC3339) indicating when this content was created.  # noqa: E501

        :param created_time: The created_time of this Content.  # noqa: E501
        :type: datetime
        """

        self._created_time = created_time

    @property
    def last_deployed_time(self):
        """Gets the last_deployed_time of this Content.  # noqa: E501

        The timestamp (RFC3339) indicating when this content last had a successful bundle deployment performed.  # noqa: E501

        :return: The last_deployed_time of this Content.  # noqa: E501
        :rtype: datetime
        """
        return self._last_deployed_time

    @last_deployed_time.setter
    def last_deployed_time(self, last_deployed_time):
        """Sets the last_deployed_time of this Content.

        The timestamp (RFC3339) indicating when this content last had a successful bundle deployment performed.  # noqa: E501

        :param last_deployed_time: The last_deployed_time of this Content.  # noqa: E501
        :type: datetime
        """

        self._last_deployed_time = last_deployed_time

    @property
    def bundle_id(self):
        """Gets the bundle_id of this Content.  # noqa: E501

        The identifier for the active deployment bundle. Automatically assigned upon the successful deployment of that bundle.  # noqa: E501

        :return: The bundle_id of this Content.  # noqa: E501
        :rtype: str
        """
        return self._bundle_id

    @bundle_id.setter
    def bundle_id(self, bundle_id):
        """Sets the bundle_id of this Content.

        The identifier for the active deployment bundle. Automatically assigned upon the successful deployment of that bundle.  # noqa: E501

        :param bundle_id: The bundle_id of this Content.  # noqa: E501
        :type: str
        """

        self._bundle_id = bundle_id

    @property
    def app_mode(self):
        """Gets the app_mode of this Content.  # noqa: E501

        The runtime model for this content. Has a value of `unknown` before data is deployed to this item. Automatically assigned upon the first successful bundle deployment.  Valid values are:  * `api` - R code defining a [Plumber API](https://www.rplumber.io/). * `jupyter-static` - A [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/). * `python-api` - Python code defining a WSGI API (such as [Flask](https://palletsprojects.com/p/flask/)) * `python-bokeh` - Python code defining a [Bokeh application](https://bokeh.org/). * `python-dash` - Python code defining a [Dash application](https://dash.plotly.com/). * `python-fastapi` - Python code defining an ASGI API (such as [FastAPI](https://fastapi.tiangolo.com/)) * `python-streamlit` - Python code defining a [Streamlit application](https://streamlit.io/). * `python-shiny` - Python code defining a [Shiny application](https://shiny.rstudio.com/py/). * `quarto-shiny` - A [Quarto](https://quarto.org/) document with a Shiny runtime. * `quarto-static` - A [Quarto](https://quarto.org/) document or site. * `rmd-shiny` - An [R Markdown](https://rmarkdown.rstudio.com/) document with a Shiny runtime. * `rmd-static` - An [R Markdown](https://rmarkdown.rstudio.com/) document or site. * `shiny` - R code defining a [Shiny application](https://shiny.rstudio.com/). * `static` - Content deployed without source; often HTML and plots. * `tensorflow-saved-model` - A TensorFlow Model API (obsolete). * `unknown` - No known runtime model.  # noqa: E501

        :return: The app_mode of this Content.  # noqa: E501
        :rtype: str
        """
        return self._app_mode

    @app_mode.setter
    def app_mode(self, app_mode):
        """Sets the app_mode of this Content.

        The runtime model for this content. Has a value of `unknown` before data is deployed to this item. Automatically assigned upon the first successful bundle deployment.  Valid values are:  * `api` - R code defining a [Plumber API](https://www.rplumber.io/). * `jupyter-static` - A [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/). * `python-api` - Python code defining a WSGI API (such as [Flask](https://palletsprojects.com/p/flask/)) * `python-bokeh` - Python code defining a [Bokeh application](https://bokeh.org/). * `python-dash` - Python code defining a [Dash application](https://dash.plotly.com/). * `python-fastapi` - Python code defining an ASGI API (such as [FastAPI](https://fastapi.tiangolo.com/)) * `python-streamlit` - Python code defining a [Streamlit application](https://streamlit.io/). * `python-shiny` - Python code defining a [Shiny application](https://shiny.rstudio.com/py/). * `quarto-shiny` - A [Quarto](https://quarto.org/) document with a Shiny runtime. * `quarto-static` - A [Quarto](https://quarto.org/) document or site. * `rmd-shiny` - An [R Markdown](https://rmarkdown.rstudio.com/) document with a Shiny runtime. * `rmd-static` - An [R Markdown](https://rmarkdown.rstudio.com/) document or site. * `shiny` - R code defining a [Shiny application](https://shiny.rstudio.com/). * `static` - Content deployed without source; often HTML and plots. * `tensorflow-saved-model` - A TensorFlow Model API (obsolete). * `unknown` - No known runtime model.  # noqa: E501

        :param app_mode: The app_mode of this Content.  # noqa: E501
        :type: str
        """
        allowed_values = ["api", "jupyter-static", "python-api", "python-bokeh", "python-dash", "python-streamlit", "quarto-shiny", "quarto-static", "rmd-shiny", "rmd-static", "shiny", "static", "tensorflow-saved-model", "unknown"]  # noqa: E501
        if app_mode not in allowed_values:
            raise ValueError(
                "Invalid value for `app_mode` ({0}), must be one of {1}"  # noqa: E501
                .format(app_mode, allowed_values)
            )

        self._app_mode = app_mode

    @property
    def content_category(self):
        """Gets the content_category of this Content.  # noqa: E501

        Describes the specialization of the content runtime model. Automatically assigned upon the first successful bundle deployment.  The `content_category` field refines the type of content specified by `app_mode`. It is empty by default. The rsconnect R package may assign a value when analyzing your content and building its manifest and bundle. Plots (images created in the RStudio IDE and presented in the \"Plots\" pane) have an `app_mode` of `static` and receive a `content_category` of `plot` to distinguish them from other HTML documents. Pinned static data sets have an `app_mode` of `static` and a `content_category` of `pin`. Multi-document R Markdown sites have an `app_mode` of `rmd-static` and a `content_category` of `site`.  # noqa: E501

        :return: The content_category of this Content.  # noqa: E501
        :rtype: str
        """
        return self._content_category

    @content_category.setter
    def content_category(self, content_category):
        """Sets the content_category of this Content.

        Describes the specialization of the content runtime model. Automatically assigned upon the first successful bundle deployment.  The `content_category` field refines the type of content specified by `app_mode`. It is empty by default. The rsconnect R package may assign a value when analyzing your content and building its manifest and bundle. Plots (images created in the RStudio IDE and presented in the \"Plots\" pane) have an `app_mode` of `static` and receive a `content_category` of `plot` to distinguish them from other HTML documents. Pinned static data sets have an `app_mode` of `static` and a `content_category` of `pin`. Multi-document R Markdown sites have an `app_mode` of `rmd-static` and a `content_category` of `site`.  # noqa: E501

        :param content_category: The content_category of this Content.  # noqa: E501
        :type: str
        """

        self._content_category = content_category

    @property
    def parameterized(self):
        """Gets the parameterized of this Content.  # noqa: E501

        True when R Markdown rendered content allows parameter configuration. Automatically assigned upon the first successful bundle deployment. Applies only to content with an `app_mode` of `rmd-static`.  # noqa: E501

        :return: The parameterized of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._parameterized

    @parameterized.setter
    def parameterized(self, parameterized):
        """Sets the parameterized of this Content.

        True when R Markdown rendered content allows parameter configuration. Automatically assigned upon the first successful bundle deployment. Applies only to content with an `app_mode` of `rmd-static`.  # noqa: E501

        :param parameterized: The parameterized of this Content.  # noqa: E501
        :type: bool
        """

        self._parameterized = parameterized

    @property
    def cluster_name(self):
        """Gets the cluster_name of this Content.  # noqa: E501

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host. A `null` value is returned when the client does not have sufficient rights to see this information.  # noqa: E501

        :return: The cluster_name of this Content.  # noqa: E501
        :rtype: str
        """
        return self._cluster_name

    @cluster_name.setter
    def cluster_name(self, cluster_name):
        """Sets the cluster_name of this Content.

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". Gives the name of the cluster when run external to the Connect host. A `null` value is returned when the client does not have sufficient rights to see this information.  # noqa: E501

        :param cluster_name: The cluster_name of this Content.  # noqa: E501
        :type: str
        """

        self._cluster_name = cluster_name

    @property
    def image_name(self):
        """Gets the image_name of this Content.  # noqa: E501

        The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes. A `null` value is returned when the client does not have sufficient rights to see this information.  # noqa: E501

        :return: The image_name of this Content.  # noqa: E501
        :rtype: str
        """
        return self._image_name

    @image_name.setter
    def image_name(self, image_name):
        """Sets the image_name of this Content.

        The location where content this content runs. Content running on the same server as Connect will have either a `null` value or the string \"Local\". References the name of the target image when content runs in a clustered environment such as Kubernetes. A `null` value is returned when the client does not have sufficient rights to see this information.  # noqa: E501

        :param image_name: The image_name of this Content.  # noqa: E501
        :type: str
        """

        self._image_name = image_name

    @property
    def default_image_name(self):
        """Gets the default_image_name of this Content.  # noqa: E501

        The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  A `null` value is returned when the client does not have sufficient rights to see this information.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution.  # noqa: E501

        :return: The default_image_name of this Content.  # noqa: E501
        :rtype: str
        """
        return self._default_image_name

    @default_image_name.setter
    def default_image_name(self, default_image_name):
        """Sets the default_image_name of this Content.

        The default image that will be used when none is defined by the bundle's manifest. A specific image may be selected by setting the `environment.image` field in the manifest. If no image is selected by the manifest file, then the `default_image_name` is used. If a target image is not defined by the manifest, and no `default_image_name` is configured, then Connect will select an image from the list of configured execution environments.  A `null` value is returned when the client does not have sufficient rights to see this information.  Use the `/v1/environments` API endpoints to determine which environments are available for content execution.  # noqa: E501

        :param default_image_name: The default_image_name of this Content.  # noqa: E501
        :type: str
        """

        self._default_image_name = default_image_name

    @property
    def default_r_environment_management(self):
        """Gets the default_r_environment_management of this Content.  # noqa: E501

        Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.  # noqa: E501

        :return: The default_r_environment_management of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._default_r_environment_management

    @default_r_environment_management.setter
    def default_r_environment_management(self, default_r_environment_management):
        """Sets the default_r_environment_management of this Content.

        Indicates whether or not Connect should create and manage an R environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.  # noqa: E501

        :param default_r_environment_management: The default_r_environment_management of this Content.  # noqa: E501
        :type: bool
        """

        self._default_r_environment_management = default_r_environment_management

    @property
    def default_py_environment_management(self):
        """Gets the default_py_environment_management of this Content.  # noqa: E501

        Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.  # noqa: E501

        :return: The default_py_environment_management of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._default_py_environment_management

    @default_py_environment_management.setter
    def default_py_environment_management(self, default_py_environment_management):
        """Sets the default_py_environment_management of this Content.

        Indicates whether or not Connect should create and manage a Python environment (installing required packages) for this content. When `null`, Connect makes this determination based on the server configuration.  A `null` value is also returned when the client does not have sufficient rights to see this information.  This value is ignored if the server setting `Applications.DefaultEnvironmentManagementSelection` is disabled.  # noqa: E501

        :param default_py_environment_management: The default_py_environment_management of this Content.  # noqa: E501
        :type: bool
        """

        self._default_py_environment_management = default_py_environment_management

    @property
    def service_account_name(self):
        """Gets the service_account_name of this Content.  # noqa: E501

        The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value.  # noqa: E501

        :return: The service_account_name of this Content.  # noqa: E501
        :rtype: str
        """
        return self._service_account_name

    @service_account_name.setter
    def service_account_name(self, service_account_name):
        """Sets the service_account_name of this Content.

        The name of the Kubernetes service account that is used to run a particular piece of content.  It must adhere to valid Kubernetes service account naming rules.  Connect must be configured to run with `Launcher.Enabled = true`, `Launcher.Kubernetes = true` and `Launcher.KubernetesContentServiceAccountSelection = true`  for this value to be applied. It will have precedence over the `Launcher.KubernetesDefaultServiceAccount` that may be set in the configuration for Connect.  If this value is defined and Connect is configured with `Launcher.KubernetesContentServiceAccountSelection = false` an error will be returned.  Only administrators and publishers can view this value. Only administrators can set or change this value.  # noqa: E501

        :param service_account_name: The service_account_name of this Content.  # noqa: E501
        :type: str
        """

        self._service_account_name = service_account_name

    @property
    def r_version(self):
        """Gets the r_version of this Content.  # noqa: E501

        The of R interpreter associated with this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :return: The r_version of this Content.  # noqa: E501
        :rtype: str
        """
        return self._r_version

    @r_version.setter
    def r_version(self, r_version):
        """Sets the r_version of this Content.

        The of R interpreter associated with this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :param r_version: The r_version of this Content.  # noqa: E501
        :type: str
        """

        self._r_version = r_version

    @property
    def r_environment_management(self):
        """Gets the r_environment_management of this Content.  # noqa: E501

        Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :return: The r_environment_management of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._r_environment_management

    @r_environment_management.setter
    def r_environment_management(self, r_environment_management):
        """Sets the r_environment_management of this Content.

        Indicates whether or not Connect is managing an R environment and has installed the required packages for this content. A `null` value represents that R is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :param r_environment_management: The r_environment_management of this Content.  # noqa: E501
        :type: bool
        """

        self._r_environment_management = r_environment_management

    @property
    def py_version(self):
        """Gets the py_version of this Content.  # noqa: E501

        The version of Python associated with this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :return: The py_version of this Content.  # noqa: E501
        :rtype: str
        """
        return self._py_version

    @py_version.setter
    def py_version(self, py_version):
        """Sets the py_version of this Content.

        The version of Python associated with this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :param py_version: The py_version of this Content.  # noqa: E501
        :type: str
        """

        self._py_version = py_version

    @property
    def py_environment_management(self):
        """Gets the py_environment_management of this Content.  # noqa: E501

        Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :return: The py_environment_management of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._py_environment_management

    @py_environment_management.setter
    def py_environment_management(self, py_environment_management):
        """Sets the py_environment_management of this Content.

        Indicates whether or not Connect is managing a Python environment and has installed the required packages for this content. A `null` value represents that Python is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :param py_environment_management: The py_environment_management of this Content.  # noqa: E501
        :type: bool
        """

        self._py_environment_management = py_environment_management

    @property
    def quarto_version(self):
        """Gets the quarto_version of this Content.  # noqa: E501

        The version of Quarto associated with this content. A `null` represents that Quarto is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :return: The quarto_version of this Content.  # noqa: E501
        :rtype: str
        """
        return self._quarto_version

    @quarto_version.setter
    def quarto_version(self, quarto_version):
        """Sets the quarto_version of this Content.

        The version of Quarto associated with this content. A `null` represents that Quarto is not used by this content, that the content has not been prepared for execution, or that the client does not have sufficient rights to see this information. Automatically assigned upon the successful deployment of a bundle.  # noqa: E501

        :param quarto_version: The quarto_version of this Content.  # noqa: E501
        :type: str
        """

        self._quarto_version = quarto_version

    @property
    def run_as(self):
        """Gets the run_as of this Content.  # noqa: E501

        The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.  Only administrators can change this value.  # noqa: E501

        :return: The run_as of this Content.  # noqa: E501
        :rtype: str
        """
        return self._run_as

    @run_as.setter
    def run_as(self, run_as):
        """Sets the run_as of this Content.

        The UNIX user that executes this content. When `null`, the default `Applications.RunAs` is used. Applies only to executable content types - not `static`.  Only administrators can change this value.  # noqa: E501

        :param run_as: The run_as of this Content.  # noqa: E501
        :type: str
        """

        self._run_as = run_as

    @property
    def run_as_current_user(self):
        """Gets the run_as_current_user of this Content.  # noqa: E501

        Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value.  # noqa: E501

        :return: The run_as_current_user of this Content.  # noqa: E501
        :rtype: bool
        """
        return self._run_as_current_user

    @run_as_current_user.setter
    def run_as_current_user(self, run_as_current_user):
        """Sets the run_as_current_user of this Content.

        Indicates that Connect should run processes for this content item under the Unix account of the user who visits it. Content accessed anonymously will continue to run as the specified `run_as` user.  Connect must be configured to use PAM authentication with the server settings `Applications.RunAsCurrentUser = true` and `PAM.ForwardPassword = true`. This setting has no effect for other authentication types.  This setting only applies to application content types (Shiny, Dash, Streamlit, and Bokeh).  Only administrators can change this value.  # noqa: E501

        :param run_as_current_user: The run_as_current_user of this Content.  # noqa: E501
        :type: bool
        """

        self._run_as_current_user = run_as_current_user

    @property
    def owner_guid(self):
        """Gets the owner_guid of this Content.  # noqa: E501

        The unique identifier of the user who created this content item. Automatically assigned when the content is created.  # noqa: E501

        :return: The owner_guid of this Content.  # noqa: E501
        :rtype: str
        """
        return self._owner_guid

    @owner_guid.setter
    def owner_guid(self, owner_guid):
        """Sets the owner_guid of this Content.

        The unique identifier of the user who created this content item. Automatically assigned when the content is created.  # noqa: E501

        :param owner_guid: The owner_guid of this Content.  # noqa: E501
        :type: str
        """

        self._owner_guid = owner_guid

    @property
    def content_url(self):
        """Gets the content_url of this Content.  # noqa: E501

        The URL associated with this content. Computed from the associated vanity URL or GUID for this content.  # noqa: E501

        :return: The content_url of this Content.  # noqa: E501
        :rtype: str
        """
        return self._content_url

    @content_url.setter
    def content_url(self, content_url):
        """Sets the content_url of this Content.

        The URL associated with this content. Computed from the associated vanity URL or GUID for this content.  # noqa: E501

        :param content_url: The content_url of this Content.  # noqa: E501
        :type: str
        """

        self._content_url = content_url

    @property
    def dashboard_url(self):
        """Gets the dashboard_url of this Content.  # noqa: E501

        The URL within the Connect dashboard where this content can be configured. Computed from the GUID for this content.  # noqa: E501

        :return: The dashboard_url of this Content.  # noqa: E501
        :rtype: str
        """
        return self._dashboard_url

    @dashboard_url.setter
    def dashboard_url(self, dashboard_url):
        """Sets the dashboard_url of this Content.

        The URL within the Connect dashboard where this content can be configured. Computed from the GUID for this content.  # noqa: E501

        :param dashboard_url: The dashboard_url of this Content.  # noqa: E501
        :type: str
        """

        self._dashboard_url = dashboard_url

    @property
    def role(self):
        """Gets the role of this Content.  # noqa: E501

        The relationship of the accessing user to this content. A value of `owner` is returned for the content owner. `editor` indicates a collaborator. The `viewer` value is given to users who are permitted to view the content. A `none` role is returned for administrators who cannot view the content but are permitted to view its configuration. Computed at the time of the request.  # noqa: E501

        :return: The role of this Content.  # noqa: E501
        :rtype: str
        """
        return self._role

    @role.setter
    def role(self, role):
        """Sets the role of this Content.

        The relationship of the accessing user to this content. A value of `owner` is returned for the content owner. `editor` indicates a collaborator. The `viewer` value is given to users who are permitted to view the content. A `none` role is returned for administrators who cannot view the content but are permitted to view its configuration. Computed at the time of the request.  # noqa: E501

        :param role: The role of this Content.  # noqa: E501
        :type: str
        """
        allowed_values = ["owner", "editor", "viewer", "none"]  # noqa: E501
        if role not in allowed_values:
            raise ValueError(
                "Invalid value for `role` ({0}), must be one of {1}"  # noqa: E501
                .format(role, allowed_values)
            )

        self._role = role

    @property
    def id(self):
        """Gets the id of this Content.  # noqa: E501

        The internal numeric identifier of this content item.  # noqa: E501

        :return: The id of this Content.  # noqa: E501
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id):
        """Sets the id of this Content.

        The internal numeric identifier of this content item.  # noqa: E501

        :param id: The id of this Content.  # noqa: E501
        :type: str
        """

        self._id = id

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value
        if issubclass(Content, dict):
            for key, value in self.items():
                result[key] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, Content):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
