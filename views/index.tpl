% rebase('base.tpl', title='Python')
<!--- Image Slider -->
<!--- image slider w indicator-->
<div id="carouselExampleIndicators" class="carousel slide col-8 mx-auto" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="static/img/bg1.png" alt="First slide">
	  <div class="carousel-caption d-none d-md-block">
		<p>Introduction</p>
   		</div>
	</div>
    <div class="carousel-item">
      <img class="d-block w-100" src="static/img/bg2.png" alt="Second slide">
	  	<div class="carousel-caption d-none d-md-block">
		<p>Sales data in 2018, only units were released after 1990</p>
   		</div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="static/img/bg3.png" alt="Third slide">
	  <div class="carousel-caption d-none d-md-block">
		<p>What you can do!</p>
   		</div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>
