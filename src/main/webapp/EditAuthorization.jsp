<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">

    
<c:if test = "${lstAuthorizations == null}">

 <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Liste des autorisation</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Accueil</a></li>
              <li class="breadcrumb-item active">Autorisation</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
    <section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
	<div class="card-header">
            <h3 class="card-title">Ajouter Autorisation</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
          
            </div>
          </div>
      
       <div class="card-body">
			<form action="AuthorizationServlet" method="POST">
			
			<br>
			<label>Enseignant</label>
			<select class="form-control select2bs4" name="id_teacher" style="width: 100%;">
			<option value="" disabled selected hidden>Enseignant(e)</option>
				<c:forEach var="teatcher" items="${lstTeachers}" >
					<option value="${teatcher.id}">${teatcher.first_name} ${teatcher.last_name}</option>
				</c:forEach>
             </select>
			<br>
			<label>Date début</label>
			<input type="date" class="form-control" name="startDate" id="startDate"  value="<fmt:formatDate value="${currentAuthorization.startDate}" pattern="yyyy-MM-dd" />" readonly >
			<br>
			<label>Date fin</label>
			<input type="date" class="form-control" name="endDate" id="endDate"  value="<fmt:formatDate value="${currentAuthorization.endDate}" pattern="yyyy-MM-dd" />" readonly>
			
			<br>
			<label>durée</label>
			<input type="text" class="form-control" name="duration" id="duration" value="${currentAuthorization.duration}" readonly >	
			
			<br>		
			<button  class="btn btn-primary" type="submit" >Submit</button>
			
			</form>
       
       </div>
     </div>
     	   </div>
     	   </div>
      <!-- /.container-fluid -->
    </section>
		<c:if test = "${currentAuthorization != null}">
			<script>
			$('#institution').val("${currentAuthorization.institution}"");
			$('#id_teacher').val("${currentAuthorization.teacher.id});
			</script>
		
		</c:if>
    
	</c:if>
	
	
	<c:if test = "${lstAuthorizations != null}">
	<div class="card">
        <div class="card-header">
         <h3 class="card-title text-uppercase" >Liste des autorisation</h3>
       </div>
       <div class="card-body">
   	
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Enseignant</th>
					<th>Institution</th>
					<th>Date début</th>
					<th>Date fin</th>
					<th>Druée</th>
					<th>Druée</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="authorization" items="${lstAuthorizations}" >
					<tr>
						<td>${authorization.teacher.first_name} ${authorization.teacher.last_name}</td>
						<td>${authorization.institution}</td>
						<td><fmt:formatDate value="${authorization.startDate}" type="date" pattern="dd-MM-yyyy"/></td>
						<td><fmt:formatDate value="${authorization.endDate}" type="date" pattern="dd-MM-yyyy"/></td>
						<td>${authorization.duration}</td>
						
						<td>
						<button onclick="if(confirm('Are you sure you want to delete it?')) { deleteAuthorization(${authorization.id}); }"><i class="nav-icon fas fa-trash" style="color: #007bff;"></i></button>
						
							<button ><a href="AuthorizationServlet?id=${authorization.id}"><i class="nav-icon fas fa-plus"></i></a></button>
							
						
						</td>
					</tr>
				</c:forEach>
	
			</tbody>
		</table>
		
		
		<script>
			function deleteAuthorization(id){
		        
		        $.ajax({
		                method: "DELETE",
		                url: "${pageContext.request.contextPath}/AuthorizationServlet?id="+id,
		                success: function(data) {
		                	window.location.href="${pageContext.request.contextPath}/ListAuthorizationServlet";
		                },
		                error:  function(xhr, str){
		                        alert("Erreur lors de suppression")
		                }
		                }).done(function() {
		            });
		    }
			
			$(document).ready(function () {
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
       
       </div>
     </div>
			
	</c:if>


</jsp:attribute>
</mt:admin_template>

