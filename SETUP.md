# Soulingo API Setup Guide

## Prerequisites

- Ruby 3.4 or higher
- SQLite3
- Bundler

## Installation Steps

### 1. Install Dependencies

```bash
bundle install
```

### 2. Create Storage Directory

```bash
mkdir -p storage
```

### 3. Setup Database

```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Load sample data (optional)
rails db:seed
```

### 4. Start the Server

```bash
rails server
```

The API will be available at `http://localhost:3000`

## Testing the API

### 1. Register a New User

```bash
curl -X POST http://localhost:3000/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "email": "test@example.com",
      "password": "password123",
      "password_confirmation": "password123",
      "display_name": "Test User",
      "level": "A1"
    }
  }'
```

Save the `access-token`, `client`, and `uid` from the response headers.

### 2. Login

```bash
curl -X POST http://localhost:3000/api/v1/users/sign_in \
  -H "Content-Type: application/json" \
  -d '{
    "user": {
      "email": "test@example.com",
      "password": "password123"
    }
  }'
```

### 3. Get All Lessons

```bash
curl http://localhost:3000/api/v1/lessons
```

### 4. Get Lessons by Level

```bash
curl http://localhost:3000/api/v1/lessons?level=A1
```

### 5. Get Single Lesson with Details

```bash
curl http://localhost:3000/api/v1/lessons/1
```

### 6. Create a Lesson (Authenticated)

```bash
curl -X POST http://localhost:3000/api/v1/lessons \
  -H "Content-Type: application/json" \
  -H "access-token: YOUR_TOKEN" \
  -H "client: YOUR_CLIENT" \
  -H "uid: YOUR_EMAIL" \
  -d '{
    "lesson": {
      "title": "My First Lesson",
      "description": "Learning basics",
      "level": "A1",
      "lesson_type": "Mixed"
    }
  }'
```

### 7. Submit Quiz Answer (Authenticated)

```bash
curl -X POST http://localhost:3000/api/v1/quizzes/1/submit \
  -H "Content-Type: application/json" \
  -H "access-token: YOUR_TOKEN" \
  -H "client: YOUR_CLIENT" \
  -H "uid: YOUR_EMAIL" \
  -d '{
    "answer_index": 0
  }'
```

### 8. Update User Progress (Authenticated)

```bash
curl -X POST http://localhost:3000/api/v1/progress/update \
  -H "Content-Type: application/json" \
  -H "access-token: YOUR_TOKEN" \
  -H "client: YOUR_CLIENT" \
  -H "uid: YOUR_EMAIL" \
  -d '{
    "user_id": 1,
    "lesson_id": 1,
    "user_progress": {
      "completion_percent": 100,
      "correct_answers": 3,
      "total_questions": 3
    }
  }'
```

## Sample Data

If you ran `rails db:seed`, you have access to:

**Users:**
- Email: `student@example.com`, Password: `password123` (Level: A1)
- Email: `advanced@example.com`, Password: `password123` (Level: B2)

**Lessons:**
- Introduction to English (A1)
- English Grammar Basics (A2)
- Business English (B2)

## Troubleshooting

### Database Issues

If you encounter database issues, try:

```bash
rails db:drop db:create db:migrate db:seed
```

### Port Already in Use

If port 3000 is already in use:

```bash
rails server -p 3001
```

### Reset Database

```bash
rails db:reset
```

This will drop, create, migrate, and seed the database.

## Next Steps

1. Read the full API documentation in `SOULINGO_API.md`
2. Explore the API endpoints using Postman or curl
3. Check the API documentation UI at `http://localhost:3000/api-docs`

## Development Tools

### Rails Console

```bash
rails console
```

### Database Console

```bash
rails dbconsole
```

### Run Tests

```bash
bundle exec rspec
```

## Production Deployment

For production deployment, make sure to:

1. Set proper environment variables
2. Use a production-grade database (PostgreSQL recommended)
3. Configure proper CORS settings
4. Set up SSL/TLS
5. Configure proper secret keys


