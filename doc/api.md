## API Documentation
### Get All Videos

**Endpoint**: `/api/videos?s={string}`  
**Method**: `GET`  
**Description**: Retrieves a list of videos within the specified range.

**Request Parameters**:  
- `s` (string): Search query to filter the list of videos by name or description.    

**Response**:
```json
[
  {
    "uid": "string",
    "vid": "string",
    "name": "string",
    "description": "string",
    "thumbname": "string"
  },
  {
    "uid": "string",
    "vid": "string",
    "name": "string",
    "description": "string",
    "thumbname": "string"
  }
]
```

### Get All Videos

**Endpoint**: `/api/videos?first={int}&last={int}`  
**Method**: `GET`  
**Description**: Retrieves a list of videos within the specified range.

**Request Parameters**:  
- `first` (int): Index of the first video to retrieve.  
- `last` (int): Index of the last video to retrieve.  

**Response**:
```json
[
  {
    "uid": "string",
    "vid": "string",
    "name": "string",
    "description": "string",
    "thumbname": "string"
  },
  {
    "uid": "string",
    "vid": "string",
    "name": "string",
    "description": "string",
    "thumbname": "string"
  }
]
```

---

### Upload Video

**Endpoint**: `/api/upload`  
**Method**: `POST`  
**Description**: Uploads a new video.

**Request Body**:
```json
{
  "name": "string",
  "description": "string",
  "quality": "string",
  "thumbname": "string",
  "video": "string (file path or base64 encoded video)"
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

---

### Fetch Video

**Endpoint**: `/api/video?vid={vid}`  
**Method**: `GET`  
**Description**: Retrieves details of a specific video.

**Request Parameters**:  
- `vid` (string): Unique ID of the video to fetch.

**Response**:
```json
{
  "success": true,
  "data": {
    "uid": "string",
    "name": "string",
    "description": "string",
    "quality": "string",
    "thumbname": "/path/to/image/file",
    "created_date": "string (ISO 8601 format)",
    "updated_date": "string (ISO 8601 format)"
  }
}
```

---

### Delete Video

**Endpoint**: `/api/video/{vid}`  
**Method**: `DELETE`  
**Description**: Deletes a video by its unique ID.

**Request Parameters**:  
- `vid` (string): Unique ID of the video to delete.

**Response**:
```json
{
  "success": true,
  "message": "Video deleted successfully"
}
```

---

### Update Video

**Endpoint**: `/api/video/{vid}`  
**Method**: `PUT`  
**Description**: Updates the details of a specific video.

**Request Parameters**:  
- `vid` (string): Unique ID of the video to update.

**Request Body**:
```json
{
  "name": "string",
  "description": "string",
  "quality": "string",
  "thumbname": "string",
  "video": "string (file path or base64 encoded video)"
}
```

**Response**:
```json
{
  "success": true,
  "message": "Video updated successfully"
}
```

---

### Video Player Configuration

**Endpoint**: `/api/player?vid={vid}`  
**Method**: `GET`  
**Description**: Retrieves player configuration for streaming a specific video.

**Request Parameters**:  
- `vid` (string): Unique ID of the video for which to fetch the player configuration.

**Response**:
```json
{
  "playerConfig": {
    "bufferSize": "string (e.g., '10MB')",
    "syncInterval": "string (e.g., '5s')",
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
  }
}
```

### User Management

**Endpoint**: `/api/users`  
**Method**: `GET`  
**Description**: Retrieves a list of all users.

**Response**:
```json
[
  {
    "uid": "string",
    "username": "string",
    "email": "string",
    "created_date": "string (ISO 8601 format)"
  },
  {
    "uid": "string",
    "username": "string",
    "email": "string",
    "created_date": "string (ISO 8601 format)"
  }
]
```

### Get User Details

**Endpoint**: `/api/users/{uid}`  
**Method**: `GET`  
**Description**: Retrieves details of a specific user.

**Request Parameters**:  
- `uid` (string): Unique ID of the user to fetch.

**Response**:
```json
{
  "success": true,
  "data": {
    "uid": "string",
    "username": "string",
    "email": "string",
    "created_date": "string (ISO 8601 format)"
  }
}
```

### Create User

**Endpoint**: `/api/users`  
**Method**: `POST`  
**Description**: Creates a new user.

**Request Body**:
```json
{
  "username": "string",
  "email": "string",
  "password": "string"
}
```

**Response**:
```json
{
  "success": true,
  "message": "User created successfully",
  "data": {
    "uid": "string"
  }
}
```

### Update User

**Endpoint**: `/api/users/{uid}`  
**Method**: `PUT`  
**Description**: Updates the details of a specific user.

**Request Parameters**:  
- `uid` (string): Unique ID of the user to update.

**Request Body**:
```json
{
  "username": "string",
  "email": "string",
  "password": "string"
}
```

**Response**:
```json
{
  "success": true,
  "message": "User updated successfully"
}
```

### Delete User

**Endpoint**: `/api/users/{uid}`  
**Method**: `DELETE`  
**Description**: Deletes a user by their unique ID.

**Request Parameters**:  
- `uid` (string): Unique ID of the user to delete.

**Response**:
```json
{
  "success": true,
  "message": "User deleted successfully"
}
```
---

### Notes
- Ensure the `vid` parameter is URL-encoded when making requests.
- For the `video` field in the upload and update endpoints, specify whether the API expects a file path, a base64 string, or a multipart form-data file. Update the documentation accordingly if clarification is needed.
- Add details about authentication or authorization requirements if applicable.
