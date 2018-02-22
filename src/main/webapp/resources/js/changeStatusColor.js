var table = document.getElementById("empTable");
var rows = table.getElementsByTagName("tr");
var cellIndexes = [];

for (var z = 1; z < rows.length; z++) {
    rows[z].cells[2].style.backgroundColor = "#c1c1c1"; // Sunday
}