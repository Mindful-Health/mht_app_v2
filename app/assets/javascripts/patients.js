var ready;

ready = function() {

  var poll;

  $.ajax({
    type: "POST",
    dataType: "json",
    data: {
      patient_id: 1
    },
    url: "http://localhost:3000/patients/data",

    success: function(data) {
      load_data(data);
    }
  });


  $("#btnAutoRefresh").click(function() {
    return setInterval((function() {
      poll();
    }), 60000);
  });
  

  poll = function() {
    
    $.ajax({
      type: "POST",
      dataType: "json",
      data: {
        patient_id: 1
      },
      url: "http://localhost:3000/patients/data",
    
      success: function(data) {
        load_data(data);
      }
    });
  };


$("#24hr_data").click(function() {

$.ajax({
  type: "POST",
  dataType: "json",
  data: {patient_id: 1, 
         mode: "24 hours"},
  url: "http://localhost:3000/patients/data",
  success: function(data) {
    load_data(data);
  }
});
});

$("#1wk_data").click(function() {

  $.ajax({
    type: "POST",
    dataType: "json",
    data: {
    patient_id: 1,
    mode: "1 week"},
    url: "http://localhost:3000/patients/data",
  
    success: function(data) {
  
      load_data(data);
    }
  });
});

};

$(document).ready(ready);
$(document).on('page:load', ready);

load_data = function (data) {
  var flot_data, i, plot, ticks, x, y;
      
      console.log(data);
      
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

      data = [{data:flot_data1, lines:{show:true}}, {data:flot_data2, lines:{show:true}}];
      ticks = [];
      i = 0;
      
      console.log(data);
        // data = [{ data:data1, label:"fixed", lines:{show:true}}
        // ,{ data:data2, label:"linear", lines:{show:true}, points:{show:true}}
        // ,{ data:data3, label:"random", bars:{ show:true, barWidth:0.5}}];
      
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
        }
      });
};

