// ハンバーガー
$(function () {
  $(".hamburger").click(function () {
    $(".globalMenuSp").addClass("active");
  });

  $(".hamburger_close").click(function () {
    $(".globalMenuSp").removeClass("active");
  });

  $(".anker a").click(function () {
    $(".globalMenuSp").removeClass("active");
  });
});
