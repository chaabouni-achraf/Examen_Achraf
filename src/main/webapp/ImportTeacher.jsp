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
            <h1>Importer enseignant(e) </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Accueil</a></li>
              <li class="breadcrumb-item active">Importer enseignant(e)</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	<div class="card">
       
       <div class="card-body">
       <form action="ImportTeacher" method="post" enctype="multipart/form-data">
       	
            <div class="form-group">
              <label for="exampleInputFile">Fichier</label>
              <div class="input-group">
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="file" name="file">
                  <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary m-3">Import</button>
          </div>
   		</form>
       </div>
     </div>
      
</jsp:attribute>
</mt:admin_template>