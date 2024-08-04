

function reverseString(){
    var t = document.getElementById("word").value;
    document.getElementById('target').innerHTML = t.split('').reverse().join('');
}


function multiply(){
	var x = document.createElement("TABLE");
	for (var i = 1; i<= 20; i++)
	{
		var results = document.getElementById("number").value;
		document.getElementById('target2').innerHTML +=  results * i;	
	}	
}

function range(start,end)
{
	for (let i = start; i <= end; i++) 
	{
		return i;
		
	}
	
}

function generate_table() {
  var body = document.getElementsByTagName("body")[0];
  var results = document.getElementById("number").value;
  var tbl = document.createElement("table");
  var tblBody = document.createElement("tbody");

  for (var i = 1; i <= 5; i++) {
    var row = document.createElement("tr");	
	var m = range(1,20);
		for (var step = 1; step <= 4;  step++) {
			  var cell = document.createElement("td");
			  var cellText = document.createTextNode(results *i*step);
			  cell.appendChild(cellText);
			  row.appendChild(cell);
			  
		}
	tblBody.appendChild(row);		
  }
  tbl.appendChild(tblBody);
  body.appendChild(tbl);
  tbl.setAttribute("border", "2");
}

function table(){
	var body = document.getElementsByTagName("body")[0];
	var results = document.getElementById("number").value;
	
	document.write("<table>");
	for(var a = 1; a <= 5; a++) {
	 
	document.write("<tr>");
	for(var b = 1; b <= 4; b++) {
	document.write("<td>" 
			+ a*b*results + "</td>");
		}
		document.write("</tr>");
	}
	document.write("</table>");
}

function update_table(data,columns) {
  var table = d3.select('#target').append('table')
  var thead = table.append('thead')
  var tbody = table.append('tbody')
  thead.append('tr').selectAll('th').data(columns).enter().append('th').text(function (d) { return d })
  var rows = tbody.selectAll('tr').data(data).enter().append('tr')
  var cells = rows.selectAll('td').data(function(row) {
    return columns.map(function (column) {
      return { column: column, value: row[column] } })
  }).enter().append('td').text(function (d) { return d.value })
  return table;
}

function refresh(){
  var pres = document.getElementById('word').value
  var table = d3.select('#target').selectAll('table').remove();
  var dat = 'https://raw.githubusercontent.com/apag101/CUNYSPS/master/presidents.csv'
  var t = d3.csv(dat,function (data) {
    var columns = ['Name','Height','Weight'];
    var subset = data.filter( function(d) { return d.Name.indexOf( pres ) !== -1 } ); 
    update_table(subset,columns) });
}
