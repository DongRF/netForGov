package Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Pojo.FixedData;
import Service.IndexService;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String searchWord = new String(request.getParameter("searchWord").getBytes("iso-8859-1"), "utf-8");
		IndexService indexService = new IndexService();
		List<FixedData> list = indexService.getSearchNews(searchWord);
		Gson gson = new Gson();
		String str = gson.toJson(list);
		
		//System.out.println(str);
		
		response.setContentType("application/text; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(str);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		IndexService indexService = new IndexService();
		List<FixedData> list = indexService.getTodayNews(id);
		Gson gson = new Gson();
		String str = gson.toJson(list);
		
		//System.out.println(str);
		
		response.setContentType("application/text; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(str);
	}

}
