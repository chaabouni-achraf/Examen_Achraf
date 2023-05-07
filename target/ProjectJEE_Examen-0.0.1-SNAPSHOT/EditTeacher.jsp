<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">
<!--<jsp:include page="/Navbar.jsp"/>-->
<c:if test = "${currentTeacher != null}"><button onclick="deleteTeacher(${currentTeacher.id})" >DELETE</button></c:if>
	<form action="TeacherServlet" method="POST">
	
	<c:if test = "${currentTeacher != null}">
		<input type="hidden" name="id" id="id"  value="${currentTeacher.id}">
	</c:if> 
	
	<h1>Nouveau enseignant</h1>
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
	
	
	<br><br><br>
	<table style="boloder=1">
		<thead>
			<tr>
				<th>Nom</th>
				<th>Prénom</th>
				<th>Date de naissance</th>
				<th>Email</th>
				<th>Institue</th>
				<th>Numéro de telephone</th>
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
	<script>
	function deleteTeacher(id){
        
        $.ajax({
                method: "DELETE",
                url: "/ProjectJEE_Examen/TeacherServlet?id="+id,
                success: function(data) {
                	window.location.href="/ProjectJEE_Examen/TeacherServlet";
                },
                error:  function(xhr, str){
                        alert("Erreur lors de suppression")
                }
                }).done(function() {
            });
    }
	</script>


</jsp:attribute>
</mt:admin_template>

