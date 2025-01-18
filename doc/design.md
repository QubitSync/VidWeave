## Database Design Using Joins

### Table: `Video`
Stores general information about videos.

| Column Name        | Data Type      | Constraints                     | Description                              |
|---------------------|---------------|---------------------------------|------------------------------------------|
| **id**             | `INTEGER`     | `PRIMARY KEY AUTOINCREMENT`     | Unique identifier for the video entry.   |
| **uid**            | `INTEGER`     | `NOT NULL`                      | User ID referencing the owner.           |
| **name**           | `TEXT`        | `NOT NULL`                      | Name of the video.                       |
| **description**    | `TEXT`        |                                 | Detailed description of the video.       |
| **thumbnail_path** | `TEXT`        |                                 | Path to the thumbnail image.             |
| **created_at**     | `TEXT`        | `DEFAULT CURRENT_TIMESTAMP`     | Timestamp when the video was created.    |
| **updated_at**     | `TEXT`        | `DEFAULT CURRENT_TIMESTAMP`     | Timestamp when the video was last updated. |

---

### Table: `VideoPart`
Stores video parts by quality and segment.

| Column Name   | Data Type      | Constraints                 | Description                              |
|---------------|---------------|-----------------------------|------------------------------------------|
| **id**        | `INTEGER`     | `PRIMARY KEY AUTOINCREMENT` | Unique identifier for the video part.    |
| **video_id**  | `INTEGER`     | `NOT NULL`                  | References the `Video.id` column.        |
| **quality**   | `TEXT`        | `NOT NULL`                  | Video quality (e.g., `320p`, `720p`).    |
| **segment**   | `INTEGER`     | `NOT NULL`                  | Segment number (e.g., `1`, `2`).         |
| **path**      | `TEXT`        | `NOT NULL`                  | Path to the video segment file.          |

---

### Example Data and Queries

#### Example Data:

**Video Table**:
| id | uid | name         | description              | thumbnail_path       | created_at       | updated_at       |
|----|-----|--------------|--------------------------|----------------------|------------------|------------------|
| 1  | 1   | Sample Video | A sample video example. | /thumbnails/sample.jpg | 2025-01-18 12:00 | 2025-01-18 12:00 |

**VideoPart Table**:
| id | video_id | quality | segment | path                  |
|----|----------|---------|---------|-----------------------|
| 1  | 1        | 320p    | 1       | /videos/320p/part1.mp4|
| 2  | 1        | 320p    | 2       | /videos/320p/part2.mp4|
| 3  | 1        | 720p    | 1       | /videos/720p/part1.mp4|
| 4  | 1        | 720p    | 2       | /videos/720p/part2.mp4|
| 5  | 1        | 1080p   | 1       | /videos/1080p/part1.mp4|

---

### Queries

#### Retrieve Video Information with Parts:
```sql
SELECT v.id, v.name, v.description, vp.quality, vp.segment, vp.path
FROM Video v
JOIN VideoPart vp ON v.id = vp.video_id
WHERE v.id = 1;
```

**Result**:
| id | name          | description              | quality | segment | path                  |
|----|---------------|--------------------------|---------|---------|-----------------------|
| 1  | Sample Video  | A sample video example.  | 320p    | 1       | /videos/320p/part1.mp4|
| 1  | Sample Video  | A sample video example.  | 320p    | 2       | /videos/320p/part2.mp4|
| 1  | Sample Video  | A sample video example.  | 720p    | 1       | /videos/720p/part1.mp4|

#### Add a Video:
```sql
INSERT INTO Video (uid, name, description, thumbnail_path)
VALUES (1, 'Sample Video', 'A sample video example.', '/thumbnails/sample.jpg');
```

#### Add Video Parts:
```sql
INSERT INTO VideoPart (video_id, quality, segment, path)
VALUES 
  (1, '320p', 1, '/videos/320p/part1.mp4'),
  (1, '320p', 2, '/videos/320p/part2.mp4'),
  (1, '720p', 1, '/videos/720p/part1.mp4');
```
