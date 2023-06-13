<?php
$ds = new DestinationBD($cnx); //$cnx est fourni par l'index
$destination = $ds->getVueAllVilles();
//var_dump($fleur);
$nbr = count($destination);
?>


<div class="album py-5 bg-light">
    <div class="container">

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for ($i = 0; $i < $nbr; $i++) {
                ?>
                <div class="col">
                    <div class="card shadow-sm card-deck">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="50"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"/>
                            <img class="img-fluid" src="./admin/images/<?php print $destination[$i]->image_ville;?>" alt="Voyage"/>
                        </svg>
                        <div class="card-body">
                            <p class="card-text"><?php print $destination[$i]->nom_ville; ?></p>
                            <p class="card-text"><?php print $destination[$i]->id_pays; ?></p>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>

    </div>

