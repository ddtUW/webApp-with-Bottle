<!doctype html>
<html ng-app="MainApp", lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cache" />

    <title>Sales Report Web app</title>
    <link rel="stylesheet" href="{{ get_url('static', path='src/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ get_url('static', path='src/bootstrap-theme.min.css') }}">
    <script type="text/javascript" src="{{ get_url('static', path='src/jquery.min.js') }}"></script>
    <script type = "text/javascript" src = "{{ get_url('static', path='src/popper.min.js') }}" > </script >
    <script type="text/javascript" src="{{ get_url('static', path='src/bootstrap.min.js') }}"></script>
    <script type="text/javascript" src="{{ get_url('static', path='src/Chart.min.js') }}"></script>
    <script type="text/javascript" src="{{ get_url('static', path='src/fa.min.js') }}"></script>
    <link href="{{ get_url('static', path='style.css')}}" rel="stylesheet">

  </head>
  <body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class='col-2'></div>
  <div>
    <a class="navbar-brand" href="/"><h2><i class='fas fa-scroll'></i> Console Sales Report</h2></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ">
        <li class="nav-item ">
          <a class="nav-link" href="/"><i class='fas fa-home'></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/makeReport"><i class='fas fa-file-alt'></i> Make Report</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/modify"><i class='fas fa-cog'></i> Tools</a>
        </li>
      </ul>

    </div>    
  </div>
</nav>

{{!base}}  
 
<!--- Footer -->
<footer class = 'bg-dark'>
  <div class = 'container-fluid padding row'>
    <div class=' text-center mx-auto'>
    <p><u>Disclaimer:</u> This Website is created for <mark>demonstration/ educational purpose</mark> only. </p>
    <p> Source of dataset: Wikipedia (last update: Dec 2018)</p>
    </div>
  </div>
</footer>
    
</body>
</html>
