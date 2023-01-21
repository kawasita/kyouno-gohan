//turbolinksの部分無効化
// $(document).on('turbolinks:load', function() {
//   //ローディング画面の表示
//   $(window).on('load',function(){
//     $("#loading").delay(1500).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
//     $("#loading_box").delay(1200).fadeOut('slow');//ローディングテキストを1.2秒（1200ms）待機してからフェードアウト
//   });
// });

// $("input.loading").click(function(){
//     $('#loading').show().activity({
//         segments:12,
//         width:12,
//         space:6,
//         length:28,
//         color:'#fff',
//         speed:1.5
//     });
// });

$("input.loading").on('click', function() {
  $("#loading").delay(1500).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
  $("#loading_box").delay(1200).fadeOut('slow');//ローディングテキストを1.2秒（1200ms）待機してからフェードアウト
  $('.loading').show();
});