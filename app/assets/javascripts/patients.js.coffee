$ ->
  data = [[
    [ #Apr 1, 2011
      1394423810000
      84
    ]
    [ #Apr 8, 2011
      1394510210000
      82
    ]
    [ #Apr 15
      1394596610000
      85
    ]
  ]]
  ticks = []
  i = 0

  while i < data[0].length
    ticks.push data[0][i][0]
    i++
  $.plot $("#placeholder"), data,
    xaxis:
      mode: "time"

    series:
      lines:
        show: true

      points:
        show: true

    grid:
      hoverable: true
      clickable: true

  return
