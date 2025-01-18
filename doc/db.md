## Table: `User`
| Column Name        | Data Type        | Constraints                 | Description                                   |
|--------------------|------------------|-----------------------------|-----------------------------------------------|
| **id**             | `UID`            | `PRIMARY KEY`               | Unique identifier for user                    |
| **username**       | `VARCHAR(30)`    | `UNIQUE KEY`                | Unique username for user                      |
| **password**       | `VARCHAR(40)`    | `NOT NULL`                  | Password of user account                      |
| **profile_img**    | `TEXT`           |                             | Profile image of user account                 |
| **cover_img**      | `TEXT`           |                             | Cover image of user account                   |
| **mail**           | `VARCHAR(50)`    | `UNIQUE KEY`                | Mail of user                                  |
| **created_at**     | `DATETIME`       | `DEFAULT CURRENT_TIMESTAMP` | Timestamp when the video was created.         |
| **updated_at**     | `DATETIME`       | `DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | Timestamp when the video was last updated. |


## Table: `Video Description`

| Column Name       | Data Type         | Constraints                 | Description                                   |
|-------------------|-------------------|-----------------------------|-----------------------------------------------|
| **id**            | `UID`             | `PRIMARY KEY`               | Unique identifier for the video entry.       |
| **uid**           | `BIGINT`          | `NOT NULL`, `FOREIGN KEY` (to `User.id`) | References the user who owns the video.      |
| **vid**           | `VARCHAR(36)`     | `NOT NULL`, `FOREIGN KEY` (to `Video.id`) | Unique UUID for the video.                   |
| **name**          | `VARCHAR(255)`    | `NOT NULL`                  | Name of the video.                           |
| **description**   | `TEXT`            |                              | Detailed description of the video.           |
| **thumbnail_path**| `VARCHAR(255)`    |                              | Path to the thumbnail image.                 |
| **created_at**    | `DATETIME`        | `DEFAULT CURRENT_TIMESTAMP` | Timestamp when the video was created.        |
| **updated_at**    | `DATETIME`        | `DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | Timestamp when the video was last updated. |

## Table: `Video`

| Column Name   | Data Type     | Constraints                 | Description                              |
|---------------|---------------|-----------------------------|------------------------------------------|
| **id**        | `UID`         | `PRIMARY KEY`               | Unique identifier for the video part.    |
| **quality**   | `TEXT`        | `NOT NULL`                  | Video quality (e.g., `320p`, `720p`).    |
| **segment**   | `INTEGER`     | `NOT NULL`                  | Segment number (e.g., `1`, `2`).         |
| **path**      | `TEXT`        | `NOT NULL`                  | Path to the video segment file.          |

---

### Example JSON Data for `video_parts`

```json
{
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
}
```

---

### Advantages of This Structure

1. **Flexibility with `JSON`**:
   - The `video_parts` field can easily store complex hierarchical data, like video qualities and segments, without needing additional tables or major schema changes.

2. **Efficiency**:
   - Storing video segments within a single `JSON` column avoids joins and simplifies data retrieval.

3. **Scalability**:
   - Supports dynamic addition of new qualities or segments without modifying the schema.

4. **Ease of Use**:
   - Allows straightforward retrieval and updates using JSON functions provided by modern databases like MySQL, PostgreSQL, or MariaDB.

---

### Queries Example:

#### Insert Example:
```sql
INSERT INTO Video (uid, vid, name, description, thumbnail_path, video_parts) 
VALUES (
  1, 
  '123e4567-e89b-12d3-a456-426614174000', 
  'Sample Video', 
  'A sample video with multiple qualities and segments', 
  '/thumbnails/sample.jpg', 
  '{
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
  }'
);
```

#### Retrieve Example:
```sql
SELECT video_parts->'$.720p.1' AS `720p_segment1`
FROM Video
WHERE vid = '123e4567-e89b-12d3-a456-426614174000';
```

#### Update Example:
```sql
UPDATE Video
SET video_parts = JSON_SET(video_parts, '$.1080p.3', 'path/to/1080p/video3')
WHERE vid = '123e4567-e89b-12d3-a456-426614174000';
```
