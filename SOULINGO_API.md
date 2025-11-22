# Soulingo API Documentation

A language learning platform API built with Rails 8.0 and SQLite3.

## 🚀 Quick Start

### Prerequisites
- Ruby 3.4+
- SQLite3
- Bundler

### Installation

```bash
# Install dependencies
bundle install

# Setup database
rails db:create db:migrate

# Start server
rails server
```

## 📊 Database Models

### User
- `id` - Integer (Primary Key)
- `email` - String (Unique)
- `encrypted_password` - String
- `display_name` - String
- `level` - String (A1, A2, B1, B2, C1, C2)
- `created_at` - DateTime
- `updated_at` - DateTime

### Lesson
- `id` - Integer (Primary Key)
- `title` - String (Required)
- `description` - Text
- `level` - String (Required: A1, A2, B1, B2, C1, C2)
- `lesson_type` - String (Required: Video, Text, Mixed)
- `created_at` - DateTime
- `updated_at` - DateTime

### MediaResource
- `id` - Integer (Primary Key)
- `lesson_id` - Integer (Foreign Key)
- `url` - String (Required)
- `media_type` - String (Required: Video, Image, Audio, Document)
- `mime_type` - String
- `created_at` - DateTime
- `updated_at` - DateTime

### VocabularyItem
- `id` - Integer (Primary Key)
- `lesson_id` - Integer (Foreign Key)
- `word` - String (Required)
- `meaning` - Text (Required)
- `example_sentence` - Text
- `part_of_speech` - String
- `created_at` - DateTime
- `updated_at` - DateTime

### Quiz
- `id` - Integer (Primary Key)
- `lesson_id` - Integer (Foreign Key)
- `question` - Text (Required)
- `options` - JSON Array (Required)
- `correct_index` - Integer (Required)
- `created_at` - DateTime
- `updated_at` - DateTime

### UserProgress
- `id` - Integer (Primary Key)
- `user_id` - Integer (Foreign Key)
- `lesson_id` - Integer (Foreign Key)
- `completion_percent` - Integer (0-100, Default: 0)
- `correct_answers` - Integer (Default: 0)
- `total_questions` - Integer (Default: 0)
- `created_at` - DateTime
- `updated_at` - DateTime

## 🔐 Authentication Endpoints

### Register
```http
POST /api/v1/users
Content-Type: application/json

{
  "user": {
    "email": "user@example.com",
    "password": "password123",
    "password_confirmation": "password123",
    "display_name": "John Doe",
    "level": "A1"
  }
}
```

### Login
```http
POST /api/v1/users/sign_in
Content-Type: application/json

{
  "user": {
    "email": "user@example.com",
    "password": "password123"
  }
}
```

**Response Headers:**
- `access-token` - Authentication token
- `client` - Client identifier
- `uid` - User email

### Logout
```http
DELETE /api/v1/users/sign_out
access-token: {token}
client: {client}
uid: {uid}
```

## 📚 Lesson Endpoints

### Get All Lessons
```http
GET /api/v1/lessons
GET /api/v1/lessons?level=A1  # Filter by level
```

### Get Single Lesson
```http
GET /api/v1/lessons/:id
```

**Response includes:**
- Lesson details
- Associated media resources
- Vocabulary items
- Quizzes (without correct answers)

### Create Lesson (Authenticated)
```http
POST /api/v1/lessons
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "lesson": {
    "title": "Introduction to English",
    "description": "Basic English lesson",
    "level": "A1",
    "lesson_type": "Mixed"
  }
}
```

### Update Lesson (Authenticated)
```http
PUT /api/v1/lessons/:id
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "lesson": {
    "title": "Updated Title"
  }
}
```

### Delete Lesson (Authenticated)
```http
DELETE /api/v1/lessons/:id
access-token: {token}
client: {client}
uid: {uid}
```

## 🎥 Media Endpoints

### Get Media for Lesson
```http
GET /api/v1/lessons/:lesson_id/media
```

