# Player 

The server-side player is responsible for handling video playback on the server. It manages video streaming, buffering, and synchronization with client-side players.

### Features

- Video streaming
- Buffer management
- Synchronization with clients

### API Endpoints

- `GET /api/player/start` - Start video playback
- `POST /api/player/pause` - Pause video playback
- `POST /api/player/stop` - Stop video playback

### Configuration

To configure the server-side player, update the `playerConfig` object in the server configuration file:

```json
{
  "playerConfig": {
    "bufferSize": "10MB",
    "syncInterval": "5s"
  }
}
```

### Example Usage

```bash
curl -X GET http://localhost:3000/api/player/start
```