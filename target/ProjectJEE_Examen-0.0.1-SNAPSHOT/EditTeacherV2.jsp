<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">
	<c:if test = "${lstTeachers == null}">
	<div class="card">
       <div class="card-header">
         <h3 class="card-title text-uppercase" >Nouveau enseignant</h3>
       </div>
       <div class="card-body">
       		<c:if test = "${currentTeacher != null}"><button onclick="deleteTeacher(${currentTeacher.id})" >DELETE</button></c:if>
			<form action="TeacherServlet" method="POST">
			
			<c:if test = "${currentTeacher != null}">
				<input type="hidden" name="id" id="id"  value="${currentTeacher.id}">
			</c:if> 
			
			
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
       
       </div>
     </div>

	</c:if>
		
	
	<c:if test = "${lstTeachers != null}">
	<div class="card">
       <div class="card-header">
         <h3 class="card-title text-uppercase" >LISTE DES  Enseignant</h3>
       </div>
       <div class="card-body">
       		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/fontawesome-free/css/all.min.css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
		
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Nom</th>
					<th>Prénom</th>
					<th>Date de naissance</th>
					<th>Email</th>
					<th>Institue</th>
					<th>Numéro de telephone</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="teatcher" items="${lstTeachers}" >
					<tr>
						<td>${teatcher.first_name}</td>
						<td>${teatcher.last_name}</td>
						<td><fmt:formatDate value="${teatcher.birthday}" type="date" pattern="dd-MM-yyyy"/></td>
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
		
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script>
			function deleteTeacher(id){
		        
		        $.ajax({
		                method: "DELETE",
		                url: "/ProjectJEE_Examen/TeacherServlet?id="+id,
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
			
	</c:if>


</jsp:attribute>
</mt:admin_template>

