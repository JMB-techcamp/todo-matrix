$(document).on('turbolinks:load', function(){
$("#date_box").pickadate({
    format: 'yyyy/mm/dd'
});

$("#time_box").pickatime({
    format: 'h:i'
});

});
