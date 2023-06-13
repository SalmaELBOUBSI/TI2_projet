
<form class="form_login container" method="get" action="<?php print $_SERVER['PHP_SELF'];?>">
    <div class="row mb-3">
        <label for="" class="col-sm-2 col-form-label">Voyage : </label>
        <div class="col-sm-10">
            <input type="text" name="nom_voyage" class="form-control" id="nom_voyage"><div id="verif"></div>
        </div>
    </div>
    <div class="row mb-3">
        <label for="" class="col-sm-2 col-form-label">Description : </label>
        <div class="col-sm-10">
            <input type="text" name="description" class="form-control" id="description">
        </div>
    </div>
    <div class="row mb-3">
        <label for="" class="col-sm-2 col-form-label">Prix :
        </label>
        <div class="col-sm-10">
            <input type="text" name="prix" class="form-control" id="prix">
        </div>
    </div>
    <div class="row mb-3">
        <label for="" class="col-sm-2 col-form-label">Nombre de jours : </label>
        <div class="col-sm-10">
            <input type="text" name="nbr_jours" class="form-control" id="nbr_jours"><div id="verif"></div>
        </div>
        <div class="col-12">
            <input type="hidden" name="id_voyage" id="id_voyage">
            <button type="submit" class="btn btn-primary" id="texte_submit" name="editer">Ajouter</button>
        </div>
</form>
