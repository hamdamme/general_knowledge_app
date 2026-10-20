# General Knowledge Game

A browser-based trivia game built with PHP, MySQL, JavaScript, and CSS. Create an account, choose a question category, and earn points for correct answers.

## Features

- Account registration and sign-in
- Category-based questions with point values
- Score tracking and a game timer
- A reset-score action
- Responsive login and game screens

## Requirements

- PHP 8.1 or newer with the MySQLi extension
- MySQL 8.0 or MariaDB 10.6 or newer
- A PHP web server such as Apache, Nginx with PHP-FPM, or PHP's built-in server
- `mysqlnd` enabled for MySQLi's `get_result()` method

## Run locally

1. Clone the repository and enter the project directory:

   ```sh
   git clone https://github.com/hamdamme/general_knowledge_app.git
   cd general_knowledge_app
   ```

2. Create a MySQL database and load the starter schema and questions:

   ```sh
   mysql -u root -p -e "CREATE DATABASE general_knowledge CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
   mysql -u root -p general_knowledge < database/schema.sql
   ```

3. Create a local database configuration file:

   ```sh
   cp .env.example .env
   ```

   Edit `.env` with your MySQL connection details. For production, provide the same `DB_*` settings through the PHP process environment.

4. Start the PHP development server:

   ```sh
   php -S 127.0.0.1:8000
   ```

5. Open [http://127.0.0.1:8000/login.php](http://127.0.0.1:8000/login.php), register an account, and start playing.

## Database

[database/schema.sql](database/schema.sql) creates the tables required by the application and inserts three example questions. Add rows to `j_category`, `j_value`, and `j_question` to expand the game.

## Configuration

The application reads these settings from `.env` during local development or from the PHP process environment in production:

| Variable | Description | Default |
| --- | --- | --- |
| `DB_HOST` | MySQL server host | `127.0.0.1` |
| `DB_USER` | MySQL username | Required |
| `DB_PASSWORD` | MySQL password | Empty string |
| `DB_NAME` | Database name | `general_knowledge` |

Never commit `.env` or production credentials.

## Project layout

```text
.
├── database/
│   └── schema.sql
├── database.php       # MySQL connection
├── game.php           # JSON endpoints for game actions
├── game.js            # Browser game behavior
├── login.php          # Registration and sign-in
├── mainboard.php      # Authenticated game screen
├── mainBoard.css      # Game screen styles
├── reset_game.php     # Score reset endpoint
└── style.css          # Login screen styles
```

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a change. To report a vulnerability, follow [SECURITY.md](SECURITY.md).

## License

This project is licensed under the [MIT License](LICENSE).
