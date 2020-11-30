<?php

require_once dirname(__FILE__) . "/../portalafrac/admin/users/init.php";
// require("admin/users/init.php");
require("header.php");
$db = DB::getInstance();

// UPLOAD ###############################################
if (!empty($_GET["id"])) {
    $id_conteudo = $_GET["id"];

    $conteudo = $db->query("select * from conteudos where id=".$id_conteudo)->results();
    // dump( $conteudo );
} else {
    echo "Noticia não existe";
    die();
}
?>

<!-- <section class="engine"> <a href="#">portfolio site templates</a></section> -->



<nav class="navbar  navbar-expand-sm navbar-dark bg-dark" style="background-color: #04112b !important;padding-bottom:0% ">
    <!-- <button class="navbar-toggler" data-toggle="collapse" data-target=".navbars">
        <span class="navbar-toggler-icon"></span>
    </button> -->
    <div class="collapse navbar-collapse navbars" id="collapse_target1">
        <ul class="navbar-nav mx-auto">
            <li class="nav-item-second" style=" background-color: #ececec; border-radius:20px 20px 0 0">
                <a class="nav-link" href="blog.php" id="menu-blog">
                    <p class="mbr-fonts-style  display-6" style="color: #04112b;"> Blog AFRAC</p>
                </a>
            </li>
            <li class="nav-item-second">
                <a class="nav-link" href="vitrine.php" id="menu-blog">
                    <p class="mbr-fonts-style display-6" style="color: white;"> Vitrine de Mercado</p>
                </a>
            </li>
            <li class="nav-item-second">
                <a class="nav-link" href="meios-pagamento.php" id="menu-blog">
                    <p class="mbr-fonts-style display-6" style="color: white;"> Meios de Pagamento</p>
                </a>
            </li>

        </ul>
    </div>
</nav>



<section class="features3 cid-s8Hb30IPX6" id="features3-1f" style="padding: 0 6%;">
    <div class="container">
        <div class="media-container-row">


            <?php

            $countRow = 0;

            foreach ($conteudo as $content) {
            
            ?>

                <div class="card p-12 col-12 col-md-12 col-sm-12">
                    <div class="card-wrapper">
                        <!-- <div class="card-img">
                            <img src="admin/upload/<?= $content->img ?>" style="width: 50%;">
                        </div> -->
                        <div class="card-box">
                            <br>
                            


                            <!-- <a href="#"> -->
                                <p  class="card-title mbr-fonts-style mbr-bold display-2">
                                <h1 style="text-align: center !important;">
                                <strong>
                                    <?php echo $content->title; ?>
                                </strong>

                                </h1>   
                                </p>
                            <!-- </a> -->
                            <p class="mbr-text mbr-fonts-style display-7">
                                <?php // echo substr(strip_tags($content->content), 0, 300); ?>
                                <?php echo $content->content; ?>

                            </p>
                        </div>
                    </div>
                </div>

            <?php


            }
            ?>


        </div>
    </div>

</section>



<?php 
    // $id_conteudo = $_GET["id"];
    $views = $conteudo[0]->views + 1;
    $db->query("update conteudos set views = ".$views." where id=".$id_conteudo);
?>

<?php require("footer.php"); ?>