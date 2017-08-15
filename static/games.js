"use strict";

function replaceGame(results) {
    $('#game-info').html('<h1>'+results.name+'</h1>');
    $('#game-info').append('<h2>'+results.systems+'</h2>');

    console.log(results);
}

function showGame(evt) {
    evt.preventDefault();
    var input = $('#search-field').val();
    var searchInput = {searchField: input};
    $.get('/search.json', searchInput, replaceGame);
    console.log("I'm here");
}


$('#search-btn').on('click', showGame);