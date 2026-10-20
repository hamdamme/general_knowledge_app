<?php

$envFile = __DIR__ . '/.env';
$localConfig = is_readable($envFile)
    ? parse_ini_file($envFile, false, INI_SCANNER_RAW)
    : [];

if ($localConfig === false) {
    throw new RuntimeException('Unable to read the local database configuration file.');
}

$readConfig = static function (string $key, ?string $default = null) use ($localConfig): ?string {
    $environmentValue = getenv($key);
    if ($environmentValue !== false) {
        return $environmentValue;
    }

    return $localConfig[$key] ?? $default;
};

$database_host = $readConfig('DB_HOST', '127.0.0.1');
$database_user = $readConfig('DB_USER', '');
$database_password = $readConfig('DB_PASSWORD', '');
$database_name = $readConfig('DB_NAME', 'general_knowledge');

if ($database_user === '') {
    throw new RuntimeException('Set DB_USER in .env or the PHP process environment.');
}

try {
    $db = new mysqli($database_host, $database_user, $database_password, $database_name);
    $db->set_charset('utf8mb4');
} catch (mysqli_sql_exception $exception) {
    error_log('Database connection failed: ' . $exception->getMessage());
    http_response_code(500);
    die('Database connection failed. Check the server logs and database configuration.');
}
