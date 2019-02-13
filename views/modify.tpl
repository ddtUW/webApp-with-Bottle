% rebase('base.tpl', title='Python')
<div class="row">
	<div class="col-md-8 mx-auto">
    <!-- list of tab -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="insert-tab" data-toggle="tab" href="#insert" role="tab" aria-controls="insert" aria-selected="false">
                    <i class='fas fa-file-import'></i> Insert
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="update-tab" data-toggle="tab" href="#update" role="tab" aria-controls="update" aria-selected="false">
                    <i class='fas fa-file-signature'></i> Update
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="delete-tab" data-toggle="tab" href="#delete" role="tab" aria-controls="delete" aria-selected="false">
                    <i class='fas fa-file-excel'></i> Delete
                </a>
            </li>
        </ul>
    <!-- tab contain -->
    <div class="tab-content" id="myTabContent">
    <!-- insert tab -->
        <div class="tab-pane fade show active" id="insert" role="tabpanel" aria-labelledby="insert-tab">
            <form action="/modify", method="POST">
            <div class="form-row col-12">
                <div class="col"><label for="firm">Firm</label>
                <select class="custom-select" id='firm' name='firm' required>
                    <option selected value="">Open this select firm</option>
                    <option value="Nintendo">Nintendo</option>
                    <option value="Microsoft">Microsoft</option>
                    <option value="Sony">Sony</option>
                </select>
                </div>
                <div class="col"><label for="platform">Platform</label>
                <input type="text" class="form-control" id='platform' placeholder="string" name="platform" required>
                </div>
                <div class="col"><label for="sales">Units sold</label>
                <input type="text" class="form-control" id='sales' placeholder="number in million" name="sales" required>
                </div>
                <small class="form-text text-muted">
                    Do not put blank!
                </small>                
            </div>
            <div class=' col-8'>
                <input class="btn btn-success" type="submit" value="Insert" name='insert'>
            </div>
            </form>         
        </div>

    <!-- update tab -->
        <div class="tab-pane fade" id="update" role="tabpanel" aria-labelledby="update-tab">
            <form action="/modify", method="POST">
            <div class="form-row col-8">
                <div class="col"><label for="platform">Platform</label>
                <input type="text" class="form-control" id='platform' placeholder="string" name="platform" required>
                </div>
                <div class="col"><label for="sales">Units sold</label>
                <input type="text" class="form-control" id='sales' placeholder="number in million" name="sales" required>
                </div>
                <small id="passwordHelpInline" class="form-text text-muted">
                    Do not put blank!
                </small>
            </div>
            <div class=' col-8'>
                <input class="btn btn-warning" type="submit" value="Update" name='updateData'>
            </div>
            </form>   
        </div>

    <!-- delete tab -->
        <div class="tab-pane fade" id="delete" role="tabpanel" aria-labelledby="delete-tab">
            <form action="/modify", method="POST">
            <div class="row">
                <div class="col-md-12 mx-auto">
                    <h4 class='text-info'><i class='fas fa-database'></i>  Select data you want to delete</h4>

                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                        <th width='12%'>Checkbox</th>
                        <th scope="col">Firm</th>
                        <th scope="col">Platfrom</th>
                        <th scope="col">Units sold</th>
                        </tr>
                    </thead>
                %for row in rows:
                    <tr>
                    <td><input type="checkbox" name="checksBox" value='{{row[1]}}'>
                        <label>checked</label> 
                    </td>
                    %for col in row:    
                        <td>{{col}}</td>
                    %end
                    </tr>
                %end
                </table>
                    <caption>*Sales number in million</caption>
                </div>
            </div>            

            <div class=' col-8'>
                <input class="btn btn-danger" type="submit" value="Detele" name='deleteData'>
            </div>
            </form>
        </div>
    </div>
    </div>

</div>

<!-- Show and hide database -->
<div class="col-md-8 mx-auto">
    <button type="button" class="btn btn-outline-secondary mx-auto" onclick="hide()", style='display:inline-block'>
        <i class='fas fa-toggle-off hide', style='display:block'></i><i class='fas fa-toggle-on hide', style='display:none'></i>
          Show/hide the current data:
    </button>
</div>
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

<style type="text/css">
    input[type=checkbox] + label {
        color: #ccc;
        font-style: italic;
    } 
    input[type=checkbox]:checked + label {
        color: #f00;
        font-style: normal;
    } 
</style>