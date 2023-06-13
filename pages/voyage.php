<?php
$vl = new VoyageBD($cnx);
$voyage = $vl->getVueAllVoyages();
$nbr = count($voyage);

?>
<div class="form-container">
<form method="get" action="<?php print $_SERVER['PHP_SELF'];?>">
    <select name="choix_voyage" id="choix_voyage">
        <option value="">Selectionnez votre voyage</option>
        <?php
        for($i=0;$i<$nbr;$i++){
            ?>
            <option value="<?php print $voyage[$i]->id_voyage;?>"><?php print $voyage[$i]->nom_voyage;?></option>
            <?php
        }
        ?>
    </select>&nbsp;&nbsp;
    <input type="submit" name="submit" id="submit" value="Description" class="btn btn-success">
</form>
</div>

<p>&nbsp;</p>
<div class="card mb-3" style="max-width: 540px;" id="description">
    <div class="row g-0">
        <div class="col-md-6" id="image">

        </div>
        <div class="col-md-6">
            <div class="card-body">
                <p class="card-text" id="detail"></p>
            </div>
        </div>
    </div>
</div>