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
      var flot_data, i, plot, ticks, x, y;
      console.log(data);
      x = [];
      y = [];
      i = 0;
      while (i < data.length) {
        x[i] = data[i].transmission_time;
        y[i] = data[i].spo2;
        i++;
      }
      flot_data = [data.length];
      i = 0;
      while (i < data.length) {
        flot_data[i] = [];
        flot_data[i][0] = parseFloat(Date.parse(x[i]));
        flot_data[i][1] = parseFloat(y[i]);
        i++;
      }
      data = [flot_data];
      ticks = [];
      i = 0;
      console.log(data);
      plot = $.plot($("#placeholder"), data, {
        xaxis: {
          mode: "time"
        },
        series: {
          lines: {
            show: true
          },
          points: {
            show: true
          }
        },
        grid: {
          hoverable: true,
          clickable: true
        }
      });
    }
  });


  $("#btnAutoRefresh").click(function() {
    return setInterval((function() {
      poll();
    }), 5000);
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
        var flot_data, i, plot, ticks, x, y;
        console.log(data);
        x = [];
        y = [];
        i = 0;
        while (i < data.length) {
          x[i] = data[i].transmission_time;
          y[i] = data[i].spo2;
          i++;
        }
        flot_data = [data.length];
        i = 0;
        while (i < data.length) {
          flot_data[i] = [];
          flot_data[i][0] = parseFloat(Date.parse(x[i]));
          flot_data[i][1] = parseFloat(y[i]);
          i++;
        }
        console.log(flot_data);
        data = [flot_data];
        ticks = [];
        i = 0;
        plot = $.plot($("#placeholder"), data, {
          xaxis: {
            mode: "time"
          },
          series: {
            lines: {
              show: true
            },
            points: {
              show: true
            }
          },
          grid: {
            hoverable: true,
            clickable: true
          }
        });
        plot.setupGrid();
        plot.draw();
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
    var flot_data, i, plot, ticks, x, y;
    console.log(data);
    x = [];
    y = [];
    i = 0;
    while (i < data.length) {
      x[i] = data[i].transmission_time;
      y[i] = data[i].spo2;
      i++;
    }
    flot_data = [data.length];
    i = 0;
    while (i < data.length) {
      flot_data[i] = [];
      flot_data[i][0] = parseFloat(Date.parse(x[i]));
      flot_data[i][1] = parseFloat(y[i]);
      i++;
    }
    data = [flot_data];
    ticks = [];
    i = 0;
    console.log(data);
    plot = $.plot($("#placeholder"), data, {
      xaxis: {
        mode: "time"
      },
      series: {
        lines: {
          show: true
        },
        points: {
          show: true
        }
      },
      grid: {
        hoverable: true,
        clickable: true
      }
    });
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
      var flot_data, i, plot, ticks, x, y;
      console.log(data);
      x = [];
      y = [];
      i = 0;
      while (i < data.length) {
        x[i] = data[i].transmission_time;
        y[i] = data[i].spo2;
        i++;
      }
      flot_data = [data.length];
      i = 0;
      while (i < data.length) {
        flot_data[i] = [];
        flot_data[i][0] = parseFloat(Date.parse(x[i]));
        flot_data[i][1] = parseFloat(y[i]);
        i++;
      }
      data = [flot_data];
      ticks = [];
      i = 0;
      console.log(data);
      plot = $.plot($("#placeholder"), data, {
        xaxis: {
          mode: "time"
        },
        series: {
          lines: {
            show: true
          },
          points: {
            show: true
          }
        },
        grid: {
          hoverable: true,
          clickable: true
        }
      });
    }
  });
});

};

$(document).ready(ready);
$(document).on('page:load', ready);

