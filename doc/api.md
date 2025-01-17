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
  "video": {
    "quality:part": "path"
  }
}
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
    "quality": "string",
    "thumbname": "string",
    "video": {
      "quality:part": "path"
    },
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
  "video": {
    "quality:part": "path"
  }
}
```

**Response**:
```json
{
  "success": true,
  "message": "Video updated successfully"
}
```