# General Knowledge Game

A browser-based trivia game built with PHP, MySQL, JavaScript, and CSS. Players can register, sign in, choose a category, answer questions, and track their score.

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

## Quick start

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

   Edit `.env` and set the database host, name, username, and password. The application reads this file locally; production deployments should set the same `DB_*` values in the PHP process environment.

4. Start the PHP development server:

   ```sh
   php -S 127.0.0.1:8000
   ```

5. Open [http://127.0.0.1:8000/login.php](http://127.0.0.1:8000/login.php), register an account, and start playing.

## Database

The starter schema is in [database/schema.sql](database/schema.sql). It creates the tables used by the application and inserts a small set of example questions. Add categories, point values, and questions to the `j_category`, `j_value`, and `j_question` tables to customize the game.

## Configuration

The application reads these settings from a local `.env` file or environment variables:

| Variable | Description | Default |
| --- | --- | --- |
| `DB_HOST` | MySQL server host | `127.0.0.1` |
| `DB_USER` | MySQL username | none |
| `DB_PASSWORD` | MySQL password | empty |
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

See [CONTRIBUTING.md](CONTRIBUTING.md) for local setup and contribution expectations. Please report security issues privately; see [SECURITY.md](SECURITY.md).

## License

No license has been added yet. Until the project owner chooses one, standard copyright applies and reuse is not granted by this repository.
