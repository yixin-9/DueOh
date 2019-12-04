package DueOh;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddAssignmentGuest")
public class AddAssignmentGuest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddAssignmentGuest() {
		super();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String className = request.getParameter("className").trim();
		String assignmentName = request.getParameter("assignmentName");
		String dueDate = request.getParameter("dueDate");
		String nextPage = "/profileGuestEnd.jsp";
		
		System.out.println("className = " + className);
		System.out.println("assignmentName = " + assignmentName);
		System.out.println("DueDate = " + dueDate);
		
		session.setAttribute("className", className);
		session.setAttribute("assignmentName", assignmentName);
		session.setAttribute("dueDate", dueDate);

		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}

}
