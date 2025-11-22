# Soulingo API

A comprehensive language learning platform API built with Rails 8.0 and SQLite3.

Soulingo API provides a complete backend solution for language learning applications, featuring user management, lesson organization, multimedia content, vocabulary tracking, quizzes, and progress monitoring.

Based on the Rails API Base template, it follows community best practices in terms of standards, security and maintainability.

## Features

### Core Functionality
- **User Management**
  - User registration and authentication (JWT tokens via DeviseTokenAuth)
  - User profiles with display names and language levels (A1-C2)
  - Password reset functionality

- **Lesson Management**
  - Create, read, update, delete lessons
  - Filter lessons by CEFR level (A1, A2, B1, B2, C1, C2)
  - Support for multiple lesson types (Video, Text, Mixed)

- **Media Resources**
  - Upload and manage multimedia content
  - Support for Video, Image, Audio, and Document types
  - Associate media with lessons

- **Vocabulary System**
  - Add vocabulary items to lessons
  - Include word meanings, example sentences, and parts of speech
  - Organize vocabulary by lesson

- **Quiz System**
  - Create multiple-choice quizzes for lessons
  - Submit and validate quiz answers
  - Track correct/incorrect responses

- **Progress Tracking**
  - Monitor user progress per lesson
  - Track completion percentage
  - Calculate quiz scores
  - View learning statistics

### Technical Features
- SQLite3 database (lightweight and portable)
- RESTful API design
- JSON responses with Jbuilder
- Pundit authorization
- Administration panel (ActiveAdmin)
- Feature flags support
- Code quality tools (RuboCop, Brakeman)
- RSpec tests
- API documentation (OpenAPI/Swagger)
- Docker support

## Quick Start

### Prerequisites
- Ruby 3.4+
- SQLite3
- Node.js (version specified in `.nvmrc`)
- Yarn

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd SoulingoApi.0.1
   ```

2. **Install dependencies**
   ```bash
   bundle install
   yarn install
   ```

3. **Create storage directory**
   ```bash
   mkdir -p storage
   ```

4. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Optional: loads sample data
   ```

5. **Start the server**
   ```bash
   rails server
   ```

6. **Access the API**
   - API Base URL: `http://localhost:3000/api/v1`
   - Admin Panel: `http://localhost:3000/admin`
   - API Docs: `http://localhost:3000/api-docs`

For detailed setup instructions, see [SETUP.md](SETUP.md).

For complete API documentation, see [SOULINGO_API.md](SOULINGO_API.md).

## How to use with Docker

1. Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)
1. Run `bootstrap.sh` with the name of your project and the `-d` or `--for-docker` flag like `./bin/bootstrap.sh --name=my_awesome_project -d`
    1. Run `./bin/bootstrap.sh --help` for the full details.
1. (Optional) If you want to deny access to the database from outside of the `docker-compose` network, remove the `ports` key in the `docker-compose.yml` from the `db` service.
1. (Optional) Run the tests to make sure everything is working with: `bin/rspec .`.
1. You can now try your REST services!

See [Docker docs](./docs/docker.md) for more info

## Dev scripts

This template provides a handful of scripts to make your dev experience better!

- bin/bundle to run any `bundle` commands.
  - `bin/bundle install`
- bin/rails to run any `rails` commands
  - `bin/rails console`
- bin/web to run any `bash` commands
  - `bin/web ls`
- bin/rspec to run specs
  - `bin/rspec .`
- bin/dev to run both Rails and JS build processes at the same time in a single terminal tab.
  - `bin/dev`

You don't have to use these but they are designed to run the same when running with Docker or not.
To illustrate, `bin/rails console` will run the console in the docker container when running with docker and locally when not.
