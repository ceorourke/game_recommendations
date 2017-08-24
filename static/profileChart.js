"use strict";

var ctx = $("#myChart");

$.get("/userprofile.json", {user_id: user_id}, function (data) {
var myChart = new Chart(ctx, {
    type: 'radar',
    data: {
        labels: data['labels'],
        datasets: [{
            label: 'Stats',
            data: data['weights'],
            backgroundColor: ['rgba(221, 169, 85, .6)'],
            borderColor: ['rgba(221, 169, 85, .8)'],
            pointHoverBackgroundColor: ['rgba(128,0,128,1)'],
            pointStyle:'cross',
            borderWidth: 4,
            duration: 90000

        }]
    },
    options: {
    }
})});