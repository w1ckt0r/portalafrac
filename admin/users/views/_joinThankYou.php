<?php
/*
This is a user-facing page
UserSpice 5
An Open Source PHP User Management System
by the UserSpice Team at http://UserSpice.com

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
?>

<div class="row card ">
  <div class="col-sm-12">
    <!-- <h1><?=lang("JOIN_SUC")?><?=$settings->site_name?></h1> -->
<h1>Seja bem vindo ao Repositório de arquivos da TLV</h1>

    <!-- <p><?=lang("JOIN_THANKS");?></p> -->

    <p>
      Obrigado por se registrar. Agora clique em Login para começar a usar!

    </p>
    <a href="login.php" class="btn btn-primary"><?=lang("SIGNIN_TEXT")?></a>
    <br /><br />
  </div>
</div>


<script>
  $(document).ready(function() {
    $("nav.navbar ").hide();
    $("footer ").hide();
  });
</script>

<style>
  .container {
    /* width: 75% !important; */
    width: 320px;
  }

  body {

background: url('../assets/img/backgroud.jpg') no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
background-size: cover;
-o-background-size: cover;
}
</style>