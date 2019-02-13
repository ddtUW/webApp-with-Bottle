import pandas as pd
df = pd.read_csv('C:/Users/PC Tuan/Desktop/test.csv', header = None)
df.columns = ['id','name','firm','sale in milion']
for i in df['name']:
    print('<input type="checkbox" name="checksBox" value="'+i+'"'+ "/>"+i+ "<br>")


x = 1
y = 2
z = 3

l = [x,y,z]
x, y, z = (v + 2 for v in l)

ab =1 
str(ab)

<script>
   var chartData = {
   labels : [{% for i in firms %}
                  "{{i}}",
              {% endfor %}],
   datasets : [
      {
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            bezierCurve : false,
			{%for i in rows%}
				if rows[i][0] == firms[0][0]:
					label: {{rows[i][1]}},
					data: [{{rows[i][2]}},0,0]
				if rows[i][0] == firms[0][1]:
					label: {{rows[i][1]}},
					data: [0,{{rows[i][2]}},0]
				if rows[i][0] == firms[0][2]:
					label: {{rows[i][1]}},
					data: [0,0,{{rows[i][2]}}]	
			{%endfor %} 					
      }]
   }
 
    Chart.defaults.global.animationSteps = 50;
    Chart.defaults.global.tooltipYPadding = 16;
    Chart.defaults.global.tooltipCornerRadius = 0;
    Chart.defaults.global.tooltipTitleFontStyle = "normal";
    Chart.defaults.global.tooltipFillColor = "rgba(0,0,0,0.8)";
    Chart.defaults.global.animationEasing = "easeOutBounce";
    Chart.defaults.global.responsive = false;
    Chart.defaults.global.scaleLineColor = "black";
    Chart.defaults.global.scaleFontSize = 16;
 
   // get bar chart canvas
   var ctx = document.getElementById("chart").getContext("2d");
 
   steps = 10
   max = 40
   
   var BarChartDemo = new Chart(ctx).Bar(chartData, {
        scaleOverride: true,
        scaleSteps: steps,
        scaleStepWidth: Math.ceil(max / steps),
        scaleStartValue: 0,
        scaleShowVerticalLines: true,
        scaleShowGridLines : true,
        barShowStroke : true,
        scaleShowLabels: true,
        bezierCurve: false,
 
   });
</script>


<!–– < script >
new Chart(document.getElementById("bar-chart-grouped"), {
    type: 'bar',
    data: {
        labels: ['nintendo', 'microsoft', 'sony'],
        datasets: [

            {
                label: ["South Africa"],
                backgroundColor: "#3e95cd",
                data: [133, 125, 125, 422]
            }, {
                label: "Europe",
                backgroundColor: "#8e5ea2",
                data: [0, 408, 547]
            }, {
                label: "Asia",
                backgroundColor: "#5e44ff",
                data: [454, 685, 211, 55]
            }
        ]
    },
    options: {
        title: {
            display: true,
            text: 'Population growth (millions)'
        }
    }
})
</script >
-->
data: {
    datasets: [
        % for item in rows:
        {
            label: '{{ item[1] }}',
            data: [{{item[2]}}],
            backgroundColor: dynamicColors()
        },
            % end
    ]

}


data: {
    labels: [
        % for firm in firms:
        '{{ firm }}',
        % end
    ],
    datasets: [
        % for item in rows:
        {
            label: '{{ item[1] }}',
            % if item[0] == 'Microsoft':
            data: [{{item[2]}}, null, null],

            elif item[0] == 'Nintendo':
            data: [null, {{item[2]}}, null],

            else:
            data: [null, null, {{item[2]}}],

            % end
            backgroundColor: dynamicColors()
        },
        % end
    ]
}
    a='1'
    print(f'''test
            is complete. check {?a} ''',(a))
