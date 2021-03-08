<?php
    session_start();
    require_once "db/db.php";

    $products = $connect->query("SELECT * FROM products")->fetchAll(PDO::FETCH_ASSOC);
    $categories = $connect->query("SELECT cat FROM categories")->fetchAll(PDO::FETCH_ASSOC);
    $colors = $connect->query("SELECT color FROM colors")->fetchAll(PDO::FETCH_ASSOC);
    $weights = $connect->query("SELECT weight FROM weights")->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Ajax</title>
</head>
<body>
    <div class="container">
        <div class="select">
            <select name="cat" id="cat">
                <option value="all">Все категории</option>
                <?php foreach($categories as $cat): ?>
                <option value="<?=$cat['cat']?>" <?php if($_SESSION['cat'] == $cat['cat']) {echo "selected";}?>><?=$cat['cat']?></option>
                <?php endforeach; ?>

            </select>
            <select name="color" id="color">
                <option value="all">Все цвета</option>
                <?php foreach($colors as $color): ?>
                <option value="<?=$color['color']?>" <?php if($_SESSION['color'] == $color['color']) {echo "selected";}?>><?=$color['color']?></option>
                <?php endforeach; ?>
            </select>
            <select name="weight" id="weight">
                <option value="all">Любой вес</option>
                <?php foreach($weights as $weight): ?>
                <option value="<?=$weight['weight']?>" <?php if($_SESSION['weight'] == $weight['weight']) {echo "selected";}?>><?=$weight['weight']?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="row cards-block">
            <?php foreach($products as $product): ?>
            <?php require_once "actions/query.php"; ?>
            <?php endforeach; ?>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/ajax.js"></script>
</body>
</html>