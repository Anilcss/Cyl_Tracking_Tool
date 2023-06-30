package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cylmasters;

/**
 * Servlet implementation class Cylindermasters
 */
@WebServlet("/Cylindermasters12")
public class Cylindermasters extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cylindermasters() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Cylmasters cylmat = new Cylmasters();
		ArrayList<String> cylrec = new ArrayList<String>();
		/// HashMap<String> cylrec= new HashMap<>();
		for (int i = 1; i < 5; i++) {
			if ((request.getParameter("cylnomaster" + i) != "") && request.getParameter("cyltype" + i) != ""
					&& request.getParameter("cylmake" + i) != "" && request.getParameter("cyldom" + i) != ""
					&& request.getParameter("cyldot" + i) != "" && request.getParameter("cycap" + i) != "") {
				cylrec.add(request.getParameter("cylnomaster" + i));
				cylrec.add(request.getParameter("cyltype" + i));
				cylrec.add(request.getParameter("cylmake" + i));
				cylrec.add(request.getParameter("cyldom" + i));
				cylrec.add(request.getParameter("cyldot" + i));
				cylrec.add(request.getParameter("cycap" + i));
				System.out.println(cylrec);
				cylmat.insert_Cyl_masters(cylrec);
			}
				cylrec.clear();

		}
		response.sendRedirect("Cylindermaster.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
