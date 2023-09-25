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

class JobItem(object):
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
        'id': 'str',
        'ppid': 'str',
        'pid': 'str',
        'key': 'str',
        'remote_id': 'str',
        'app_id': 'str',
        'variant_id': 'str',
        'bundle_id': 'str',
        'start_time': 'datetime',
        'end_time': 'datetime',
        'last_heartbeat_time': 'datetime',
        'queued_time': 'datetime',
        'queue_name': 'str',
        'tag': 'str',
        'exit_code': 'int',
        'status': 'int',
        'hostname': 'str',
        'cluster': 'str',
        'image': 'str',
        'run_as': 'str'
    }

    attribute_map = {
        'id': 'id',
        'ppid': 'ppid',
        'pid': 'pid',
        'key': 'key',
        'remote_id': 'remote_id',
        'app_id': 'app_id',
        'variant_id': 'variant_id',
        'bundle_id': 'bundle_id',
        'start_time': 'start_time',
        'end_time': 'end_time',
        'last_heartbeat_time': 'last_heartbeat_time',
        'queued_time': 'queued_time',
        'queue_name': 'queue_name',
        'tag': 'tag',
        'exit_code': 'exit_code',
        'status': 'status',
        'hostname': 'hostname',
        'cluster': 'cluster',
        'image': 'image',
        'run_as': 'run_as'
    }

    def __init__(self, id=None, ppid=None, pid=None, key=None, remote_id=None, app_id=None, variant_id=None, bundle_id=None, start_time=None, end_time=None, last_heartbeat_time=None, queued_time=None, queue_name=None, tag=None, exit_code=None, status=None, hostname=None, cluster=None, image=None, run_as=None):  # noqa: E501
        """JobItem - a model defined in Swagger"""  # noqa: E501
        self._id = None
        self._ppid = None
        self._pid = None
        self._key = None
        self._remote_id = None
        self._app_id = None
        self._variant_id = None
        self._bundle_id = None
        self._start_time = None
        self._end_time = None
        self._last_heartbeat_time = None
        self._queued_time = None
        self._queue_name = None
        self._tag = None
        self._exit_code = None
        self._status = None
        self._hostname = None
        self._cluster = None
        self._image = None
        self._run_as = None
        self.discriminator = None
        if id is not None:
            self.id = id
        if ppid is not None:
            self.ppid = ppid
        if pid is not None:
            self.pid = pid
        if key is not None:
            self.key = key
        if remote_id is not None:
            self.remote_id = remote_id
        if app_id is not None:
            self.app_id = app_id
        if variant_id is not None:
            self.variant_id = variant_id
        if bundle_id is not None:
            self.bundle_id = bundle_id
        if start_time is not None:
            self.start_time = start_time
        if end_time is not None:
            self.end_time = end_time
        if last_heartbeat_time is not None:
            self.last_heartbeat_time = last_heartbeat_time
        if queued_time is not None:
            self.queued_time = queued_time
        if queue_name is not None:
            self.queue_name = queue_name
        if tag is not None:
            self.tag = tag
        if exit_code is not None:
            self.exit_code = exit_code
        if status is not None:
            self.status = status
        if hostname is not None:
            self.hostname = hostname
        if cluster is not None:
            self.cluster = cluster
        if image is not None:
            self.image = image
        if run_as is not None:
            self.run_as = run_as

    @property
    def id(self):
        """Gets the id of this JobItem.  # noqa: E501

        The job identifier.  # noqa: E501

        :return: The id of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id):
        """Sets the id of this JobItem.

        The job identifier.  # noqa: E501

        :param id: The id of this JobItem.  # noqa: E501
        :type: str
        """

        self._id = id

    @property
    def ppid(self):
        """Gets the ppid of this JobItem.  # noqa: E501

        The job's parent process identifier.  # noqa: E501

        :return: The ppid of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._ppid

    @ppid.setter
    def ppid(self, ppid):
        """Sets the ppid of this JobItem.

        The job's parent process identifier.  # noqa: E501

        :param ppid: The ppid of this JobItem.  # noqa: E501
        :type: str
        """

        self._ppid = ppid

    @property
    def pid(self):
        """Gets the pid of this JobItem.  # noqa: E501

        The job's process identifier.  # noqa: E501

        :return: The pid of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._pid

    @pid.setter
    def pid(self, pid):
        """Sets the pid of this JobItem.

        The job's process identifier.  # noqa: E501

        :param pid: The pid of this JobItem.  # noqa: E501
        :type: str
        """

        self._pid = pid

    @property
    def key(self):
        """Gets the key of this JobItem.  # noqa: E501

        The job's unique key identifier.  # noqa: E501

        :return: The key of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._key

    @key.setter
    def key(self, key):
        """Sets the key of this JobItem.

        The job's unique key identifier.  # noqa: E501

        :param key: The key of this JobItem.  # noqa: E501
        :type: str
        """

        self._key = key

    @property
    def remote_id(self):
        """Gets the remote_id of this JobItem.  # noqa: E501

        The job's identifier for off-host execution configurations.  # noqa: E501

        :return: The remote_id of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._remote_id

    @remote_id.setter
    def remote_id(self, remote_id):
        """Sets the remote_id of this JobItem.

        The job's identifier for off-host execution configurations.  # noqa: E501

        :param remote_id: The remote_id of this JobItem.  # noqa: E501
        :type: str
        """

        self._remote_id = remote_id

    @property
    def app_id(self):
        """Gets the app_id of this JobItem.  # noqa: E501

        The job's parent content identifier  # noqa: E501

        :return: The app_id of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._app_id

    @app_id.setter
    def app_id(self, app_id):
        """Sets the app_id of this JobItem.

        The job's parent content identifier  # noqa: E501

        :param app_id: The app_id of this JobItem.  # noqa: E501
        :type: str
        """

        self._app_id = app_id

    @property
    def variant_id(self):
        """Gets the variant_id of this JobItem.  # noqa: E501

        The identifier of the variant owning this job.  # noqa: E501

        :return: The variant_id of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._variant_id

    @variant_id.setter
    def variant_id(self, variant_id):
        """Sets the variant_id of this JobItem.

        The identifier of the variant owning this job.  # noqa: E501

        :param variant_id: The variant_id of this JobItem.  # noqa: E501
        :type: str
        """

        self._variant_id = variant_id

    @property
    def bundle_id(self):
        """Gets the bundle_id of this JobItem.  # noqa: E501

        The identifier of a content bundle linked to this job.  # noqa: E501

        :return: The bundle_id of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._bundle_id

    @bundle_id.setter
    def bundle_id(self, bundle_id):
        """Sets the bundle_id of this JobItem.

        The identifier of a content bundle linked to this job.  # noqa: E501

        :param bundle_id: The bundle_id of this JobItem.  # noqa: E501
        :type: str
        """

        self._bundle_id = bundle_id

    @property
    def start_time(self):
        """Gets the start_time of this JobItem.  # noqa: E501

        The timestamp (RFC3339) indicating when this job started.  # noqa: E501

        :return: The start_time of this JobItem.  # noqa: E501
        :rtype: datetime
        """
        return self._start_time

    @start_time.setter
    def start_time(self, start_time):
        """Sets the start_time of this JobItem.

        The timestamp (RFC3339) indicating when this job started.  # noqa: E501

        :param start_time: The start_time of this JobItem.  # noqa: E501
        :type: datetime
        """

        self._start_time = start_time

    @property
    def end_time(self):
        """Gets the end_time of this JobItem.  # noqa: E501

        The timestamp (RFC3339) indicating when this job finished.  # noqa: E501

        :return: The end_time of this JobItem.  # noqa: E501
        :rtype: datetime
        """
        return self._end_time

    @end_time.setter
    def end_time(self, end_time):
        """Sets the end_time of this JobItem.

        The timestamp (RFC3339) indicating when this job finished.  # noqa: E501

        :param end_time: The end_time of this JobItem.  # noqa: E501
        :type: datetime
        """

        self._end_time = end_time

    @property
    def last_heartbeat_time(self):
        """Gets the last_heartbeat_time of this JobItem.  # noqa: E501

        The timestamp (RFC3339) indicating the last time  this job was observed to be running.  # noqa: E501

        :return: The last_heartbeat_time of this JobItem.  # noqa: E501
        :rtype: datetime
        """
        return self._last_heartbeat_time

    @last_heartbeat_time.setter
    def last_heartbeat_time(self, last_heartbeat_time):
        """Sets the last_heartbeat_time of this JobItem.

        The timestamp (RFC3339) indicating the last time  this job was observed to be running.  # noqa: E501

        :param last_heartbeat_time: The last_heartbeat_time of this JobItem.  # noqa: E501
        :type: datetime
        """

        self._last_heartbeat_time = last_heartbeat_time

    @property
    def queued_time(self):
        """Gets the queued_time of this JobItem.  # noqa: E501

        The timestamp (RFC3339) indicating when this job was added to the queue to be processed. Only scheduled reports will present a value for this field.  # noqa: E501

        :return: The queued_time of this JobItem.  # noqa: E501
        :rtype: datetime
        """
        return self._queued_time

    @queued_time.setter
    def queued_time(self, queued_time):
        """Sets the queued_time of this JobItem.

        The timestamp (RFC3339) indicating when this job was added to the queue to be processed. Only scheduled reports will present a value for this field.  # noqa: E501

        :param queued_time: The queued_time of this JobItem.  # noqa: E501
        :type: datetime
        """

        self._queued_time = queued_time

    @property
    def queue_name(self):
        """Gets the queue_name of this JobItem.  # noqa: E501

        The name of the queue which processes the job. Only scheduled reports  will present a value for this field.  # noqa: E501

        :return: The queue_name of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._queue_name

    @queue_name.setter
    def queue_name(self, queue_name):
        """Sets the queue_name of this JobItem.

        The name of the queue which processes the job. Only scheduled reports  will present a value for this field.  # noqa: E501

        :param queue_name: The queue_name of this JobItem.  # noqa: E501
        :type: str
        """

        self._queue_name = queue_name

    @property
    def tag(self):
        """Gets the tag of this JobItem.  # noqa: E501

        A tag to identify the nature of the job. It can be one of `unknown`, `build_report`, `build_site`, `build_jupyter`, `packrat_restore`, `python_restore`, `configure_report`, `run_app`, `run_api`, `run_tensorflow` (obsolete), `run_python_api`, `run_dash_app`, `run_streamlit`, `run_bokeh_app`, `run_fastapi_app`, `run_pyshiny_app`, `render_shiny`, `run_voila_app`, `testing`, `git`, `val_py_ext_pkg`, `val_r_ext_pkg`, `val_r_install`.  # noqa: E501

        :return: The tag of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._tag

    @tag.setter
    def tag(self, tag):
        """Sets the tag of this JobItem.

        A tag to identify the nature of the job. It can be one of `unknown`, `build_report`, `build_site`, `build_jupyter`, `packrat_restore`, `python_restore`, `configure_report`, `run_app`, `run_api`, `run_tensorflow` (obsolete), `run_python_api`, `run_dash_app`, `run_streamlit`, `run_bokeh_app`, `run_fastapi_app`, `run_pyshiny_app`, `render_shiny`, `run_voila_app`, `testing`, `git`, `val_py_ext_pkg`, `val_r_ext_pkg`, `val_r_install`.  # noqa: E501

        :param tag: The tag of this JobItem.  # noqa: E501
        :type: str
        """

        self._tag = tag

    @property
    def exit_code(self):
        """Gets the exit_code of this JobItem.  # noqa: E501

        The job's exit code. Present only when job is finished.  # noqa: E501

        :return: The exit_code of this JobItem.  # noqa: E501
        :rtype: int
        """
        return self._exit_code

    @exit_code.setter
    def exit_code(self, exit_code):
        """Sets the exit_code of this JobItem.

        The job's exit code. Present only when job is finished.  # noqa: E501

        :param exit_code: The exit_code of this JobItem.  # noqa: E501
        :type: int
        """

        self._exit_code = exit_code

    @property
    def status(self):
        """Gets the status of this JobItem.  # noqa: E501

        The current status of the job. It can be one of Active: `0`, Finished: `1`, Finalized: `2`.  # noqa: E501

        :return: The status of this JobItem.  # noqa: E501
        :rtype: int
        """
        return self._status

    @status.setter
    def status(self, status):
        """Sets the status of this JobItem.

        The current status of the job. It can be one of Active: `0`, Finished: `1`, Finalized: `2`.  # noqa: E501

        :param status: The status of this JobItem.  # noqa: E501
        :type: int
        """

        self._status = status

    @property
    def hostname(self):
        """Gets the hostname of this JobItem.  # noqa: E501

        The name of the node which processes the job.  # noqa: E501

        :return: The hostname of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._hostname

    @hostname.setter
    def hostname(self, hostname):
        """Sets the hostname of this JobItem.

        The name of the node which processes the job.  # noqa: E501

        :param hostname: The hostname of this JobItem.  # noqa: E501
        :type: str
        """

        self._hostname = hostname

    @property
    def cluster(self):
        """Gets the cluster of this JobItem.  # noqa: E501

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. Gives the name of the cluster when run external to the Connect host.  # noqa: E501

        :return: The cluster of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._cluster

    @cluster.setter
    def cluster(self, cluster):
        """Sets the cluster of this JobItem.

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. Gives the name of the cluster when run external to the Connect host.  # noqa: E501

        :param cluster: The cluster of this JobItem.  # noqa: E501
        :type: str
        """

        self._cluster = cluster

    @property
    def image(self):
        """Gets the image of this JobItem.  # noqa: E501

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. References the name of the target image when content runs in a clustered environment such as Kubernetes.  # noqa: E501

        :return: The image of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._image

    @image.setter
    def image(self, image):
        """Sets the image of this JobItem.

        The location where this content runs. Content running on the same server as Connect will have either a `null` value or the string `Local`. References the name of the target image when content runs in a clustered environment such as Kubernetes.  # noqa: E501

        :param image: The image of this JobItem.  # noqa: E501
        :type: str
        """

        self._image = image

    @property
    def run_as(self):
        """Gets the run_as of this JobItem.  # noqa: E501

        The UNIX user that executed this job.  # noqa: E501

        :return: The run_as of this JobItem.  # noqa: E501
        :rtype: str
        """
        return self._run_as

    @run_as.setter
    def run_as(self, run_as):
        """Sets the run_as of this JobItem.

        The UNIX user that executed this job.  # noqa: E501

        :param run_as: The run_as of this JobItem.  # noqa: E501
        :type: str
        """

        self._run_as = run_as

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
        if issubclass(JobItem, dict):
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
        if not isinstance(other, JobItem):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
