<?php
require_once 'users/init.php';
if (!securePage($_SERVER['PHP_SELF'])) {
  die();
}

$hooks =  getMyHooks();
includeHook($hooks, 'pre');
require_once 'header.php';
$db = DB::getInstance();

$boolUpdate = false;
$btnSalvar = "";
$id_conteudo = 0;

// dump($_FILES);

//Note: This resolves as true even if all $_POST values are empty strings
if (!empty($_POST)) {

  if (!empty($_FILES)) {

    // dump($_FILES);
    // UPLOAD ###############################################
    $token = bin2hex(random_bytes(20));
    // Nas versões do PHP que antecedem a versão 4.1.0, é preciso usar o $HTTP_POST_FILES em vez do $_FILES.    
    $uploaddir = 'upload/';
    $nomeArquivo = basename($_FILES['fileToUpload']['name']);
    $ext = pathinfo($nomeArquivo, PATHINFO_EXTENSION);
    $uploadfile   = $uploaddir . $token . "." . $ext;
    $boolUpload = false;
    $arquivofisico = "img-padrao-post.jpg";

    if (move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $uploadfile)) {
      // echo "O arquivo é valido e foi carregado com sucesso.\n";
      // echo "result : " . $insert = $db->insert("arquivos", $fields);
      //  $insert = $db->insert("arquivos", $fields);
      $arquivofisico = $token . "." . $ext;
      logger($user->data()->id, "Upload", $user->data()->fname . " fez um novo upload, com o nome de " . $nomeArquivo);
      // $boolUpload = true;


    } else {
      // $boolUpload = false;
      // $arquivofisico = "img-padrao-post.jpg" ;
      logger($user->data()->id, "Upload", $user->data()->fname . " Ocorreu um erro ao tentar fazer um novo upload");
      // echo "Algo está errado aqui!\n";
    }


    // echo $uploadfile;
    // echo $arquivofisico;
  }



  // echo "post";
  // die();

  // UPLOAD ###############################################
  if (!empty($_GET["id"])) {

    // echo "Post com update <br>";
    // $boolUpdate = true;
    // echo $result =   $db->query("
    // update conteudos set content = '" .
    //   $_POST["area2"] . "' where id = " . $_GET["id"])->results();


    $fields = array(
      'title'                 => $_POST["titulo"],
      'content'               => $_POST["area2"],
      'type'                  => $_POST["sessao"],
      'status'                => "Publicado",
      'date-modified'         => date('Y-m-d H:i:s'),
      'user_id'               => $user->data()->id
      // 'user_id'             => $categoria,
      // 'nome'                  => $nomeArquivo,
      // 'criado_em'             => date('Y-m-d H:i:s')
    );

    if (!empty($_FILES)) {
      $fields['img'] = $arquivofisico;
    }

    // dump($fields);
    // die();

    $id_conteudo = $_GET["id"];

    echo $result = $db->update('conteudos', $_GET["id"], $fields);
  } else {

    $fields = array(
      'title'                 => $_POST["titulo"],
      'content'               => $_POST["area2"],
      'type'                  => $_POST["sessao"],
      'status'                => "Publicado",
      'img'                   => $arquivofisico,
      'date-created'          => date('Y-m-d H:i:s'),
      'user_id'               => $user->data()->id
      // 'user_id'             => $categoria,
      // 'nome'                  => $nomeArquivo,
      // 'criado_em'             => date('Y-m-d H:i:s')
    );

    $result =  $insert = $db->insert("conteudos", $fields);

    $id_conteudo = $db->query("SELECT max(id) as id FROM conteudos")->results()[0]->id;

    // echo $id_conteudo->id;
    // echo ":: " . dump($db);
    logger($user->data()->id, "Conteudo Criado ", $user->data()->fname . "
         criou um novo conteudo com o Titulo  " . $_POST["titulo"]);
  }




  // echo "Post <br>";
}

//Note: This resolves as true even if all $_POST values are empty strings
if (!empty($_GET)) {

  // echo "get";
  $conteudo = $db->query("select * from conteudos where id = " . $_GET["id"])->results()[0];
  $boolUpdate = true;
}

if ($boolUpdate) {
  $titulo = $conteudo->title;
  $conteudoFull = $conteudo->content;
  $btnSalvar = "Salvar";
  $selectType = $conteudo->type;
} else {
  $titulo = "";
  $conteudoFull = "";
  $btnSalvar = "Incluir";
  $selectType = "";
}


?>


