// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require materialize-sprockets

//= require turbolinks

//= require_tree .



$(document).ready(function(){


  $(".button-collapse").sideNav();


  $('.modal-trigger').leanModal();



  $("#site_name").focus(function() {

    }).blur(function() {
      // validation length between 1 and 30 characters
        var len = {min:3,max:30};
        var nameInput = document.getElementsByTagName("input")[2].value.length
        var notice = document.getElementById("notify")
        if ( nameInput >= len.min && nameInput <=len.max ){
          console.log("valid")
        }
        else{
          $("#name").select()
          console.log("name invalid")
          notice.innerHTML="Please Use A name between 1 and 30 characters"

        }
    });


    $("#site_url").focus(function() {

      }).blur(function() {
        // validation length between 1 and 30 characters
          var len = {min:1,max:50};
          var nameInput = document.getElementsByTagName("input")[2].value.length
          var notice = document.getElementById("notify")


          if ( nameInput >= len.min && nameInput <=len.max ){
            console.log("valid")
            valid_inputs();
          }
          else{
            $("#name").select()
            console.log("name invalid")
            notice.innerHTML="Please Enter a valid URL"

          }
      });

      function valid_inputs(){


        $("#submit-btn").removeClass("disabled")
      }

        // if($(".fa-cog")[0]){
        //   setTimeout(function(){ location.reload() }, 3000);
        // }


   });
