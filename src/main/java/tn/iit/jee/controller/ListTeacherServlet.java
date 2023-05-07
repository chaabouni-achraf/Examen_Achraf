package tn.iit.jee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;

import tn.iit.jee.dao.HibernateUtil;
import tn.iit.jee.model.Teacher;

/**
 * Servlet implementation class ListTeacherServlet
 */
@WebServlet("/ListTeacherServlet")
public class ListTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTeacherServlet() {
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
		
		List<Teacher> lstTeachers = crit.list();
		int count = lstTeachers.size();
		lstTeachers.forEach(x -> System.out.println(x.toString()));
		
		request.setAttribute("lstTeachers", lstTeachers);
		rd = application.getRequestDispatcher("/ListTeacher.jsp");
		rd.forward(request, response);
	}
	
	
	
	
	

}
