<h1>Congratulations!</h1>

<p>
    You are viewing a PHP generated page from a docker container,<br>
    containing content (below) from a MySQL database in another docker container,<br>
    that is served by nginx in yet another docker container.
</p>

<h3>Database Content</h3>

<p>Look! Some random data loaded from a linked MySQL docker container:</p>

<ul>
<?php

$dsn = sprintf(
    'mysql:host=%s;port=%d;dbname=dmce',
    $_SERVER['MYSQL_PORT_3306_TCP_ADDR'],
    $_SERVER['MYSQL_PORT_3306_TCP_PORT']
);

$db = new PDO($dsn,'dmce','foobar');
$stmt = $db->prepare('SELECT * FROM `items`;');
$stmt->execute();

while($row = $stmt->fetch(\PDO::FETCH_ASSOC)) {
    echo sprintf('<li>%s (%d)</li>', $row['name'], $row['id']);
}

?>
</ul>