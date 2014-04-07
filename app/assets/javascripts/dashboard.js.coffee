# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# $ ->

#   $.ajax
#     type: "POST"
#     dataType: "json"
#     data: patient_id: 1
#     url: "http://localhost:3000/patients/data"
#     success: (data) ->
#       console.log(data)
#       x = []
#       y = []
#       i = 0
#       while i < data.length
#         x[i] = data[i].transmission_time
#         y[i] = data[i].spo2
#         i++
      

#       flot_data = [data.length]
#       i = 0
#       while i < data.length
#         flot_data[i] = []
#         flot_data[i][0] = parseFloat(Date.parse(x[i]))
#         flot_data[i][1] = parseFloat(y[i])
#         i++
#       data = [flot_data]


#       ticks = []
#       i = 0
#       console.log(data)
#       plot = $.plot $("#placeholder"), data,
#         xaxis:
#          mode: "time"

#         series:
#           lines:
#             show: true

#           points:
#             show: true

#         grid:
#           hoverable: true
#           clickable: true

#       return

#   $("#btnAutoRefresh").click ->

#     setInterval (->
#       poll()
#       return
#     ), 5000

#   poll = ->
#     $.ajax
#       type: "POST"
#       dataType: "json"
#       data: patient_id: 1
#       url: "http://localhost:3000/patients/data"
#       success: (data) ->
#         console.log(data)
#         x = []
#         y = []
#         i = 0
#         while i < data.length
#           x[i] = data[i].transmission_time
#           y[i] = data[i].spo2
#           i++
        

#         flot_data = [data.length]
#         i = 0
#         while i < data.length
#           flot_data[i] = []
#           flot_data[i][0] = parseFloat(Date.parse(x[i]))
#           flot_data[i][1] = parseFloat(y[i])
#           i++
#         console.log flot_data;
#         data = [flot_data]


#         ticks = []
#         i = 0

#         plot = $.plot $("#placeholder"), data,
#           xaxis:
#            mode: "time"

#           series:
#             lines:
#               show: true

#             points:
#               show: true

#           grid:
#             hoverable: true
#             clickable: true
#         plot.setupGrid()
#         plot.draw()
#         return
#     return

# return
