# Upload file
**`POST` /container/<containerId\>/file**

### Description
Upload a new file. Only files with a size less than 250KB are allowed.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Files must be uploaded using multipart/form-data. See the examples below.

### Return codes
Error code  | Reason
------------|--------
`201`       | Success.
`400`       | Invalid file _(for example too large)_.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`INSERT_CHECK_DATA`)_.
`404`       | Container not found.

### Examples
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/file' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --form '=@"/path-to-file/network-drawing.png"'
```

Response:
```json
{
    "id": 456
}
```

Python:
```python
import requests

url = "https://api.infrasonar.com/container/123/file"

files = [('', (
    'network-drawing.png',
    open('/path-to-file/network-drawing.png','rb'),
    'image/jpeg'
))]

headers = {
    'Content-Type': 'multipart/form-data',
    'Authorization': 'Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
}

response = requests.request("POST", url, headers=headers, files=files)

print(response.json())  # {"id":456}
```

C# (Http Client)
```c#
var client = new HttpClient();
var request = new HttpRequestMessage(
    HttpMethod.Post,
    "https://api.infrasonar.com/container/123/file");

// Set Authentication header
request.Headers.Add(
    "Authorization",
    "Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

// Create multipart content
var content = new MultipartFormDataContent();
content.Add(
    new StreamContent(File.OpenRead("/path-to-file/network-drawing.png")),
    "",
    "/path-to-file/network-drawing.png");

// Add contend to request
request.Content = content;

var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();

Console.WriteLine(await response.Content.ReadAsStringAsync());
// "{\"id\":456}"
```
