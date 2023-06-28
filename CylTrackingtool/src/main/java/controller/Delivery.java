package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;

/**
 * Servlet implementation class Delivery
 */
@WebServlet("/Outgoing")
public class Delivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delivery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ArrayList<String> cyllist=new ArrayList<String>();
		
		for(int i=1;i<=10;i++)
		{
			System.out.println("cylno"+i);
			if(request.getParameter("cylno"+i)!="" && request.getParameter("cylno"+i)!=null)
			cyllist.add(request.getParameter("cylno"+i));
		}
		System.out.println(cyllist);
		String cust_id=request.getParameter("customerID");
		System.out.println("===============>>>>>>>>>>>>>>>Outgoing...>>>.."+cust_id);
		Dao.Delete_cyldata(cyllist);
		response.sendRedirect("Menu.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
