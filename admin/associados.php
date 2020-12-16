<?php
require_once 'users/init.php';
if (!securePage($_SERVER['PHP_SELF'])) {
  die();
}
$hooks =  getMyHooks();
includeHook($hooks, 'pre');
require_once 'header.php';


$db = DB::getInstance();
?>

<!-- End Navbar -->
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-info">
            <h4 class="card-title">Associados</h4>
            <p class="card-category">
              <a href="novo-conteudo.php" class="btn btn-primary btn-sm">Novo</a>
            </p>
          </div>
          <div class="card-body">
            ---------------------------

            <?php
            // $db = DB::getInstance();
            // $associados = $db->query("
            //     SELECT * from associados 
            //  ")->results();

            // //  dump($associados);

            // foreach ($associados as $assossiado) {

            //   // $metas = $db->query("
            //   //     SELECT * from wp_postmeta where post_id = " . $assossiado->ID)->results();

            //   // $campos   = "";
            //   // $valores  = "";
            //   // // echo "<br>Empresa : {$assossiado->post_title}<br>";

            //   // foreach ($metas as $field) {

            //   //   if (substr($field->meta_key, 0, 1) !== "_") {

            //   //     if (
            //   //       // ($field->meta_key == 'segmento') ||
            //   //       ($field->meta_key == 'local') ||
            //   //       ($field->meta_key == 'url') ||
            //   //       ($field->meta_key == 'logotipo') ||
            //   //       ($field->meta_key == 'descricao') ||
            //   //       ($field->meta_key == 'telefone') ||
            //   //       ($field->meta_key == 'email') ||
            //   //       ($field->meta_key == 'endereco')
            //   //     ) {
            //   //       // echo $field->meta_key ." = ". $field->meta_value;
            //   //       $campos = $campos. ",".$field->meta_key; 
            //   //       $valores = $valores. ",'".$field->meta_value."'"; 

            //   //       // $fields = array(
            //   //       //   $field->meta_key => $field->meta_value                      
            //   //       // );    
            //   //       // array_push($campos,$fields);
            //   //       // array_splice($campos, -1, 1, array($field->meta_key, $field->meta_value));
            //   //     }
            //   //   }



            //   //   // $input = array("red", "green", "blue", "yellow");
            //   //   //  $campos = array_pop([$field->meta_key => $field->meta_value]);


            //   // }


            //   // // dump($campos);
            //   // // echo "<h3>";
            //   // // $query  = "INSERT INTO associados (nome,"  . ltrim(  $campos , ",") . ") values " . "( '".$assossiado->post_title ."',  " .  ltrim(  $valores , "," ) . ")";
            //   // //  echo $query . ";";
            //   // //  echo "<br>";
            //   // echo "<br>" . $result = $db->query($query);

            //   // echo $assossiado->post_title ." inserido com sucesso <br>";              
            //   // die();
            // }





            ?>



            -------------------------------------

            <div class="table-responsive">
              <table class="table">
                <thead class=" text-primary">
                  <th>Nome</th>
                  <!-- <th>Site</th> -->
                  <th>Telefone</th>
                  <th>Endereço e Número</th>
                  <th>Cidade e Estado</th>
                  <th>Logo</th>
                </thead>
                <tbody>
                  <?php

                  $associados = $db->query(" select * from associados ")->results();
                  foreach ($associados as $associado) {
                  ?>


                    <tr>
                      <td><b><?=$associado->nome ?></b></td>
                      <!-- <td><?=$associado->url ?></td>                       -->
                      <td><?=$associado->telefone ?></td>
                      <td><?=$associado->endereco ?></td>
                      <td><?=$associado->local ?></td>
                      <td></td>
                      <!-- <td><img src="assets/img/pci-power.jpg" alt=""></td> -->
                      <td><a href="editar-associados.php?id=<?=$associado->id ?>" class="btn btn-info btn-sm ">Editar</a></td>
                      <td><a href="#" class="btn btn-danger btn-sm ">Excluir</a></td>
                    </tr>
                  <?php }; ?>

                </tbody>
              </table>
            </div>
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