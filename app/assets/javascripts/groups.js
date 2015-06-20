



$(window).load(function() {
$(".groupbox").on("mouseover", function(){
$(this).addClass("animated shake");
// $(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {$(".groupbox").removeClass('animated shake');});

});
});