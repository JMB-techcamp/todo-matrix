$(document).on('turbolinks:load', function(){

  //テキストリンクをクリックしたら
 $("#important").click(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     $("body").append('<div id="modal-bg"></div>');

    //画面中央を計算する関数を実行
    modalResize();

    //モーダルウィンドウを表示
        $("#modal-bg,#modal-main1").fadeIn("fast");

    //画面のどこかをクリックしたらモーダルを閉じる
      $("#modal-bg,#modal-main1").click(function(){
          $("#modal-main1,#modal-bg").fadeOut("fast",function(){
         //挿入した<div id="modal-bg"></div>を削除
              $('#modal-bg').remove() ;
         });

        });

    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
     $(window).resize(modalResize);
      function modalResize(){

          var w = $(window).width();
          var h = $(window).height();

          var cw = $("#modal-main1").outerWidth();
          var ch = $("#modal-main1").outerHeight();

        //取得した値をcssに追加する
            $("#modal-main1").css({
                "left": ((w - cw)/2) + "px",
                "top": ((h - ch)/2) + "px"
          });
     }
   });

 $("#decide").click(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     $("body").append('<div id="modal-bg"></div>');

    //画面中央を計算する関数を実行
    modalResize();

    //モーダルウィンドウを表示
        $("#modal-bg,#modal-main2").fadeIn("fast");

    //画面のどこかをクリックしたらモーダルを閉じる
      $("#modal-bg,#modal-main2").click(function(){
          $("#modal-main2,#modal-bg").fadeOut("fast",function(){
         //挿入した<div id="modal-bg"></div>を削除
              $('#modal-bg').remove() ;
         });

        });

    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
     $(window).resize(modalResize);
      function modalResize(){

          var w = $(window).width();
          var h = $(window).height();

          var cw = $("#modal-main2").outerWidth();
          var ch = $("#modal-main2").outerHeight();

        //取得した値をcssに追加する
            $("#modal-main2").css({
                "left": ((w - cw)/2) + "px",
                "top": ((h - ch)/2) + "px"
          });
     }
   });

 $("#delegate").click(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     $("body").append('<div id="modal-bg"></div>');

    //画面中央を計算する関数を実行
    modalResize();

    //モーダルウィンドウを表示
        $("#modal-bg,#modal-main3").fadeIn("fast");

    //画面のどこかをクリックしたらモーダルを閉じる
      $("#modal-bg,#modal-main3").click(function(){
          $("#modal-main3,#modal-bg").fadeOut("fast",function(){
         //挿入した<div id="modal-bg"></div>を削除
              $('#modal-bg').remove() ;
         });

        });

    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
     $(window).resize(modalResize);
      function modalResize(){

          var w = $(window).width();
          var h = $(window).height();

          var cw = $("#modal-main3").outerWidth();
          var ch = $("#modal-main3").outerHeight();

        //取得した値をcssに追加する
            $("#modal-main3").css({
                "left": ((w - cw)/2) + "px",
                "top": ((h - ch)/2) + "px"
          });
     }
   });

 $("#delete").click(function(){
      //body内の最後に<div id="modal-bg"></div>を挿入
     $("body").append('<div id="modal-bg"></div>');

    //画面中央を計算する関数を実行
    modalResize();

    //モーダルウィンドウを表示
        $("#modal-bg,#modal-main4").fadeIn("fast");

    //画面のどこかをクリックしたらモーダルを閉じる
      $("#modal-bg,#modal-main4").click(function(){
          $("#modal-main4,#modal-bg").fadeOut("fast",function(){
         //挿入した<div id="modal-bg"></div>を削除
              $('#modal-bg').remove() ;
         });

        });

    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
     $(window).resize(modalResize);
      function modalResize(){

          var w = $(window).width();
          var h = $(window).height();

          var cw = $("#modal-main4").outerWidth();
          var ch = $("#modal-main4").outerHeight();

        //取得した値をcssに追加する
            $("#modal-main4").css({
                "left": ((w - cw)/2) + "px",
                "top": ((h - ch)/2) + "px"
          });
     }
   });
});
