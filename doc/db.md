## Table: `User`
| Column Name       | Data Type        | Constraints                               | Description                                  |
|-------------------|------------------|-------------------------------------------|----------------------------------------------|
| **id**            | `CHAR(36)`       | `PRIMARY KEY`                             | Unique identifier for the user (UUID).       |
| **username**      | `VARCHAR(30)`    | `UNIQUE`, `NOT NULL`                      | Unique username for the user.                |
| **password**      | `VARCHAR(255)`   | `NOT NULL`                                | Hashed password of the user account.         |
| **profile_img**   | `TEXT`           |                                           | URL or path to the user's profile image.     |
| **cover_img**     | `TEXT`           |                                           | URL or path to the user's cover image.       |
| **email**         | `VARCHAR(50)`    | `UNIQUE`, `NOT NULL`                      | Email address of the user.                   |
| **created_at**    | `DATETIME`       | `DEFAULT CURRENT_TIMESTAMP`               | Timestamp when the user account was created. |
| **updated_at**    | `DATETIME`       | `DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | Timestamp when the user account was last updated. |

---

## Table: `Video_Description`
| Column Name        | Data Type         | Constraints                               | Description                                   |
|--------------------|-------------------|-------------------------------------------|-----------------------------------------------|
| **id**             | `CHAR(36)`        | `PRIMARY KEY`                             | Unique identifier for the video description (UUID). |
| **user_id**        | `CHAR(36)`        | `NOT NULL`, `FOREIGN KEY` (`User`.`id`)   | References the user who owns the video.       |
| **video_id**       | `CHAR(36)`        | `NOT NULL`, `FOREIGN KEY` (`Video`.`id`)  | References the related video.                 |
| **name**           | `VARCHAR(255)`    | `NOT NULL`                                | Name of the video.                            |
| **description**    | `TEXT`            |                                           | Detailed description of the video.            |
| **thumbnail_path** | `TEXT`            |                                           | Path or URL to the video thumbnail image.     |
| **created_at**     | `DATETIME`        | `DEFAULT CURRENT_TIMESTAMP`               | Timestamp when the video description was created. |
| **updated_at**     | `DATETIME`        | `DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP` | Timestamp when the video description was last updated. |

---

## Table: `Video`
| Column Name   | Data Type     | Constraints                               | Description                                  |
|---------------|---------------|-------------------------------------------|----------------------------------------------|
| **id**        | `CHAR(36)`    | `PRIMARY KEY`                             | Unique identifier for the video part (UUID). |
| **quality**   | `VARCHAR(20)` | `NOT NULL`                                | Video quality (e.g., `320p`, `720p`).        |
| **segment**   | `INTEGER`     | `NOT NULL`                                | Segment number of the video (e.g., `1`, `2`).|
| **path**      | `TEXT`        | `NOT NULL`                                | Path or URL to the video segment file.       |
