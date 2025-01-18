## Api 

### Upload Video

**Endpoint**: `/api/upload`

**Method**: `POST`

**Request Body**:
```json
{
  "name": "string",
  "description": "string",
  "quality": "string",
  "thumbname": "string",
  "video": "video"
```

**Response**:
```json
{
  "success": true,
  "message": "Video uploaded successfully",
  "data": {
    "uid": "string"
  }
}
```

### Fetch Video

**Endpoint**: `/api/video/{vid}`

**Method**: `GET`

**Response**:
```json
{
  "success": true,
  "data": {
    "uid": "string",
    "name": "string",
    "description": "string",
    "quality": "json",
    "thumbname": "/path/to/image/file",
    "created_date": "string",
    "updated_date": "string"
  }
}
```

### Delete Video

**Endpoint**: `/api/video/{vid}`

**Method**: `DELETE`

**Response**:
```json
{
  "success": true,
  "message": "Video deleted successfully"
}
```

### Update Video

**Endpoint**: `/api/video/{vid}`

**Method**: `PUT`

**Request Body**:
```json
{
  "name": "string",
  "description": "string",
  "quality": "string",
  "thumbname": "string",
  "video": "string"
}
```

**Response**:
```json
{
  "success": true,
  "message": "Video updated successfully"
}
```

### Player 

**Endpoints**: `/api/player`

**Method**: `GET`

**Request Body**:
```json
{
  "playerConfig": {
    "bufferSize": "10MB",
    "syncInterval": "5s",
    "video": {
      "320p": {
        "1": "path/to/320p/video1",
        "2": "path/to/320p/video2"
      },
      "720p": {
        "1": "path/to/720p/video1",
        "2": "path/to/720p/video2"
      },
      "1080p": {
        "1": "path/to/1080p/video1",
        "2": "path/to/1080p/video2"
      }
    },
    "audio": "/path/to/audio/file"
  }
}
```
