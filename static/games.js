"use strict";

function replaceGame(results) {
    $('#game-info').html(results);
    console.log("I'm in replaceGame");
}

function showGame(evt) {
    var input = $('#search-field').val();
    var searchInput = {searchField: input};
    $.get('/search.json', searchInput, replaceGame);
    console.log("I'm here");
}


$('#search-btn').on('click', showGame);