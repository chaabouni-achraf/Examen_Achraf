package tn.iit.jee.controller;

import java.io.IOException;import org.hibernate.*;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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
import org.hibernate.Transaction;

import tn.iit.jee.dao.HibernateUtil;
import tn.iit.jee.model.Authorization;
import tn.iit.jee.model.Teacher;
import tn.iit.jee.model.Authorization;

/**
 * Servlet implementation class AuthorizationServlet
 */
@WebServlet("/AuthorizationServlet")
public class AuthorizationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorizationServlet() {
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
		Criteria crit = session.createCriteria(Authorization.class);
		int id = 0;
		if(request.getParameter("id")!=null)
			id = Integer.parseInt(request.getParameter("id").replaceAll("[^\\.0123456789]",""));
		if(id != 0) {
			Authorization authorization = (Authorization) session.get(Authorization.class, id);
			request.setAttribute("authorization", authorization);
			
			rd = application.getRequestDispatcher("/DisplayAuthorization.jsp");
			rd.forward(request, response);
		}else {
			Authorization currentAuthorization = new Authorization(new Date(),new Date(new Date().getYear(),11,31) );
			request.setAttribute("currentAuthorization", currentAuthorization);
			crit = session.createCriteria(Teacher.class);
			List<Teacher> lstTeachers = session.createQuery("select t from Teacher t where not exists (select 1 from Authorization a where a.startDate > :dateFin  and t=a.teacher  )").setTimestamp("dateFin", new Date(currentAuthorization.getStartDate().getYear(),01,01)).list();
			
			request.setAttribute("lstTeachers", lstTeachers);
			rd = application.getRequestDispatcher("/EditAuthorization.jsp");
			rd.forward(request, response);
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Date startDate = null;
			Date endDate = null;
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
			try {
				startDate = (Date) df.parse(URLDecoder.decode(request.getParameter("startDate"), "UTF-8"));
				endDate = (Date) df.parse(URLDecoder.decode(request.getParameter("endDate"), "UTF-8"));
            } catch (ParseException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.flushBuffer();
            }

			
			int id_teacher = Integer.parseInt(request.getParameter("id_teacher"));
			int duration = Integer.parseInt(request.getParameter("duration"));
			
			System.out.println("1-authTeacher : !!!!!!!!!!!!!!!!!!!!!!");	
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			Teacher authTeacher = (Teacher) session.get(Teacher.class, id_teacher);
			System.out.println("2- authTeacher : !!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("authTeacher : "+authTeacher);
			session.clear();
			Authorization Authorization = new Authorization(startDate, endDate, duration, authTeacher);
			System.out.println("Authorization : "+Authorization);
			session.save(Authorization);
			tx.commit();
			response.sendRedirect(request.getContextPath() + "/ListAuthorizationServlet");
		}catch (Exception e) {
			System.err.println("Exception <DoPost>(AuthorizationServlet) "+e.getMessage());
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
			Authorization Authorization = (Authorization) session.get(Authorization.class, id);
			session.delete("id",Authorization);
			tx.commit();
		}
		
		
		
	}


}
