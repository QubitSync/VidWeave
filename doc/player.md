# Player 

The server-side player is responsible for handling video playback on the server. It manages video streaming, buffering, and synchronization with client-side players.

### Features

- Video streaming
- Buffer management
- Synchronization with clients

### Configuration

To configure the server-side player, update the `playerConfig` object in the server configuration file:

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
