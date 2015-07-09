function updateUpsTable(g1, g2, g3, g4) {
  $.getJSON("api/upsdata", function(upsdata){
      //console.log(upsdata.ups.LINEV);
      g1.refresh(upsdata.ups.LINEV);
      g2.refresh(upsdata.ups.ITEMP);
      g3.refresh(upsdata.ups.BCHARGE);
      g4.refresh(upsdata.ups.TIMELEFT);        
  });
}

$(document).ready(function () {
  //console.log("ready!");
  var g1, g2, g3, g4;
  
  g1 = new JustGage({
      id: "g1", 
      value: 0, 
      min: 180,
      max: 250,
      title: "Volts",
      label: "",
      levelColorsGradient: true
    });
  g2 = new JustGage({
      id: "g2", 
      value: 0, 
      min: 20,
      max: 60,
      title: "Temp",
      label: "",
      levelColorsGradient: true
    });
  g3 = new JustGage({
      id: "g3", 
      value: 0, 
      min: 0,
      max: 100,
      title: "Battery charge",
      label: "",
      levelColorsGradient: true
    });
  g4 = new JustGage({
      id: "g4", 
      value: 0,
      min: 0,
      max: 120,
      title: "Time left",
      label: "",
      levelColorsGradient: true
    });

  //setUpsTable(0, 0, 0, 0);
  setInterval( function() {
    updateUpsTable(g1, g2, g3, g4)
    }, 10000);
});

