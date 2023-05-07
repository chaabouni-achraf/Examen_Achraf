package tn.iit.jee.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.jee.dao.HibernateUtil;
import tn.iit.jee.model.Teacher;

/**
 * Servlet implementation class ImportTeacher
 */

@MultipartConfig
@WebServlet("/ImportTeacher")
public class ImportTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ServletContext application = getServletContext();
		RequestDispatcher rd = null;
		
		rd = application.getRequestDispatcher("/ImportTeacher.jsp");
		rd.forward(request, response);
    }
    
    public boolean importTeachers(String filePath) {
        try{
        	 BufferedReader reader = new BufferedReader(new FileReader(filePath));
             List<Teacher> lstTeachers = new ArrayList<>();
            String line;
            reader.readLine();
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");
                String first_name = data[0].trim().replaceAll("\"", "");
                String last_name = data[1].trim().replaceAll("\"", "");
                Date birthday = null;
    			DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
    			try {
    				birthday = (Date) df.parse(data[2].trim().replaceAll("\"", ""));
                } catch (ParseException e) {
                    e.printStackTrace();
                }
    			
                String email = data[3].trim().replaceAll("\"", "");
                String institution = data[4].trim().replaceAll("\"", "");
                String phone = data[5].trim().replaceAll("\"", "");
                lstTeachers.add(new Teacher(first_name, last_name, birthday, email, institution, phone));
            }
            Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			lstTeachers.forEach((Teacher teacher) -> {
				session.save(teacher);
	        });
			tx.commit();
            return true;
        } catch (IOException  e) {
            e.printStackTrace();
            return false;
        }
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletFileUpload upload = new ServletFileUpload();
	    Part filePart = request.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = getServletContext().getRealPath("/WEB-INF/uploads/" + fileName);
        filePart.write(filePath);

        boolean success = importTeachers(filePath);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/ListTeacherServlet");
        } else {
            // handle import failure
        }
	}

}
