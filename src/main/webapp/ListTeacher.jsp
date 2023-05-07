<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">
	
	
	<div class="card">
       <div class="card-header">
         <h3 class="card-title text-uppercase" >Liste des Enseignant(e)</h3>
       </div>
       <div class="card-body">
       		
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>
				    <th>Prénom</th>
					<th>Nom</th>
					<th>Date de naissance</th>
					<th>Email</th>
					<th>Institue</th>
					<th>Téléphone</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="teatcher" items="${lstTeachers}" >
					<tr>
					<td>${teatcher.last_name}</td>
						<td>${teatcher.first_name}</td>
						<td><fmt:formatDate value="${teatcher.birthday}" type="date" pattern="dd-MM-yyyy"/></td>
						<td>${teatcher.email}</td>
						<td>${teatcher.institution}</td>
						<td>${teatcher.phone}</td>
						
						<td>
						<button ><a href="ModifierTeacher?id=${teatcher.id}"><i class="nav-icon fas fa-edit"></i> </a></button>
							
							<button onclick="if(confirm('Are you sure you want to delete it?')) { deleteTeacher(${teatcher.id}); }"><i class="nav-icon fas fa-trash" style="color: #007bff;"></i></button>

							
						</td>
					</tr>
				</c:forEach>
	
			</tbody>
		</table>
		
		<script>
			function deleteTeacher(id){
		        
		        $.ajax({
		                method: "DELETE",
		                url: "${pageContext.request.contextPath}/TeacherServlet?id="+id,
		                success: function(data) {
		                	window.location.href="${pageContext.request.contextPath}/ListTeacherServlet";
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
			

</jsp:attribute>
</mt:admin_template>

