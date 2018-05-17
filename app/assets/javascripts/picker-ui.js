$(document).on('turbolinks:load', function(){
$(".date").pickadate({
    format: 'yyyy/mm/dd'
});

$(".time").pickatime({
    format: 'H:i',
    interval: 60
});

});
