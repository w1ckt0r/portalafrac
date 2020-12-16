<?php
require_once dirname(__FILE__) . "/admin/users/init.php";
require("header.php");

$db = DB::getInstance();
// echo "get";;;
$associados = $db->query("select * from associados order by nome asc ")->results();
//  dump( $associados );



?>

<section class="features2 cid-s8HaGIkBjh" id="features2-3" style="padding-bottom: 0; background-color: #04112b;">

    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-md-10 align-center">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-2" style="color: white;">Associados</h1>

            </div>
        </div>
    </div>
</section>
<!-- 
<div class="container" style="padding: 3%;">
    <div class="row row-select" style="padding-left: 10%;">
        <select id="buscar-class">
            <option value="publicacoes-cont">Selecione o segmento desejado</option>
            <option value="segmento_1345">AIDC/RFID</option>
            <option value="segmento_1349">Distribuidor</option>
            <option value="segmento_1350">Fabricante</option>
            <option value="segmento_1351">Meios de Pagamento</option>
            <option value="segmento_1352">Periféricos</option>
            <option value="segmento_3840">REP</option>
            <option value="segmento_1258">Revendedor</option>
            <option value="segmento_1353">Softwarehouse</option>
            <option value="segmento_1257">Startup</option>
            <option value="segmento_1354">Suprimentos</option>
            <option value="segmento_1355">Usuário Final Corporativo</option>
        </select>




        <input type="text" id="buscar-txt" placeholder="Busque por Nome, Endereço, Cidade ou Estado">
        <input style="width:0;" type="hidden" id="txtsegmento" value="">
    </div>
</div>
 -->



<section>
    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-10">


                <div class="media-container-row" style="justify-content: space-between; padding-top: 2%;">

                    <?php

                    $countRow = 0;

                    foreach ($associados as $associado) {
                        
                        $countRow++;
                        $icon = '';
                        
                        if ($associado->logotipo != '') {
                            $icon = 'https://cdn4.iconfinder.com/data/icons/math-symbols-line/48/empty_set_math_algebra-512.png';
                        } else {
                            $icon = $associado->logotipo;
                        }
                    ?>
                        <div class="media-block" style="width: 20%;">
                            <div class="mbr-figure">
                                <!-- <img src="assets/images/1A PCI POWER.jpg"> -->
                                <img src='<?=$icon ?>' >
                            </div>
                        </div>

                        <div class="step-container" style="padding-right:8%;">
                            <div class="card separline pb-4">
                                <div class="step-element d-flex">
                                    <div class="step-wrapper pr-3">
                                    </div>
                                    <div class="step-text-content">
                                        <h4 class="mbr-step-title pb-3 mbr-bold mbr-fonts-style display-7">
                                            <?= $associado->nome ?>
                                        </h4>
                                        <a  href="<?php echo "https://". ltrim($associado->url); ?>" target="_blank" ><?= $associado->url ?></a>
                                        <div class="step-text-content">
                                            <h4 class="mbr-step-title pb-3 mbr-fonts-style display-7">Tel: <?= $associado->telefone ?></h4>
                                            <p class="mbr-step-text mbr-fonts-style display-7"><?= $associado->endereco ?></p>
                                            <p class="mbr-step-text mbr-fonts-style display-7"><?= $associado->local ?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>




                    <?php

                        if (($countRow % 2) == 0) {
                            echo "      
                            </div>
                            <hr style='border-top: 1px solid #1b477c '>
                            <div class='media-container-row'
                            style='justify-content: space-between; padding-top: 2%;'> ";
                        }
                    }
                    ?>






                </div>
            </div>
        </div>
</section>


<!-- 

<section>
    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-10">
                <div class="media-container-row" style="justify-content: space-between; padding-top: 2%;">
                    <div class="media-block" style="width: 20%;">
                        <div class="mbr-figure">
                            <img src="assets/images/4Next_logo.png">
                        </div>
                    </div>
                    <div class="step-container">
                        <div class="card separline pb-4">
                            <div class="step-element d-flex">
                                <div class="step-wrapper pr-3">
                                </div>
                                <div class="step-text-content">
                                    <h4 class="mbr-step-title pb-3 mbr-bold mbr-fonts-style display-7">4NEXT AUTOMAÇÃO E CONSULTORIA</h4>
                                    <a href="www.pcipower.com.br">www.pcipower.com.br</a>
                                    <div class="step-text-content">
                                        <h4 class="mbr-step-title pb-3 mbr-fonts-style display-7">Tel: (31) 3492-1140</h4>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Rua João Ambrósio, 156</p>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Belo Horizonte / MG</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="media-block" style="width: 20%;">
                        <div class="mbr-figure">
                            <img src="assets/images/logo_ACSN.jpg">
                        </div>
                    </div>
                    <div class="step-container">
                        <div class="card separline pb-4">
                            <div class="step-element d-flex">
                                <div class="step-wrapper pr-3">
                                </div>
                                <div class="step-text-content">
                                    <h4 class="mbr-step-title pb-3 mbr-bold mbr-fonts-style display-7">ACSN</h4>
                                    <a href="www.pcipower.com.br">www.pcipower.com.br</a>
                                    <div class="step-text-content">
                                        <h4 class="mbr-step-title pb-3 mbr-fonts-style display-7">Tel: (31) 3492-1140</h4>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Rua João Ambrósio, 156</p>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Belo Horizonte / MG</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style="border-top: 1px solid #1b477c ">
            </div>
        </div>
    </div>
</section>
<section>
    <div class="container">
        <div class="media-container-row">
            <div class="col-12 col-md-10">
                <div class="media-container-row" style="justify-content: space-between; padding-top: 2%;">

                    <div class="media-block" style="width: 20%;">
                        <div class="mbr-figure">
                            <img src="assets/images/Active.png">
                        </div>
                    </div>
                    <div class="step-container">
                        <div class="card separline pb-4">
                            <div class="step-element d-flex">
                                <div class="step-wrapper pr-3">
                                </div>
                                <div class="step-text-content">
                                    <h4 class="mbr-step-title pb-3 mbr-bold mbr-fonts-style display-7">ACTIVE SOLUÇÕES EM TECNOLOGIA</h4>
                                    <a href="www.pcipower.com.br">www.pcipower.com.br</a>
                                    <div class="step-text-content">
                                        <h4 class="mbr-step-title pb-3 mbr-fonts-style display-7">Tel: (31) 3492-1140</h4>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Rua João Ambrósio, 156</p>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Belo Horizonte / MG</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="media-block" style="width: 20%;">
                        <div class="mbr-figure">
                            <img src="assets/images/logo_acs_75.png">
                        </div>
                    </div>
                    <div class="step-container">
                        <div class="card separline pb-4">
                            <div class="step-element d-flex">
                                <div class="step-wrapper pr-3">
                                </div>
                                <div class="step-text-content">
                                    <h4 class="mbr-step-title pb-3 mbr-bold mbr-fonts-style display-7">ACS</h4>
                                    <a href="www.pcipower.com.br">www.pcipower.com.br</a>
                                    <div class="step-text-content">
                                        <h4 class="mbr-step-title pb-3 mbr-fonts-style display-7">Tel: (31) 3492-1140</h4>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Rua João Ambrósio, 156</p>
                                        <p class="mbr-step-text mbr-fonts-style display-7">Belo Horizonte / MG</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <hr style="border-top: 1px solid #1b477c "> 
            </div>
        </div>
    </div>
</section>
 -->


<?php require("footer.php"); ?>