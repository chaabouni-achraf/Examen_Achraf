<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="content">


   <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Modifier enseignant(e) </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Accueil</a></li>
              <li class="breadcrumb-item active">Modifier enseignant(e)</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">Modifier enseignant(e)</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
            
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
      
			<form action="ModifierTeacher" method="POST">
			<c:if test = "${currentTeacher != null}">
				<input type="hidden" name="id" id="id"  value="${currentTeacher.id}">
			</c:if> 
           
            <div class="row">
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Prénom</label>
                 <input class="form-control" type="text" name="last_name" id="last_name" value="${currentTeacher.last_name}">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Nom</label>
                  <input class="form-control" type="text" name="first_name" id="first_name"  value="${currentTeacher.first_name}">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            
              <div class="row">
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Date de naissance</label>
                 <input class="form-control" type="date" name="birthday" id="birthday" 
			value="<fmt:formatDate value="${currentTeacher.birthday}" pattern="yyyy-MM-dd" />">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Email</label>
                 <input class="form-control" type="text" name="email" id="email" value="${currentTeacher.email}">	
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            
            
              <div class="row">
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Institution</label>
                 <input class="form-control" type="text" name="institution" id="institution" value="${currentTeacher.institution}">
				
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-6 col-sm-6">
                <div class="form-group">
                  <label>Téléphone</label>
                 	<input class="form-control" type="text" name="phone" id="phone" value="${currentTeacher.phone}">
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            
            <br>
			
			<button type="submit" class="btn btn-primary" >Modifier</button>
			 <c:if test = "${currentTeacher != null}"><button class="btn btn-primary" onclick="deleteTeacher(${currentTeacher.id})" >DELETE</button></c:if>
            </form>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
         
        </div>
       
      </div>
      <!-- /.container-fluid -->
    </section>
   
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
			</script>


</jsp:attribute>
</mt:admin_template>

