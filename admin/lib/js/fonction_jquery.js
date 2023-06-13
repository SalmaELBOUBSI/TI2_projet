$(document).ready(function () {

/* Js POUR voyage.php */
$('#submit').remove();
$('#description').hide();

$('#choix_voyage').change(function () {
    let name = $(this).attr('name');
    let id_voyage = $(this).val(); //on récupère la valeur du <select>, dans name
    console.log("name = " + name + " et id_voyage = " + id_voyage);
    let parametre = 'id_voyage=' + id_voyage;
    let retour = $.ajax({
        type: 'GET',
        data: parametre,
        datatype: 'json',
        url: 'admin/lib/php/ajax/ajaxRechercheVoyage.php',
        success: function (data) {
            console.log(data);
            $('#description').show();
            $('#image').html("<img src='./admin/images/" + data[0].image + "' alt='voyage'>");
            $('#detail').html("Nom : " + data[0].nom_voyage + "<br>Prix : " + data[0].prix +" €"+ "<br>Nombre de jour : " +data[0].nbr_jours  );
        }

    });

});

//tableau éditable voyage
    $("td[contenteditable]").click(function () {
        let valeur1 = $.trim($(this).text());
        let id = $(this).attr("id");
        let name = $(this).attr("name");

        $(this).blur(function () {
            let valeur2 = $.trim($(this).text());
            if (valeur1 != valeur2) {
                //let parametre = "champ=" + name + "&id=" + id + "&valeur=" + valeur2;
                 $.ajax({
                    type: 'GET',
                    data: "champ=" + name + "&id=" +id + "&valeur=" +valeur2,//parametre
                    //dataType: "text",
                    url: "./lib/php/ajax/ajaxEditVoyage.php",
                   success: function (data) {
                        console.log("success");
                    }
                });
            }
        });
    });



    //suppression d'une ligne du tableau éditable voyage
    $(".delete").click(function () {
        if(confirm("Confirmation de supression !")) {
            let id_voyage = $(this).attr("id");

            $.ajax({
                type: "GET",
                data: 'id=' + id_voyage,
                url: "./lib/php/ajax/ajaxDeleteVoyage.php",
                success: () => {
                    let row = $(this).closest("tr");

                    row.css("background-color", "red");
                    row.fadeOut('slow');
                }
            });
        }
    });

});