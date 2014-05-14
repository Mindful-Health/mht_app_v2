var ready;
ready = function() {

var x_auto = [];
var y_auto_spo2 = [];
var y_auto_heart = [];
var auto_counter = 0;



  // Set the Xively API key (https://xively.com/users/YOUR_USERNAME/keys)
  //var key = "JhxKaGOzgOozj0LqDVReCJWyPU8Vg3xEgK9aDYRt3YJyKc9n"; //API key
  //xively.setKey("B6mEkGwf5YFgyZ9GJXOUWzFE2Yx4fewxOuZxPSJmRgyC7szH");
  xively.setKey("JhxKaGOzgOozj0LqDVReCJWyPU8Vg3xEgK9aDYRt3YJyKc9n"); 
  
  // Replace with your own values  
  //var feedID        = 705754061;          // Feed ID  
  var feedID        = 909656253;
  var datastreamID  = "LivePulse";       // Datastream ID  
  var selector      = "#myelement";   // Your element on the page  
  var refreshIntervalId;

  var poll;

  // $.ajax({
  //   type: "POST",
  //   dataType: "json",
  //   data: {
  //     patient_id: 1
  //   },
  //   url: "http://localhost:3000/patients/data",

  //   success: function(data) {
  //     load_data(data);
  //   }
  // });


  $("#btnAutoRefresh").click(function() {
    refreshIntervalId = setInterval((function() {
      poll();
    }), 1000);
  });
  

  poll = function() {
    
    // Get datastream data from Xively  
  xively.datastream.get (feedID, "LivePulse", function ( datastream ) {  
    
    console.log(datastream["current_value"]);
    console.log(Date.parse(datastream["at"]));

    x_auto[auto_counter] = Date.parse(datastream["at"]);
    y_auto_spo2[auto_counter] = datastream["current_value"];


  });

    xively.datastream.get (feedID, "LiveSpO2", function ( datastream ) {  
    
    console.log(datastream["current_value"]);


    y_auto_heart[auto_counter] = datastream["current_value"];

  });

    auto_counter++;
    // $.ajax({
    //   type: "POST",
    //   dataType: "json",
    //   data: {
    //     patient_id: 1
    //   },
    //   url: "http://localhost:3000/patients/data",
    
    //   success: function(data) {
    //     console.log(data);
    //     load_data(data);
    //   }
    // });





      flot_data1 = [x_auto.length];
      flot_data2 = [x_auto.length];
      i = 0;
      while (i < x_auto.length) {
        flot_data1[i] = [];
        flot_data1[i][0] = parseFloat(x_auto[i])-18000000;
        flot_data1[i][1] = y_auto_spo2[i];

        flot_data2[i] = [];
        flot_data2[i][0] = parseFloat(x_auto[i])-18000000;
        flot_data2[i][1] = y_auto_heart[i];

        i++;
      }
      console.log(flot_data1);
      console.log(flot_data2);
      data = [{label: 'HR', data: flot_data1},
              {label: 'SpO2', data: flot_data2}];

      
      
      plot = $.plot($("#placeholder"), data, {
        xaxis: {
          mode: "time"
        },
        series: {
          lines: {
            show: true
          },
          points: {
            show: false
          }
        },
        grid: {
          hoverable: false,
          clickable: false
        },
        legend: {
          show: true,
          position: "ne",
          noColumns: 2,
          container: $("#graph_legend")
        }
      });



  };


$("#24hr_data").click(function() {

clearInterval(refreshIntervalId);

$.ajax({
  type: "POST",
  dataType: "json",
  data: {patient_id: 1, 
         mode: "24 hours"},
  //url: "http://localhost:3000/patients/data",
  url: "http://mindfulhealth.herokuapp.com/patients/data",
  success: function(data) {
    load_data(data);
  }
});
});

$("#1wk_data").click(function() {

clearInterval(refreshIntervalId);

  $.ajax({
    type: "POST",
    dataType: "json",
    data: {
    patient_id: 1,
    mode: "1 week"},
    //url: "http://localhost:3000/patients/data",
    url: "http://mindfulhealth.herokuapp.com/patients/data",
    success: function(data) {
  
      console.log(data);


      load_data(data);
    }
  });
});



load_data = function (data) {
  var flot_data, i, plot, ticks, x, y;
      
      
      x = [];
      y_spo2 = [];
      y_heart_rate = [];
      i = 0;
      
      while (i < data.length) {
        x[i] = data[i].transmission_time;
        y_spo2[i] = data[i].spo2;
        y_heart_rate[i] = data[i].heart_rate;
        i++;
      }
      

      flot_data1 = [data.length];
      flot_data2 = [data.length];
      i = 0;
      while (i < data.length) {
        flot_data1[i] = [];
        flot_data1[i][0] = parseFloat(Date.parse(x[i]));
        flot_data1[i][1] = parseFloat(y_spo2[i]);

        flot_data2[i] = [];
        flot_data2[i][0] = parseFloat(Date.parse(x[i]));
        flot_data2[i][1] = parseFloat(y_heart_rate[i]);

        i++;
      }

      data = [{label: 'HR', data: flot_data1},
              {label: 'SpO2', data: flot_data2}];


      
      
      plot = $.plot($("#placeholder"), data, {
        xaxis: {
          mode: "time"
        },
        series: {
          lines: {
            show: true
          },
          points: {
            show: false
          }
        },
        grid: {
          hoverable: false,
          clickable: false
        },
        legend: {
          show: true,
          position: "ne",
          noColumns: 2,
          container: $("#graph_legend")
        }
        
      });

};



};

$(document).ready(ready);
$(document).on('page:load', ready);
