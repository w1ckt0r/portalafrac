
  $(document).ready(function() {
    $().ready(function() {

      $("a.delete").click(function(event) {
        if (confirm('Deseja realmente apagar esse arquivo?') == true) {
          $(this).closest('tr').delay(2000).fadeOut(500);
          $.post('files-proccess.php', {
              action: "xdel",
              id: $(this).attr("data-id")
            },
            function(returnedData, status, xhr) {
              //  console.log(returnedData);
              if (returnedData == '302') {
                window.location.href = "index.php"
              } else {
                // console.log("deletado")
              }


            }).fail(function() {
            // console.log("error");
          });

          $.notify({
                icon: "check_circle_outline",
                message: "Arquivo deletado <b>com sucesso</b>"

              }, {
                type: 'danger',
                timer: 2000,
                placement: {
                  from: 'bottom',
                  align: 'right'
                }
              });



          //This is here to prevent jsFiddle from navigating away from this page to your delete function
          event.preventDefault();
        } else
          event.preventDefault();
      });

      $("a.download").click(function(event) {
        $.post('files-proccess.php', {
            action: "xdownload",
            id: $(this).attr("data-id")
          },
          function(returnedData, status, xhr) {
            //  console.log(returnedData);
            if (returnedData == '302') {
              window.location.href = "index.php"
            } else {
              console.log("download completo")
            }


          }).fail(function() {
          console.log("error");
        });
        //This is here to prevent jsFiddle from navigating away from this page to your delete function
        event.preventDefault();

      });

      $("button.enviar").click(function(event) {

        $.post('files-proccess.php', {
            action: "xenviar",
            id: $("#data-id").val(),
            email: $("#txtEmail").val()
          },
          function(returnedData, status, xhr) {
            console.log(returnedData);
            if (returnedData == '302') {
              window.location.href = "index.php"
            } else {
              console.log("enviado");
              $('#mailModal').modal('toggle');


              $.notify({
                icon: "check_circle_outline",
                message: "Email enviado <b>com sucesso</b>"

              }, {
                type: 'success',
                timer: 3000,
                placement: {
                  from: 'bottom',
                  align: 'right'
                }
              });



            }


          }).fail(function() {
          console.log("error");
        });
        //This is here to prevent jsFiddle from navigating away from this page to your delete function
        event.preventDefault();

      });

      $('.x-enviar ').on('click', function(e) {
        e.preventDefault()
        // alert(e.target.pathname + e.target.search)
        $("#data-id").val($(this).attr("data-id"));
        // console.log($("#data-id").val());

      })

    });
  });




  $(document).on({
    ajaxStart: function(){
        // $("body").addClass("loading");
        // console.log("ajax start"); 
        $("#btnLoadEnabled").hide();
        $("#btnLoad").show();
        // <span class="spinner-border spinner-border-sm"></span>
        // Loading..
      },
      ajaxStop: function(){ 
        // console.log("ajax stop"); 
        // console.log("ajax start"); 
        $("#btnLoadEnabled").show();
        $("#btnLoad").hide();
        // $("body").removeClass("loading"); 
    }    
});