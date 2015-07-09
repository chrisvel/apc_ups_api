function updateNewsTable() {
  $('#news').empty();
  
  // load news.js file data
  $.getJSON("api/newsdata", function(data){
    console.log(data);
    $.each(data, function(newsfeed, val){
      
      for(var i=0; i<val.length; i++)
        {
          content = "<tr><td>" + newsfeed +
                    "</td><td>" + i +
                    "</td><td>" + moment(new Date(val[i].pubdate)).fromNow() +
                    "</td><td>" + "<a href=\"" + val[i].guid + "\">" + val[i].title +" </a>"
                    "</tr>";

          $("#news").append(content);
          }
      })
  });
}

$(document).ready(function () {
  //console.log("ready!");
  updateNewsTable();
  setInterval(updateNewsTable, 10000* 30);
});
