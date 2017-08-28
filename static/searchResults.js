"use strict";

function updateHomepage(results){
    $('#search-results').html('<h3>'+'Search Results: '+'</h3></br>')
    for (var i = 0; i < results.games.length; i++) {
        var currentGame = results['games'][i];
        if (currentGame.game_id == 0) {
            $('#search-results').append('No game found by that name. Please try again. '+
                                        '<i class="fa fa-gamepad" aria-hidden="true"></i>'+ ' '+
                                        '<i class="fa fa-frown-o" aria-hidden="true"></i>');
        } else {
        $('#search-results').append('<a href="/games/'+currentGame.game_id+'">'
                                                      +currentGame.name+'</a><br/>');
    }
    }
    // to use Handlebars, comment out the above and comment this in.
    // also go to homepage.html and comment out the #search-results div
    // and comment in the Handlebar stuff
    // however, this currently isn't working if you don't use body,
    // was trying to use #search-results and it wouldn't show up, so did the above

    // var source = $("#search-results").html();
    // var template = Handlebars.compile(source);
    // var context = results;
    // var html = template(context);
    // $('body').append(html);
}

function getResults(evt){
    evt.preventDefault()

    var game = $('#search-text').val();

    $.post('/search.json', {'game': game}, updateHomepage);
}

$('#search-btn').on('click', getResults);