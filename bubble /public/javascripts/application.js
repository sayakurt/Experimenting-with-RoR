$($("#new_comment").live("submit",function(){
$(".adding_comment").css("background", "url('/images/create-loader.gif')")
$.post(this.action,$(this).serialize(),null,'script');
$("#comment_author").val("");
$("#comment_content").val("");
return false;
}));


$(function() {
  $(".pagination a").live("click", function() {
    $(".loading_pages").css("background", "url('/images/ajax-loader.gif')")
    $.get(this.href, null, null, "script");
    return false;
  });
});


