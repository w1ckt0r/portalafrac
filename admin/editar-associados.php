<?php
require_once 'users/init.php';
if (!securePage($_SERVER['PHP_SELF'])) {
  die();
}
$hooks =  getMyHooks();
includeHook($hooks, 'pre');
require_once 'header.php';
?>

<!-- End Navbar -->
<div class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header card-header-info">
            <h4 class="card-title">Conteudos</h4>
            <p class="card-category">
            </p>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
                <thead class=" text-primary">

                  <form class="form-horizontal">
                    <fieldset>

                      <!-- Form Name -->
                      <legend>Associados</legend>

                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textarea"></label>
                        <div class="col-md-4">
                          <textarea class="form-control" id="textarea" name="textarea" placeholder="Nome"></textarea>
                        </div>
                      </div>
                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textarea"></label>
                        <div class="col-md-4">
                          <textarea class="form-control" id="textarea" name="textarea" placeholder="Site"></textarea>
                        </div>
                      </div>

                    </fieldset>
                  </form>

                  <form class="form-horizontal">

                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textarea"></label>
                      <div class="col-md-4">
                        <textarea class="form-control" id="textarea" name="textarea" placeholder="Telefone"></textarea>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textarea"></label>
                      <div class="col-md-4">
                        <textarea class="form-control" id="textarea" name="textarea" placeholder="Endereço e Número"></textarea>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-md-4 control-label" for="textarea"></label>
                      <div class="col-md-4">
                        <textarea class="form-control" id="textarea" name="textarea" placeholder="Cidade e Estado"></textarea>
                      </div>
                    </div>

                    </fieldset>
                    <fieldset>

                      <!-- Form Name -->
                      <legend>Logo</legend>

                      <!-- Text input-->
                      <div class="form-group">
                        <label class="col-md-4 control-label" for="textarea"></label>
                        <div class="col-md-4">
                          <textarea class="form-control" id="textarea" name="textarea" placeholder="Link da imagem"></textarea>
                        </div>

                        <br>
                        <h4>Preview</h4>
                        <img src="assets/img/no-image.png" alt="">

                      </div>

                    </fieldset>
                  </form>
                  <form class="form-horizontal">

                  </form>


                </thead>
                <tbody>
                  <?php
                  $db = DB::getInstance();
                  $files = $db->query("select * from conteudos where id = " . $_GET["id"])->results();
                  foreach ($files as $file) {
                  ?>
                    <tr>
                      <td><?= $file->nome ?></td>
                      <td><?php echo date('d-m-Y', strtotime($file->data_envio)); ?></td>
                      <td><?= $file->categoria ?></td>
                      <td class="text-primary"><?= $file->downloads ?></td>
                      <td>
                        <a href="files-proccess.php?action=xdownload&id=<?= $file->id ?>   " class="btn btn-outline-info btn-sm x-download  btn-round" data-id="<?= $file->id ?>"> <span class="material-icons">
                            cloud_download
                          </span> </a>

                        <a href="" data-toggle="modal" data-target="#mailModal" class=" btn btn-outline-info btn-sm x-enviar   btn-round" data-id="<?= $file->id ?>"> <span class="material-icons">
                            mail
                          </span> </a>

                        <a href="" class="btn  btn-outline-danger btn-sm delete   btn-round" data-id="<?= $file->id ?>"> <span class="material-icons">
                            delete_forever
                          </span> </a>
                      </td>
                    </tr>

                  <?php }; ?>
                  <tr>
              
                  <a style="position: relative;" href="conteudos.php" class="btn btn-info btn-bg ">Confirmar</a>
              
                </tr>
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

<script src="https://cdn.tiny.cloud/1/3pi35req66retm9019lz3n0re5yqv3c5rmrbv9r10cdbaphl/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>