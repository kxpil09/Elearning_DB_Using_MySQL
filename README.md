# E-Learning Platform Database Schema

This repository contains the SQL script for creating the database schema of an e-learning platform. The database is designed to manage user information, courses, user subscriptions, course modules, user progress, forum discussions, and more.

## Database Tables

1. **users:**
   - Stores information about users, including username, email, password, personal details, and registration date.

2. **user_roles:**
   - Defines various roles that users can have.

3. **user_role_associations:**
   - Associates users with roles.

4. **courses:**
   - Represents information about courses, including the course name, description, creation date, and instructor.

5. **course_modules:**
   - Contains details about modules within courses, including module name, description, order, creation date, video URL, and references to the associated course.

6. **user_subscriptions:**
   - Manages user subscriptions to courses, including subscription dates, expiration dates, and references to users and courses.

7. **user_progress:**
   - Tracks user progress in courses, recording completion percentage and last update timestamps.

8. **user_quiz_attempts:**
   - Stores user attempts at quizzes, including the user ID, module ID, score, time taken, and attempt date.

9. **forum_discussions:**
   - Facilitates forum discussions related to courses, recording user ID, course ID, discussion title, content, and creation date.

10. **discussion_replies:**
    - Stores replies to forum discussions, including user ID, discussion ID, reply content, and creation date.

## Usage

1. Create a MySQL database named `elearning_db`.
2. Copy and execute the provided SQL script in your MySQL environment.

## Note

- Adjust the script based on specific requirements.
- Ensure proper configuration of foreign key relationships.

Feel free to customize and extend the schema to suit your specific needs. If you encounter any issues or have suggestions for improvements, feel free to contribute!
