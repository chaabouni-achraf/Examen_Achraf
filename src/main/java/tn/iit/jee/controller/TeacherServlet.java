package tn.iit.jee.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import tn.iit.jee.dao.HibernateUtil;
import tn.iit.jee.model.Teacher;


/**
 * Servlet implementation class TeacherServlet
 */
@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = getServletContext();
		RequestDispatcher rd = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria crit = session.createCriteria(Teacher.class);
			
		rd = application.getRequestDispatcher("/AjouterTeacher.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Date birthday = null;
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			try {
				birthday = (Date) df.parse(URLDecoder.decode(request.getParameter("birthday"), "UTF-8"));
            } catch (ParseException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.flushBuffer();
            }
			String first_name = request.getParameter("first_name");
			String last_name = request.getParameter("last_name");
			String email = request.getParameter("email");
			String institution = request.getParameter("institution");
			String phone = request.getParameter("phone");
			

			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
		
			Teacher teacher = new Teacher(first_name, last_name, birthday, email, institution, phone);
			session.save(teacher);
		
			tx.commit();
			response.sendRedirect(request.getContextPath() + "/ListTeacherServlet");
		}catch (Exception e) {
			System.err.println("Exception <DoPost>(TeacherServlet) "+e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Date birthday = null;
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			try {
				birthday = (Date) df.parse(URLDecoder.decode(request.getParameter("birthday"), "UTF-8"));
            } catch (ParseException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.flushBuffer();
            }
			int id = Integer.parseInt(request.getParameter("id"));
			String first_name = request.getParameter("first_name");
			String last_name = request.getParameter("last_name");
			String email = request.getParameter("email");
			String institution = request.getParameter("institution");
			String phone = request.getParameter("phone");
			Teacher teacher = new Teacher(id,first_name, last_name, birthday, email, institution, phone);
						
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.update(teacher);
			tx.commit();
			response.sendRedirect(request.getContextPath() + "/ListTeacherServlet");

		}catch (Exception e) {
			System.err.println("Exception <DoPost>(TeacherServlet) "+e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("id"));
		
		if(request.getParameter("id")!=null) {
			  
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Teacher teacher = (Teacher) session.get(Teacher.class, id);
			session.delete("id",teacher);
			tx.commit();
		}
		
		
		
	}

}
