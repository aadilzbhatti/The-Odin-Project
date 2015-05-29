/**
 * Created by aadil on 5/25/15.
 */
var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery-1.11.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

$(document).ready(function() {
    generateGrid();
});

function generateGrid() {
    deleteGrid();
    var input = document.getElementById("generate").value;

    if (isNaN(input) || input < 0 || input > 300) {
        alert("Invalid input. Please enter a number between 0 and 300.");
        return;
    }

    var num = input > 0 ? input : 16;
    var numPixelsPerSquare = Math.floor(960 / num);

    var $grid = $('#pixelgrid');

    for (var i = 0; i < num; i++) {
        var row = '<div>';
        for (var j = 0; j < num; j++)
            row += '<div class="square">' + '</div>';
        row += '</div>';
        $grid.append(row);
    }

    $('.square').width(numPixelsPerSquare);
    $('.square').height(numPixelsPerSquare);

    $('.square').mouseenter(function() {
        $(this).css("background-color", "black");
    });
}

function clearGrid() {
    $('.square').css("background-color", "white")
}

function deleteGrid() {
    $('div').remove('.square');
}