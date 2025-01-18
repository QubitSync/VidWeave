# VidWeave

VidWeave is a lightweight, Zig-powered backend designed for efficient video processing. It handles tasks like transcoding, chunking videos into multiple quality levels, and saving metadata to an SQLite database. VidWeave also provides a REST API for seamless integration with other services.

## Features

- **Video Processing**: Transcode videos into multiple quality chunks.
- **SQLite Integration**: Save video metadata and processing details in an SQLite database.
- **REST API**: Easily integrate with your frontend or other services.

## Requirements

- Zig (latest version)
- FFmpeg (for video processing)
- SQLite3
- Zap

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/VidWeave.git
   cd VidWeave
   ```

2. Install dependencies (ensure FFmpeg and SQLite are installed on your system).

3. Build the project:
   ```bash
   zig build
   ```

## Usage

Run the application:
```bash
zig build run
```

## API Endpoints

The provided API and database schema define a clear workflow for uploading, managing, and streaming videos. Below is a summary and clarification for ease of understanding:

### **API Overview**

#### **Upload Video**
- **Endpoint**: `/api/upload`
- **Method**: `POST`
- **Purpose**: Allows uploading a video with metadata like name, description, quality, and a thumbnail.
- **Required Fields**: `name`, `description`, `quality`, `thumbname`, `video`.

#### **Fetch Video**
- **Endpoint**: `/api/video/{vid}`
- **Method**: `GET`
- **Purpose**: Retrieves video details using the video ID.
- **Response Data**:
  - Metadata (`name`, `description`, `quality`, etc.).
  - Video paths.

#### **Delete Video**
- **Endpoint**: `/api/video/{vid}`
- **Method**: `DELETE`
- **Purpose**: Deletes a specific video by its ID.
- **Response**: Success message.

#### **Update Video**
- **Endpoint**: `/api/video/{vid}`
- **Method**: `PUT`
- **Purpose**: Updates metadata and video files for a specific video.
- **Request Fields**: Similar to the upload endpoint.

#### **Player Configuration**
- **Endpoint**: `/api/player`
- **Method**: `GET`
- **Purpose**: Fetches player configuration settings, including video and audio files at different resolutions.

### **Database Schema**

The `Video` table structure supports the following:
- Unique identifiers for users (`uid`) and videos (`vid`).
- Fields for metadata (`name`, `description`, `quality`).
- JSON structure for video paths, e.g., `{ "720p:1": "/path/to/part1", ... }`.
- Timestamps for creation and updates.

### **Player Features**
- Streams videos and handles buffering.
- Synchronizes playback with client-side players.
- Configuration is stored in a JSON-like structure.

## Project Structure

```
├── src/
│   ├── main.zig         # Main application file
│   ├── api.zig          # API endpoint handlers
│   ├── video_processor.zig  # Video processing logic
│   ├── db.zig           # SQLite database integration
├── build.zig            # Build script
├── README.md            # Project documentation
```

### Notes for Implementation
1. **Video Splitting**: The server should handle segmenting videos into parts for efficient streaming (e.g., `320p:1`, `720p:1`).
2. **Buffer Management**: Ensure the buffer size and synchronization intervals in `playerConfig` match the expected client performance.
3. **Security**: Protect endpoints, especially upload and delete, with authentication/authorization.
4. **Error Handling**: Define error responses for cases like invalid video IDs, incomplete uploads, or configuration mismatches.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License. See `LICENSE` for details.
