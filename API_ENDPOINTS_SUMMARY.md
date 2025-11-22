# Soulingo API Endpoints Summary

## Base URL
```
http://localhost:3000/api/v1
```

## Authentication Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/users` | Register new user | No |
| POST | `/users/sign_in` | Login user | No |
| DELETE | `/users/sign_out` | Logout user | Yes |
| POST | `/users/password` | Reset password | No |
| GET | `/user` | Get current user profile | Yes |
| PUT | `/user` | Update user profile | Yes |

## Lesson Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/lessons` | Get all lessons | No |
| GET | `/lessons?level=A1` | Get lessons by level | No |
| GET | `/lessons/:id` | Get single lesson with details | No |
| POST | `/lessons` | Create new lesson | Yes |
| PUT | `/lessons/:id` | Update lesson | Yes |
| DELETE | `/lessons/:id` | Delete lesson | Yes |

## Media Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/lessons/:lesson_id/media` | Get media for lesson | No |
| POST | `/media/upload` | Upload media resource | Yes |
| POST | `/media` | Create media resource | Yes |

## Vocabulary Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/lessons/:lesson_id/vocabulary` | Get vocabulary for lesson | No |
| POST | `/vocabulary` | Add vocabulary item | Yes |

## Quiz Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/lessons/:lesson_id/quizzes` | Get quizzes for lesson | No |
| POST | `/quizzes/:id/submit` | Submit quiz answer | Yes |

## User Progress Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/progress/user/:user_id` | Get user progress | Yes |
| POST | `/progress/update` | Update progress | Yes |

## Request/Response Examples

### Register User
```bash
POST /api/v1/users
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
```bash
POST /api/v1/users/sign_in
{
  "user": {
    "email": "user@example.com",
    "password": "password123"
  }
}
```

### Get Lessons
```bash
GET /api/v1/lessons
GET /api/v1/lessons?level=A1
```

### Create Lesson
```bash
POST /api/v1/lessons
Headers: access-token, client, uid
{
  "lesson": {
    "title": "Introduction to English",
    "description": "Basic English lesson",
    "level": "A1",
    "lesson_type": "Mixed"
  }
}
```

### Submit Quiz
```bash
POST /api/v1/quizzes/1/submit
Headers: access-token, client, uid
{
  "answer_index": 0
}

Response:
{
  "correct": true,
  "correct_index": 0,
  "message": "Correct answer!"
}
```

### Update Progress
```bash
POST /api/v1/progress/update
Headers: access-token, client, uid
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

## Authentication Headers

For authenticated requests, include these headers:
- `access-token`: Token from login response
- `client`: Client ID from login response
- `uid`: User email

## Language Levels (CEFR)

- **A1**: Beginner
- **A2**: Elementary
- **B1**: Intermediate
- **B2**: Upper Intermediate
- **C1**: Advanced
- **C2**: Proficient

## Lesson Types

- **Video**: Video-based lessons
- **Text**: Text-based lessons
- **Mixed**: Combination of video and text

## Media Types

- **Video**: Video files
- **Image**: Image files
- **Audio**: Audio files
- **Document**: PDF and other documents


