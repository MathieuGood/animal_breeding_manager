<?php

// If user logs out, destroy SESSION
if (isset($_POST['logout'])) {
    $_SESSION['open'] = 0;
    unset($_SESSION['open']);
    unset($_SESSION['user_name']);
    session_destroy();
}
?>

<nav class="navbar navbar-expand-md bg-body-tertiary" id="menu_navbar">
    <div class="container-fluid">
        <span class="navbar-brand">
            <a href="index.php?page=animal_list">
                <img src="images/snake_logo.svg" id="animal_logo" alt="Animal Logo">
            </a>
            Breeding Manager
        </span>
        <button class="navbar-toggler navbar-dark" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <?php
                if (isset($_SESSION['open']) && $_SESSION['open'] > 0) {
                    ?>
                    <li class="nav-item">
                        <a class="nav-link pink_link" aria-current="page" href="index.php?page=animal_list">Animal List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pink_link" href="index.php?page=breed_animals">Breeding</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pink_link" href="index.php?page=animal_list&choice=deceased">Deceased animals</a>
                    </li>
                    <li class="nav-item">
                        <form method="POST" action="">
                            <input class="btn btn-primary" type="submit" name="logout" value="Logout">
                        </form>
                    </li>

                    <?php
                }
                ?>

            </ul>
        </div>
    </div>
</nav>



<script src="scripts/menu_scripts.js"></script>