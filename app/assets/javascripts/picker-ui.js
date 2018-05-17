$(document).on('turbolinks:load', function(){
$(".datepick").pickadate({
    format: 'yyyy/mm/dd'
});

$(".timepick").pickatime({
    format: 'H:i',
    interval: 60
});

});
