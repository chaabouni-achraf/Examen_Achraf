package tn.iit.jee.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class ModifierTeacher
 */
@WebServlet("/ModifierTeacher")
public class ModifierTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierTeacher() {
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
		int id = Integer.parseInt(request.getParameter("id").replaceAll("[^\\.0123456789]",""));
	
		Teacher currentTeacher = (Teacher) session.get(Teacher.class, id);
		request.setAttribute("currentTeacher", currentTeacher);
	
		
		rd = application.getRequestDispatcher("/EditTeacherUpdate.jsp");
		rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		int id = Integer.parseInt(request.getParameter("id"));
		Teacher teacher = new Teacher(id, first_name, last_name, birthday, email, institution, phone);
		session.update(teacher);
		
		tx.commit();
		response.sendRedirect(request.getContextPath() + "/ListTeacherServlet");
	}

}
