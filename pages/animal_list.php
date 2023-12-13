<?php
// If the user is logged in
if (isset($_SESSION['open']) && $_SESSION['open'] > 0) {

    // If $_GET['choice'] exists and is equal to 'deceased', 
    if (isset($_GET['choice']) && $_GET['choice'] == 'deceased') {
        $_SESSION['alive'] = false;
        $title = 'Deceased animals list';
    } else {
        $_SESSION['alive'] = true;
        $title = 'Animal list';
    }

    // On page load, reset all filters, sorting and pagination stored in $_SESSION
    include('components/reset_search_parameters.php');

    // Instantiate new Animal object
    $animal = new Animal();

    if (isset($_POST['random_animal'])) {
        $animal->createRandomAnimal($_POST['amount_to_create']);
    }
    ?>

    <h3>
        <?php echo $title ?>
    </h3>

    <div class="page-content d-flex flex-column justify-content-center">

        <div class="container row top-part">

            <?php

            if ($_SESSION['alive'] == true) {
                ?>

                <div class="create_animal col-sm-auto">

                    <input class="btn btn-primary" style="width:100%; margin:0.3em 0 0.5em 0;" type="button"
                        onclick="window.location.href='index.php?page=edit_animal&choice=new'"
                        value="Add new custom <?php echo $_SESSION['animal_specie'] ?>">

                    <span class="create_multiple_animals">

                        <form id="create_multiple_animals" method="POST" action="">

                            <input type=number step="1" min="1" max="1000" name="amount_to_create" value="1">
                            <input class="btn btn-primary" style="width:auto; margin:0" type="submit" name="random_animal"
                                value="Create random <?php echo $_SESSION['animal_specie_plural'] ?> ">

                        </form>

                    </span>

                </div>
                <?php
            }
            ?>

            <div class="snake_count col-sm-auto">
                <?php

                // Display the total number of animals
                $sex_count = $animal->countAllAnimalsBySex($_SESSION['alive']);

                if ($sex_count != []) {

                    if (!isset($sex_count[0]['count'])) {
                        $male_count = 0;
                    } else {
                        $male_count = $sex_count[0]['count'];
                    }
                    if (!isset($sex_count[1]['count'])) {
                        $female_count = 0;
                    } else {
                        $female_count = $sex_count[1]['count'];
                    }
                } else {
                    $male_count = 0;
                    $female_count = 0;
                }

                $total_count = $male_count + $female_count;

                ?>
                <h6>
                    <?php echo ucfirst($_SESSION['animal_specie']) . " total count : " . $total_count; ?>
                </h6>

                <h6>
                    Male :
                    <?php echo $male_count ?>
                </h6>

                <h6>
                    Female :
                    <?php echo $female_count ?>
                </h6>

            </div>


        </div>

        <span class="pt-2">
            <!-- Name filter -->
            <input type="text" name="name_filter" id="name_filter" placeholder="Name search">

        </span>

        <div id="animal_list">

            <script>
                // When the page loads, execute sortAnimalList() with 'animal_id DESC' as default parameter 
                window.onload = function () {
                    resetSearchParameters();
                }


                // Name search filter
                var name_filter_input = document.getElementById("name_filter")
                name_filter_input.addEventListener("keyup", () => {
                    filterAnimalListByName(name_filter_input.value)
                })



                // Set all the parameters stored in SESSION to default
                function resetSearchParameters() {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            sort: 'id_animal DESC',
                            breed_filter: '',
                            sex_filter: '',
                            name_filter: '',
                            current_page: '1',
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                            name_filter_input.value = ""
                        }
                    });
                }


                function createRandomAnimalsAndUpdateList(number) {
                    $.ajax({
                        type: "POST",
                        url: "components/create_random_animal.php",
                        data: {
                            amount_to_create: number,
                        },
                        // If the ajax query returns a success, update the table
                        success: resetSearchParameters()
                    });
                }


                // AJAX function for sorting
                function sortAnimalList(type) {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            sort: type,
                            current_page: '1',
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                            trigger_listener = true
                        }
                    });
                }


                // AJAX function for filtering by name
                function filterAnimalListByName(type) {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            name_filter: type,
                            current_page: '1',
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                        }
                    });
                }


                // AJAX function for filtering by breed
                function filterAnimalListByBreed(type) {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            breed_filter: type,
                            current_page: '1',
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                        }
                    });
                }


                // AJAX function for filtering by sex
                function filterAnimalListBySex(type) {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            sex_filter: type,
                            current_page: '1',
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                        }
                    });
                }


                // When the user clicks on the button, navigate to input current_page number
                function pageAnimalList(page_number) {
                    $.ajax({
                        type: "POST",
                        url: "components/update_animal_list.php",
                        data: {
                            current_page: page_number,
                        },
                        // If the ajax query returns a success, update the table
                        success: function (data) {
                            let animal_list_table = document.getElementById("animal_list");
                            animal_list_table.innerHTML = data;
                        }
                    });
                }

            </script>
            <?php
} else {
    // If the user is not logged in, redirect to login page
    header("Location: index.php?page=login");
}
?>