<!-- End Navbar -->
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-info">
            <h3 class="card-title"><?= $btnSalvar ?> Conteúdo</h3>
            <p class="card-category">
            </p>
          </div>
          <div class="card-body">


            <?php
            // dump($_POST);
            //Controle de tela Novo ou edicao (Post ou get)
            if ($boolUpdate) {
            ?>
              <form enctype="multipart/form-data" action="conteudo.php?id=<?= $_GET["id"] ?>" method="post" name="form-content">
              <?php
            } else {
              ?>
                <form enctype="multipart/form-data" action="conteudo.php" method="post" name="form-content">

                <?php
              }
                ?>
                <div class="form-row">
                  <div class="col-md-8 mb-3">
                    <label for="validationDefaultUsername"><b> Titulo</b></label>
                    <div class="input-group">
                      <!-- <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend2"></span>
                    </div> -->
                      <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o titulo do Conteúdo" aria-describedby="inputGroupPrepend2" required value="<?= $titulo ?>">
                    </div>
                  </div>
                </div>
                <div class="form-row">

                  <div class="col-md-4 mb-3">
                    <label for="validationDefault01"><b> Sessão no Site</b></label>


                    <div class="form-group">
                      <select class="custom-select" name="sessao" id="sessao" required>
                        <option <?= $selectType == "" ? " selected " : " " ?> value="">Selecione a sessão do conteúdo</option>
                        <option <?= $selectType == "1" ? " selected " : " " ?>value="1">Blog da Afrac</option>
                        <option <?= $selectType == "2" ? " selected " : " " ?>value="2">Vitrine do Mercado</option>
                        <option <?= $selectType == "3" ? " selected " : " " ?>value="3">Meios de pagamento</option>
                        <option <?= $selectType == "4" ? " selected " : " " ?>value="4">Video (Historico de Lives)</option>
                      </select>
                      <!-- <div class="invalid-feedback">Example invalid custom select feedback</div> -->
                    </div>

                  </div>



                  <script src='https://cloud.tinymce.com/stable/tinymce.min.js'></script>
                  <script>
                    tinymce.init({
                      selector: '#area2', // change this value according to your HTML
                      plugins: 'code'

                    });
                  </script>

                  <!-- <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
                  <script type="text/javascript">
                    bkLib.onDomLoaded(nicEditors.allTextAreas);






                  </script> -->

                  <!-- <div class="col-md-4 mb-3">
      <label for="validationDefault02">Last name</label>
      <input type="text" class="form-control" id="validationDefault02" placeholder="Last name" value="Otto" required>
    </div> -->
                </div>
                <div class="form-row">
                  <div class="col-md-12 mb-6">
                    <div class="form-group">
                      <label for="exampleFormControlTextarea1"><b> Conteúdo</b> </label>
                      <!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="15"></textarea> -->


                      <textarea name="area2" id="area2" rows="15" style="width: 100%;">
                    <?= $conteudoFull ?>
                    </textarea>

                    </div>

                  </div>
                </div>


                <input id="fileToUpload" name="fileToUpload" type="file" />
                <br>
                <br>
                <h2>Imagem de destaque</h2>
                <?php
                // if($conteudo->img <> ""){

                //   echo "<img src='upload/".$conteudo->img . "' />";

                // }

                ?>
                <br>
                <br>








                <a href="conteudos.php" class="btn btn-warning" type="submit">Cancelar</a>
                <button class="btn btn-primary" type="submit"><?= $btnSalvar ?> </button>
                </form>


          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- footer -->
<?php require_once 'footer.php'; ?>

<!-- Modal -->
<div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="mailModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h6 class="modal-title" id="mailModalLabel">Enviar acesso ao arquivo por email</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
          </span>
        </button>
      </div>
      <div class="modal-body">

        <div class="row">
          <div class="col-md-12">
            <div class="form-group bmd-form-group">
              <label class="bmd-label-floating">Digite o email que deseja enviar o link </label>
              <!-- <input type="text" id="evento" name="evento" class="form-control"> -->
              <input type="text" class="form-control" name="txtEmail" id="txtEmail" value="">
              <input type="hidden" name="data-id" id="data-id" value="" />
            </div>
          </div>

        </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-round " data-dismiss="modal">Fechar</button>
        <button id="btnLoadEnabled" type="button" class="btn btn-info btn-round enviar ">Gerar & Enviar Link </button>
        <button class="btn btn-success" id="btnLoad" disabled style="display: none;">
          <i class="fa fa-circle-o-notch fa-spin"></i>
          Enviando...
        </button>


      </div>
    </div>
  </div>
</div>

<!-- <script src="https://cdn.tiny.cloud/1/3pi35req66retm9019lz3n0re5yqv3c5rmrbv9r10cdbaphl/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> -->


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  $(document).ready(function() {
    $("#name").on('change', function() {
      $(".data").hide();
      $("#" + $(this).val()).fadeIn(700);
    }).change();
  });
</script> -->

<script>
  function submit() {

    $('form#form-content').submit();


  }
</script>