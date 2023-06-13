<?php
if(isset($_POST['connexion'])){
    $admin = new AdminBD($cnx); // $cnx est dans l'index
    $adm = $admin->isAdmin($_POST['login'],$_POST['password']);
    if($adm == 1){
        $_SESSION['admin'] = 1;
        print '<meta http-equiv="refresh": content="0;url=./admin/index_.php">';
    }else {
        print "Accès réservé";
    }
}
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header bg-secondary text-white">
                    Connexion
                </div>
                <div class="card-body bg-light">
                    <form action="<?php print $_SERVER['PHP_SELF'];?>" method="post">
                        <div class="mb-3">
                            <label for="login" class="form-label">Login</label>
                            <input type="text" class="form-control" id="login" name="login">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Mot de passe</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" name="connexion" class="btn btn-primary">Se connecter</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
