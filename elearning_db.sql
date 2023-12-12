-- Create a database
CREATE DATABASE IF NOT EXISTS elearning_db;
USE elearning_db;

-- Table for storing user information
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    country VARCHAR(100),
    bio TEXT,
    profile_image_url VARCHAR(255),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Table for storing user roles
CREATE TABLE IF NOT EXISTS user_roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Table for associating users with roles
CREATE TABLE IF NOT EXISTS user_role_associations (
    association_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    role_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (role_id) REFERENCES user_roles(role_id)
);

-- Table for storing course information
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

-- Table for storing module information within courses
CREATE TABLE IF NOT EXISTS course_modules (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    module_name VARCHAR(255) NOT NULL,
    module_description TEXT,
    module_order INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    video_url VARCHAR(255),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing user subscriptions
CREATE TABLE IF NOT EXISTS user_subscriptions (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    subscription_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiration_date TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing user progress in courses
CREATE TABLE IF NOT EXISTS user_progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    progress_percentage INT,
    completed BOOLEAN DEFAULT FALSE,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing user quiz attempts
CREATE TABLE IF NOT EXISTS user_quiz_attempts (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    module_id INT,
    score INT,
    time_taken INT,
    attempt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (module_id) REFERENCES course_modules(module_id)
);

-- Table for storing forum discussions
CREATE TABLE IF NOT EXISTS forum_discussions (
    discussion_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    discussion_title VARCHAR(255) NOT NULL,
    discussion_content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing replies to forum discussions
CREATE TABLE IF NOT EXISTS discussion_replies (
    reply_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    discussion_id INT,
    reply_content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (discussion_id) REFERENCES forum_discussions(discussion_id)
);
show tables from elearning_db;
