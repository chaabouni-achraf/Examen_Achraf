<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>DataTables</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">DataTables</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	<c:if test = "${lstTeachers == null}">
		<c:if test = "${currentTeacher != null}"><button onclick="deleteTeacher(${currentTeacher.id})" >DELETE</button></c:if>
		<form action="TeacherServlet" method="POST">
		
		<c:if test = "${currentTeacher != null}">
			<input type="hidden" name="id" id="id"  value="${currentTeacher.id}">
		</c:if> 
		
		<h1 class="text-uppercase">Nouveau enseignant</h1>
		<br>
		<label>Nom</label>
		<input type="text" name="first_name" id="first_name"  value="${currentTeacher.first_name}">
		
		<br>
		<label>Prenom</label>
		<input type="text" name="last_name" id="last_name" value="${currentTeacher.last_name}">
		
		
		<br>
		<label>Date de naissance</label>
		<input type="date" name="birthday" id="birthday" 
		value="<fmt:formatDate value="${currentTeacher.birthday}" pattern="yyyy-MM-dd" />">
		
		<br>
		<label>Email</label>
		<input type="text" name="email" id="email" value="${currentTeacher.email}">	
		
		<br>
		<label>Institution</label>
		<input type="text" name="institution" id="institution" value="${currentTeacher.institution}">
			
		<br>
		<label>Telephone</label>
		<input type="text" name="phone" id="phone" value="${currentTeacher.phone}">
		<br>
		
		<button type="submit" >Submit</button>
		
		</form>

	</c:if>
		
	
	<c:if test = "${lstTeachers != null}">
	
  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">DataTable with default features</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
             <table id="example1" style="boloder=1" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Date de naissance</th>
					<th>Email</th>
					<th>Institue</th>
					<th>Numéro de telephone</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="teatcher" items="${lstTeachers}" >
					<tr>
						<td>${teatcher.first_name}</td>
						<td>${teatcher.last_name}</td>
						<td>${teatcher.birthday}</td>
						<td>${teatcher.email}</td>
						<td>${teatcher.institution}</td>
						<td>${teatcher.phone}</td>
						<td>
							<button onclick="deleteTeacher(${teatcher.id})" >DELETE</button>
							<button ><a href="TeacherServlet?id=${teatcher.id}">Modifier</a></button>
							
						</td>
					</tr>
				</c:forEach>
	
			</tbody>
		</table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
		
		

		<script>
			function deleteTeacher(id){
		        
		        $.ajax({
		                method: "DELETE",
		                url: "/Examen_Achraf/TeacherServlet?id="+id,
		                success: function(data) {
		                	window.location.href="/Examen_Achraf/TeacherServlet";
		                },
		                error:  function(xhr, str){
		                        alert("Erreur lors de suppression")
		                }
		                }).done(function() {
		            });
		    }
			
			$(function () {
			    $("#example1").DataTable({
			      "responsive": true, "lengthChange": false, "autoWidth": false,
			      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
			    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
			    $('#example2').DataTable({
			      "paging": true,
			      "lengthChange": false,
			      "searching": false,
			      "ordering": true,
			      "info": true,
			      "autoWidth": false,
			      "responsive": true,
			    });
			  });
		</script>
			
	</c:if>


</jsp:attribute>
</mt:admin_template>

