<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:admin_template>
<jsp:attribute name="addHeader">
	<style>
       
      @media print {
             body * {
                 visibility: hidden;
             }
             #printAuth {
                 position: absolute;
                 top: 0;
                 width: 100%;
                 visibility: visible;
             }
             #printAuth ,#printAuth *{
                 visibility: visible;
             }
         }
              
      </style>
</jsp:attribute>
<jsp:attribute name="content">


   	<div id="printAuth" class="m-2 p-4 w-100">
                <div class="border border-secondary ">
                    <div class="form-row m-2 p-3" style="background-color:#afb2b6">
                        <div class="col-md-2 ml-4">
                            <img src="${pageContext.request.contextPath}//assets/admin/dist/img/IITLogo.png" class="mx-auto" height="50" alt="LOGO IIT">
                        </div>
                        <div class="col-md   align-self-end">
                            <h2 class="text-center text-white font-weight-bold mb-0">Authorisation d'activite</h2>
                        </div>
                        <div class="col-md-2  mb-0 align-self-end">
                            <h6 class=" mr-2 float-md-right text-white"><fmt:formatDate value="${authorization.startDate}" type="date" pattern="yyyy"/> - <fmt:formatDate value="${authorization.startDate}" type="date" pattern="yyyy"/></h6>
                        </div>
                    </div>

                    <br>
                    <br>
                    <div class="px-4 w-100">
                        <div class="form-row">
                            <div class="col-md-3 mb-3">
                                <div class="form-row mb-3">
                                    <h4>Enseignant: </h4>
                                </div>
                                <div class="form-row mb-3">
                                    <h4>Institution: </h4>
                                </div>
                                <div class="form-row mb-3">
                                    <h4>Date début: </h4>
                                </div>
                                <div class="form-row mb-3">
                                    <h4>Date fin: </h4>
                                </div>
                                <br>
                                <div class=" form-row mb-3">
                                    <h4>Druée: </h4>
                                </div>
                                
                            </div>
                            <div class="col-md mb-3">
                                <div class="form-row mb-3">
                                    <h5 class="my-auto" >${authorization.teacher.first_name} ${authorization.teacher.last_name}</h5>
                                </div>
                                <div class="form-row mb-3">
                                    <h5 class="my-auto" >${authorization.institution}</h5>
                                </div>
                                <br>
                                <div class="form-row mb-3">
                                    <h5 ><fmt:formatDate value="${authorization.startDate}" type="date" pattern="dd-MM-yyyy"/></h5>
                                </div>
                                <div class="form-row mb-3">
                                    <h5 ><fmt:formatDate value="${authorization.endDate}" type="date" pattern="dd-MM-yyyy"/></h5>
                                </div>
                                <br>
                                <br>
                                <div class=" form-row mb-3">
                                    <h5 >${authorization.duration}</h5>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col-md">
                                <h6 class="text-center ">SIGNATURE D' ADMINISTRATION</h6>
                            </div>
                        </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    </div>
                </div>
            </div>

</jsp:attribute>
</mt:admin_template>

