$(function(){
  var anchor = $('a[target="_blank"]');
  anchor.each(function(){
    var url = $(this).attr('href');
    $(this).removeAttr('href');
    $(this).click(function(){
      location.href = url;
    });
  });
});
