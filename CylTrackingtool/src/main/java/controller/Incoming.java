package controller;

import java.io.IOException;

import java.util.ArrayList;
import java.lang.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Dao;

/**
 * Servlet implementation class Incoming
 */
@WebServlet("/Incoming")
public class Incoming extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Incoming() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println(request.getParameter("clyname1"));
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		

		ArrayList<String> cyllist=new ArrayList<String>();
		
		for(int i=1;i<=10;i++)
		{
			System.out.println("cylno"+i);
			if(request.getParameter("cylno"+i)!="" && request.getParameter("cylno"+i)!=null)
			cyllist.add(request.getParameter("cylno"+i));
		}
		//System.out.println(cyllist);
		String cyltype=request.getParameter("cyltypein");
		String cust_id=request.getParameter("customerID");
		
		System.out.println("===============>>>>>>>>>>>>>>>>>>.."+cust_id+"   customer id");
		boolean check=false;
		check=Dao.delete_from_customerholding(cyllist,cust_id);
		System.out.println("=========================================="+check);
		if(check) {
		Dao.insert_cly_data(cyllist,cust_id);
		response.sendRedirect("Menu.jsp");
		}
		else {
				
				
					System.out.println("Error in inserting into yard cylinder numer"+cyllist);
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
			response.sendRedirect("Menu.jsp");
				
			
		}
		
		
		
	}
	
	
	

}
