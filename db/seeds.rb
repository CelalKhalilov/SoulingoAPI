# frozen_string_literal: true

AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = 'password'
  admin.password_confirmation = 'password'
end if Rails.env.development?

Setting.find_or_create_by!(key: 'min_version') do |setting|
  setting.value = '0.0'
end

# Soulingo Sample Data
if Rails.env.development?
  puts 'Creating sample users...'
  user1 = User.find_or_create_by!(email: 'student@example.com') do |user|
    user.password = 'password123'
    user.password_confirmation = 'password123'
    user.display_name = 'John Student'
    user.level = 'A1'
  end

  user2 = User.find_or_create_by!(email: 'advanced@example.com') do |user|
    user.password = 'password123'
    user.password_confirmation = 'password123'
    user.display_name = 'Jane Advanced'
    user.level = 'B2'
  end

  puts 'Creating sample lessons...'
  lesson1 = Lesson.find_or_create_by!(title: 'Introduction to English') do |lesson|
    lesson.description = 'Learn basic English greetings and introductions'
    lesson.level = 'A1'
    lesson.lesson_type = 'Mixed'
  end

  lesson2 = Lesson.find_or_create_by!(title: 'English Grammar Basics') do |lesson|
    lesson.description = 'Understanding basic English grammar rules'
    lesson.level = 'A2'
    lesson.lesson_type = 'Text'
  end

  lesson3 = Lesson.find_or_create_by!(title: 'Business English') do |lesson|
    lesson.description = 'Professional English for business communication'
    lesson.level = 'B2'
    lesson.lesson_type = 'Video'
  end

  puts 'Creating media resources...'
  lesson1.media_resources.find_or_create_by!(url: 'https://example.com/videos/intro-english.mp4') do |media|
    media.media_type = 'Video'
    media.mime_type = 'video/mp4'
  end

  lesson1.media_resources.find_or_create_by!(url: 'https://example.com/images/greetings.jpg') do |media|
    media.media_type = 'Image'
    media.mime_type = 'image/jpeg'
  end

  puts 'Creating vocabulary items...'
  lesson1.vocabulary_items.find_or_create_by!(word: 'hello') do |vocab|
    vocab.meaning = 'a greeting used when meeting someone'
    vocab.example_sentence = 'Hello, how are you today?'
    vocab.part_of_speech = 'interjection'
  end

  lesson1.vocabulary_items.find_or_create_by!(word: 'goodbye') do |vocab|
    vocab.meaning = 'a farewell expression'
    vocab.example_sentence = 'Goodbye, see you tomorrow!'
    vocab.part_of_speech = 'interjection'
  end

  lesson1.vocabulary_items.find_or_create_by!(word: 'thank you') do |vocab|
    vocab.meaning = 'an expression of gratitude'
    vocab.example_sentence = 'Thank you for your help.'
    vocab.part_of_speech = 'interjection'
  end

  puts 'Creating quizzes...'
  lesson1.quizzes.find_or_create_by!(question: 'What is the correct greeting when you meet someone?') do |quiz|
    quiz.options = ['Hello', 'Goodbye', 'Thank you', 'Sorry']
    quiz.correct_index = 0
  end

  lesson1.quizzes.find_or_create_by!(question: 'How do you say farewell in English?') do |quiz|
    quiz.options = ['Hello', 'Goodbye', 'Please', 'Welcome']
    quiz.correct_index = 1
  end

  lesson1.quizzes.find_or_create_by!(question: 'What do you say to express gratitude?') do |quiz|
    quiz.options = ['Sorry', 'Hello', 'Thank you', 'Goodbye']
    quiz.correct_index = 2
  end

  puts 'Creating user progress...'
  UserProgress.find_or_create_by!(user: user1, lesson: lesson1) do |progress|
    progress.completion_percent = 75
    progress.correct_answers = 2
    progress.total_questions = 3
  end

  UserProgress.find_or_create_by!(user: user2, lesson: lesson3) do |progress|
    progress.completion_percent = 100
    progress.correct_answers = 5
    progress.total_questions = 5
  end

  puts 'Sample data created successfully!'
end
