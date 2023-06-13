<?php
$vg = new VoyageBD($cnx);
$voyage = $vg->getVueAllVoyages();
$nbr = count($voyage);

?>
<div class="subdivision">
    <div class="subdiv1">
        <br>
        <p>
        <input class="form-control" id="filtre" type="text" placeholder="Filtrer"><br/>
        </p>
        <a class="btn btn-primary mb-2" href="index_.php?page=ajout_voyage.php">Ajouter Voyage</a>
        <div id="nouveau_td"></div>
        <table class="table table-striped table-hover" id="tableau_voyages">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Voyage</th>
                <th scope="col">Description</th>
                <th scope="col">Prix</th>
                <th scope="col">Jours</th>
                <th scope="col">Ville</th>
                <th scope="col">Image</th>

            </tr>
            </thead>
            <tbody  id="table_voyages">
            <form method="get">
            <?php

            for ($i = 0; $i < $nbr; $i++) {
                ?>

                <tr id="<?php print $voyage[$i]->id_voyage;?>">
                    <th scope="row"><?php print $voyage[$i]->id_voyage; ?></th>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="voyage"><?php print $voyage[$i]->nom_voyage; ?></td>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="description"><?php print $voyage[$i]->description; ?></td>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="prix"><?php print $voyage[$i]->prix; ?> €</td>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="jours"><?php print $voyage[$i]->nbr_jours; ?></td>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="jours"><?php print $voyage[$i]->id_ville; ?></td>
                    <td contenteditable="true" id="<?php print $voyage[$i]->id_voyage; ?>"
                        name="image"><?php print $voyage[$i]->image; ?></td>
                    <td><img class="delete" src="./images/delete.jpg" alt="delete" id="<?php print $voyage[$i]->id_voyage; ?>"></td>
                </tr>
                <?php
            }
            ?>
            </form>
            </tbody>
        </table>
    </div>
    <div class="subdiv2">
        <span id="illustration"></span>
    </div>
</div>



