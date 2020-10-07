<?php  require("header.php");

$channelId = 'UCfQvvdr6DXg5z0MuoaKISVw';
$maxResults = 6;
$API_key = 'AIzaSyCkN9STIUvxX14Cjg6GZq-ZBPyjhI7QNR4';

$video_list = json_decode(file_get_contents('https://www.googleapis.com/youtube/v3/search?order=date&part=snippet&channelId='.$channelId.'&maxResults='.$maxResults.'&key='.$API_key.''));

// var_dump($video_list);
?>
<br>
<br>
<div class="container">
        <div class="row">

        <?php 
        foreach($video_list->items as $item)
        {
          ?>
          

            <div class="card col-12 col-md-6 col-lg-4" style="padding-top:2% ;">
                <div class="card-wrapper" id="<?=$item->id->videoId ?>">
                    <div class="card-img">
                        <img src="<?=$item->snippet->thumbnails->medium->url ?>" alt="Mobirise" title="" class="">
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-7" style="padding-top: 5%"> <?=$item->snippet->title ?> </h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                            No último dia 17 de novembro a Secretaria da Fazenda de São Paulo apresentou a entidades e empresas os detalhes do projeto SAT-RPE. Na referida reunião, a Sefaz/SP expôs sugestão de cronograma de implantação dos equipamentos que permitirão a medição da vazão das bombas de combustível, como medida ao combate…
                        </p>
                    </div>
                    <div class="mbr-section-btn text-center"><a href="<?=$item->id->videoId ?>" class="btn btn-primary display-4">
                            Ler Mais</a></div>
                </div>
            </div>
          

<?php         

        }
?>



        </div>
    </div>



<?php


foreach($video_list->items as $item)
{
        //Embed video
        if(isset($item->id->videoId)){
            
    echo '<li id="'. $item->id->videoId .'" class="col-lg-3 col-sm-6 col-xs-6 youtube-video">
        <a href="#'. $item->id->videoId .'" title="'. $item->snippet->title .'">
            <img src="'. $item->snippet->thumbnails->medium->url .'" alt="'. $item->snippet->title .'" class="img-responsive" height="130px" />
            <h2>'. $item->snippet->title .'</h2>
            <span class="glyphicon glyphicon-play-circle"></span>
        </a>
    </li>
    ';
    
        }
        //Embed playlist
    //     else if(isset($item->id->playlistId))
    //     {
    //         echo '<li id="'. $item->id->playlistId .'" class="col-lg-3 col-sm-6 col-xs-6 youtube-playlist">
    //     <a href="#'. $item->id->playlistId .'" title="'. $item->snippet->title .'">
    //         <img src="'. $item->snippet->thumbnails->medium->url .'" alt="'. $item->snippet->title .'" class="img-responsive" height="130px" />
    //         <h2>'. $item->snippet->title .'</h2>
    //         <span class="glyphicon glyphicon-play-circle"></span>
    //     </a>
    // </li>
    // ';
        // }
}


  require("footer.php");
  
  ?>

<script>
//For video
$(".youtube-video").click(function(e){
    $(this).children('a').html('<div class="vid"><iframe width="420" height="315" src="https://www.youtube.com/embed/'+ $(this).attr('id') +'?autoplay=1" frameborder="0" allowfullscreen></iframe></div>');
    return false;
     e.preventDefault();
    });

    // //For playlist
    // $(".youtube-playlist").click(function(e){
    // $(this).children('a').html('<div class="vid"><iframe width="420" height="315" src="https://www.youtube.com/embed/videoseries?list='+ $(this).attr('id') +'&autoplay=1" frameborder="0" allowfullscreen></iframe></div>');
    // return false;
    //  e.preventDefault();
    // });


</script>

<!-- https://www.codeproject.com/Tips/998364/Youtube-video-list-with-PHP -->