### Upload Media (Authenticated)
```http
POST /api/v1/media/upload
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "media_resource": {
    "lesson_id": 1,
    "url": "https://example.com/video.mp4",
    "media_type": "Video",
    "mime_type": "video/mp4"
  }
}
```

## 📝 Vocabulary Endpoints

### Get Vocabulary for Lesson
```http
GET /api/v1/lessons/:lesson_id/vocabulary
```

### Add Vocabulary Item (Authenticated)
```http
POST /api/v1/vocabulary
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "vocabulary_item": {
    "lesson_id": 1,
    "word": "hello",
    "meaning": "a greeting",
    "example_sentence": "Hello, how are you?",
    "part_of_speech": "interjection"
  }
}
```

## 🧠 Quiz Endpoints

### Get Quizzes for Lesson
```http
GET /api/v1/lessons/:lesson_id/quizzes
```

**Note:** Correct answers are not included in the response.

### Submit Quiz Answer (Authenticated)
```http
POST /api/v1/quizzes/:id/submit
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "answer_index": 2
}
```

**Response:**
```json
{
  "correct": true,
  "correct_index": 2,
  "message": "Correct answer!"
}
```

## 📈 User Progress Endpoints

### Get User Progress (Authenticated)
```http
GET /api/v1/progress/user/:user_id
access-token: {token}
client: {client}
uid: {uid}
```

**Response:**
```json
{
  "progress": [
    {
      "id": 1,
      "lesson_id": 1,
      "lesson_title": "Introduction to English",
      "lesson_level": "A1",
      "completion_percent": 75,
      "correct_answers": 8,
      "total_questions": 10,
      "score": 80.0,
      "completed": false,
      "updated_at": "2025-01-20T10:30:00Z"
    }
  ]
}
```

### Update Progress (Authenticated)
```http
POST /api/v1/progress/update
access-token: {token}
client: {client}
uid: {uid}
Content-Type: application/json

{
  "user_id": 1,
  "lesson_id": 1,
  "user_progress": {
    "completion_percent": 100,
    "correct_answers": 10,
    "total_questions": 10
  }
}
```

## 🔑 Authentication Headers

All authenticated endpoints require these headers:
- `access-token` - Token received from login
- `client` - Client ID received from login
- `uid` - User email

## 📋 Language Levels

Supported CEFR levels:
- **A1** - Beginner
- **A2** - Elementary
- **B1** - Intermediate
- **B2** - Upper Intermediate
- **C1** - Advanced
- **C2** - Proficient

## 🎯 Lesson Types

- **Video** - Video-based lessons
- **Text** - Text-based lessons
- **Mixed** - Combination of video and text

## 🔒 Authorization

- Public endpoints: Lessons (index, show), Media (index), Vocabulary (index), Quizzes (index)
- Authenticated endpoints: All create/update/delete operations, quiz submission, progress tracking
- Users can only view/update their own progress

## 🛠️ Development

### Run Migrations
```bash
rails db:migrate
```

### Create Sample Data
```bash
rails console
# Create a user
user = User.create!(email: 'test@example.com', password: 'password123', display_name: 'Test User', level: 'A1')

# Create a lesson
lesson = Lesson.create!(title: 'First Lesson', description: 'Learn basics', level: 'A1', lesson_type: 'Mixed')

# Add vocabulary
lesson.vocabulary_items.create!(word: 'hello', meaning: 'greeting', example_sentence: 'Hello world!')

# Add quiz
lesson.quizzes.create!(question: 'What is hello?', options: ['greeting', 'goodbye', 'thanks'], correct_index: 0)
```

### Run Tests
```bash
bundle exec rspec
```

## 📦 Tech Stack

- **Framework:** Rails 8.0
- **Database:** SQLite3
- **Authentication:** Devise + DeviseTokenAuth
- **Authorization:** Pundit
- **JSON Serialization:** Jbuilder

## 🌐 API Base URL

Development: `http://localhost:3000/api/v1`


