% rebase('base.tpl', title='Python')
<div class="row">
	<div class="col-md-12">
    
<!-- title -->    
<div class='col-8  mx-auto'>
    <h3><i class='fas fa-gamepad'></i> Select Platform(s) below to make a report</h3>
</div>  

<!-- list of Platform -->
<form action="/createTable", method="POST">
  <fieldset>

    <div class='col-8  mx-auto'>
    <legend><i class='fas fa-list'></i> Nintendo</legend>
    %for i in nintendo:
        <div class="form-check form-check-inline"><input type="checkbox" name="checksBox" value="{{i}}"/>&nbsp;{{i}}</div>
    %end
    <hr>
    </div>
    
    <div class='col-8  mx-auto'>
        <legend><i class='fas fa-list'></i> Microsoft</legend>
    %for i in microsoft:
        <div class="form-check form-check-inline"><input type="checkbox" name="checksBox" value="{{i}}"/>&nbsp; {{i}}</div>
    %end    
    <hr>
    </div>
    
    <div class='col-8  mx-auto'>
        <legend><i class='fas fa-list'></i> Sony</legend>
    %for i in sony:
        <div class="form-check form-check-inline"><input type="checkbox" name="checksBox" value="{{i}}"/>&nbsp; {{i}}</div>
    %end   
    <hr>
    </div>
    <br>
    
    <div class='mx-auto col-8'>
        <input class="btn btn-secondary" type="submit" value="Submit" name='findData'>
        <input class="btn btn-outline-light" type="submit" value="Black Sheep Wall" name= 'showAll'>
    </div>
  </fieldset>
</form> 
	
	</div>
</div>