% rebase('base.tpl', title='Python')
<!-- Chart-->
<div class = 'col-md-8 mx-auto' > <canvas id = "chart" > </canvas >
</div >

<!-- legend extra -->
<div class = 'col-md-8 mx-auto' >
    <p class = 'col-md-8 mx-auto' style ='text-align:center; padding:0'> Border color indicates company(from left to right): </p >
    <ul class='row justify-content-md-center' style ='text-align:center' >
    <li class = "col col-lg-2"style = "display: inline-block" > <div class = 'mx-auto' style = "width:50px; height:10px; background:#0e7a0d" > </div >Microsoft </li >
    <li class="col col-lg-2" style = "display: inline-block" > <div class = 'mx-auto' style = "width:50px; height:10px; background:#e4000f" > </div >Nintendo </li >
    <li class = "col col-lg-2" style = "display: inline-block" > <div class = 'mx-auto' style = "width:50px; height:10px; background:#003791" > </div >Sony </li >
    </ul> 
</div>

<!-- summary table -->
<div class='col-md-8 mx-auto'>
    <table class = "table table-hover table-bordered" >
    <h3 class = 'text-dark font-weight-bold' style = "font-size: 2rem; font-family: 'Helvetica Neue'" > 
        <i class='fas fa-clipboard'></i> Basic summary from selected data: 
    </h3 >
        <thead class="thead-light" >
        <tr >
            <th scope = "col" > Firm </th >
            <th scope = "col" > Total Sales (rounded) </th >
            <th scope = "col" > Best-selling Platfrom </th >
            <th scope = "col" > Units sold </th >
        </tr>
        </thead >
	% for row in total:
		<tr >
		% for col in row:
			<td > {{col}} </td>
		% end
		</tr >
	% end
	</table >
    <caption > *Sales number in million </caption >
</div >

<!-- Show and hide database -->
<!-- button -->
<div class="col-md-8 mx-auto">
    <button type="button" class="btn btn-outline-secondary mx-auto" onclick="hide()", style='display:inline-block'>
        <i class='fas fa-toggle-off hide', style='display:block'></i><i class='fas fa-toggle-on hide', style='display:none'></i>
          Show/hide the current data:
    </button>
</div>
<!-- data table -->
<div class="col-md-8 mx-auto hide" , style='display:none'>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
            <th scope="col">Firm</th>
            <th scope="col">Platfrom</th>
            <th scope="col">Units sold</th>
            </tr>
        </thead>
    %for row in rows:
        <tr>
        %for col in row:
            <td>{{col}}</td>
        %end
        </tr>
    %end
    </table>
        <caption>*Sales number in million</caption>
</div>            

<!-- jS and CSS -->
<script>
    //random color
    var dynamicColors = function() {
        var r = Math.floor(Math.random() * 255)
        var g = Math.floor(Math.random() * 255)
        var b = Math.floor(Math.random() * 255)
        return "rgb(" + r + "," + g + "," + b + "," + 0.5 + ")"
    }

    //chartJS function
    var ctx = document.getElementById("chart").getContext('2d');
    var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        datasets: [
            % for item in rows:
            {
            label: '{{ item[1] }}',
            % if item[0] == 'Microsoft':
                borderColor: "#0e7a0d",

            %elif item[0] == 'Nintendo':
                borderColor: "#e4000f",

            %else:
                borderColor: "#003791",

            % end
            borderWidth:2,
            data: [{{item[2]}}],
            backgroundColor: dynamicColors()
            },
            %end 
        ]
            
    },
        options: {
        title: {
            display: true,
            text: 'Sales Chart',
            fontSize: 32,
            fontFamily: 'Helvetica Neue'
        },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
    });
    // show and hide function
    function hide() {
        var x = document.getElementsByClassName('hide');
        var i;
        for (i=0; i<x.length;i++){
            if (x[i].style.display === "none") {
                x[i].style.display = "block";
            } else {
                x[i].style.display = "none";
            }
        }
    }
</script>


