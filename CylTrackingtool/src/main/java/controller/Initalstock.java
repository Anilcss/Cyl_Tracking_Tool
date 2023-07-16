package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Checkforvalue.cyl_ispresent;
import Model.Dao;

/**
 * Servlet implementation class Initalstock
 */
@WebServlet("/initialstock")
public class Initalstock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Initalstock() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		ArrayList<String> cyllist=new ArrayList<String>();
		String cyltype=request.getParameter("cyltypein");
		String cust_id=request.getParameter("customerID");
		for(int i=1;i<=10;i++)
		{
			if(request.getParameter("cylno"+i)!="" && request.getParameter("cylno"+i)!=null)
			cyllist.add(request.getParameter("cylno"+i));
		}
		boolean check=true;
		
		boolean check_forinitial=(cyl_ispresent.isincustholding_initialstock(cyllist) || cyl_ispresent.isinyardfor_initialstock(cyllist));
		
		if(check && !check_forinitial) {
		Dao.insert_cly_data(cyllist,cust_id);
		response.sendRedirect("Menu.jsp");
		}
		else {
			System.out.println("enable the neg stock in boolean in initialstock.java"+"or Cylinder already in stock");
		}
		
	}

}
