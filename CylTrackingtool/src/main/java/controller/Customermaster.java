package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dbconnection.Dbconnection;

/**
 * Servlet implementation class Customermaster
 */
@WebServlet("/customermaster11")
public class Customermaster extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Customermaster() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  {
		// TODO Auto-generated method stub
		Dbconnection dbconnection = new Dbconnection();
		PreparedStatement preparedStatement = null;
		try {

			Connection connection = dbconnection.getConnection();
			String sql = "INSERT INTO newcusttable ( custcompname, custname, address1, address2, custemail, custphone1, custphone2, custGST) VALUES (?,?,?,?,?,?,?,?)";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, request.getParameter("comp_name"));
			preparedStatement.setString(2, request.getParameter("cust_name"));
			preparedStatement.setString(3, request.getParameter("address1"));
			preparedStatement.setString(4, request.getParameter("address2"));
			preparedStatement.setString(5, request.getParameter("email"));
			preparedStatement.setString(6, request.getParameter("phone_num"));
			preparedStatement.setString(7, request.getParameter("second_phone_num"));
			preparedStatement.setString(8, request.getParameter("GST_no"));
			int res=preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		finally {
			if(dbconnection!=null)
			{
				try {
					response.sendRedirect("customercreation.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				dbconnection.closeconnection();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
