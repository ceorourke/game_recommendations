"use strict";

function updateRating(results) {
    $('#rated').html("You rated this: " + results['rating']);
}

function getRating(evt) {
    evt.preventDefault();

    var rating = $('input[name=rating]:checked').val();
    var game_id = $('#gameId').val();
    $.post('/gamerating.json', {'rating': rating, 'game_id': game_id}, updateRating);
}

$('#submit-btn').on('click', getRating);