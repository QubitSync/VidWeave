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

### 1. **Process Video**
- **Endpoint**: `POST /api/process`
- **Description**: Processes a video, chunks it into different quality levels, and stores metadata in the SQLite database.
- **Request Body**:
  ```json
  {
    "file_path": "path/to/video.mp4",
    "qualities": [240, 480, 720]
  }
  ```
- **Response**:
  ```json
  {
    "status": "success",
    "video_id": "12345",
    "message": "Video processed successfully."
  }
  ```

### 2. **Get Video Metadata**
- **Endpoint**: `GET /api/videos/:video_id`
- **Description**: Fetch metadata for a processed video.
- **Response**:
  ```json
  {
    "video_id": "12345",
    "original_path": "path/to/video.mp4",
    "qualities": [240, 480, 720],
    "chunks": [
      "path/to/video_240p.mp4",
      "path/to/video_480p.mp4",
      "path/to/video_720p.mp4"
    ]
  }
  ```

### 3. **List All Videos**
- **Endpoint**: `GET /api/videos`
- **Description**: Fetch a list of all processed videos.
- **Response**:
  ```json
  [
    {
      "video_id": "12345",
      "original_path": "path/to/video.mp4"
    },
    {
      "video_id": "67890",
      "original_path": "path/to/another_video.mp4"
    }
  ]
  ```

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

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License. See `LICENSE` for details.
