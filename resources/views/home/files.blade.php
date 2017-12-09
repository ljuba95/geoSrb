@extends('layouts.main')
@section('title','Fajlovi')
@section('content')
<div class="container">
      <div>
        <select id="categorySelect" class="form-control" onChange="getFiles()">
        <option class="placeholder" selected disabled value="">Izaberite kategoriju</option>
          @foreach ($categories as $category)
            <option value={{ $category->id }}>{{ $category->name }}</option>
          @endforeach
        </select>

        <div>
          <table id="filesTable" style="width:100%">
            <tr>
              <th>Naziv</th>
              <th>Kreiran</th> 
              <th>Izmenjen</th>
            </tr>
          </table>
        </div>
      </div>
    </div>

<script type="text/javascript">
  function getFiles(){
    var id = document.getElementById("categorySelect").value;
  
    $.ajax({
      type: 'GET',
      url: `http://localhost:8000/files/${id}`,
      success: function(data){
        json  = JSON.parse(data);
        rows = `<tr>
              <th>Naziv</th>
              <th>Kreiran</th> 
              <th>Izmenjen</th>
            </tr>`;
        json.forEach(function(obj) {
          rows += `<tr><td><a href="http:\/\/localhost:8000\/storage\/${obj.label}">${obj.label}</a></td>
            <td>${obj.created_at}</td><td>${obj.updated_at}</td></tr>`;
         });
        document.getElementById('filesTable').innerHTML = rows;
      }
    });
  };
</script>
@endsection
