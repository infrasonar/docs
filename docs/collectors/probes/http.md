![HTTP-Probe](../../images/probe_http.png){ width="300" align=right}

# :material-web: HTTP Probe

## Introduction

The HTTP probe allows to monitor a specific [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) over the http or https protocol

## Features

* Roundtrip time, the roundtriptime for the http(s) request is measured and returned.
* HTTP status code monitoring

## Deployment

The HTTP probe can easily be deployed using our [appliance manager](./appliance/appliance_manager.md).

## Probe configuration

Property        | Description
----------------|------------------------
URI             | URI of the website you want to monitor
Timeout         | Timeout in seconds should be a value between 0 and 240. The default timeout is 10.0
Verify SSL      | If turned off, the check ignores invalid certificates; when on, the URI must have a valid certificate. Nots, this is only applicable for HTTPS URI. The default is off.
With payload    | Retrieves the payload, bare in mind the payload is limited to 500 Kb
Allow redirects | When turned on, redirects are followed.

!!! Tip Redirects
    When monitoring cloud services, enable **Allow redirects** as these services heavily rely on http redirects.


## Check specifics

### HTTP Status codes

See [RFC9110](https://www.rfc-editor.org/rfc/rfc9110.html#name-status-codes) or the [List of HTTP status codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes) on Wikipedia for more detailed information.

code | class         | code Meaning
-----|---------------|-------------
100  | Informational | Continue
101  | Informational | Switching protocols
102  | Informational | Processing
103  | Informational | Early Hints
200  | Successful    | OK
201  | Successful    | Created
202  | Successful    | Accepted
203  | Successful    | Non-Authoritative Information
204  | Successful    | No Content
205  | Successful    | Reset Content
206  | Successful    | Partial Content
207  | Successful    | Multi-Status
208  | Successful    | Already Reported
226  | Successful    | IM Used
300  | Redirection   | Multiple Choices
301  | Redirection   | Moved Permanently
302  | Redirection   | Found (Previously "Moved Temporarily")
303  | Redirection   | See Other
304  | Redirection   | Not Modified
305  | Redirection   | Use Proxy
306  | Redirection   | Switch Proxy
307  | Redirection   | Temporary Redirect
308  | Redirection   | Permanent Redirect
400  | Client Error  | Bad Request
401  | Client Error  | Unauthorized
402  | Client Error  | Payment Required
403  | Client Error  | Forbidden
404  | Client Error  | Not Found
405  | Client Error  | Method Not Allowed
406  | Client Error  | Not Acceptable
407  | Client Error  | Proxy Authentication Required
408  | Client Error  | Request Timeout
409  | Client Error  | Conflict
410  | Client Error  | Gone
411  | Client Error  | Length Required
412  | Client Error  | Precondition Failed
413  | Client Error  | Payload Too Large
414  | Client Error  | URI Too Long
415  | Client Error  | Unsupported Media Type
416  | Client Error  | Range Not Satisfiable
417  | Client Error  | Expectation Failed
418  | Client Error  | I'm a Teapot
421  | Client Error  | Misdirected Request
422  | Client Error  | Unprocessable Entity
423  | Client Error  | Locked
424  | Client Error  | Failed Dependency
425  | Client Error  | Too Early
426  | Client Error  | Upgrade Required
428  | Client Error  | Precondition Required
429  | Client Error  | Too Many Requests
431  | Client Error  | Request Header Fields Too Large
451  | Client Error  | Unavailable For Legal Reasons
500  | Server Error  | Internal Server Error
501  | Server Error  | Not Implemented
502  | Server Error  | Bad Gateway
503  | Server Error  | Service Unavailable
504  | Server Error  | Gateway Timeout
505  | Server Error  | HTTP Version Not Supported
506  | Server Error  | Variant Also Negotiates
507  | Server Error  | Insufficient Storage
508  | Server Error  | Loop Detected
510  | Server Error  | Not Extended
511  | Server Error  | Network Authentication Required

## Additional information

:material-github: [HTTP probe source code](https://github.com/infrasonar/http-probe)