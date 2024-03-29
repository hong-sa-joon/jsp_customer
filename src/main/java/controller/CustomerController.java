package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.CustomerDAO;
import DTO.Customer;

/**
 * Servlet implementation class customerController
 */
@WebServlet("/")
@MultipartConfig(maxFileSize = 1024 * 1024 * 50, location = "c:/Temp/img")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO dao;
	private ServletContext ctx;

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		dao = new CustomerDAO();
		ctx = getServletContext();

	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		String site = null;

		System.out.println("command: " + command);

		switch (command) {
		case "/index":
			site = getList(request);
			break;
		case "/view":
			site = getView(request);
			break;
		case "/write":
			site = "write.jsp";
			break;
		case "/insert":
			site = insertCustomer(request);
			break;
		case "/edit":
			site = getViewForEdit(request);
			break;
		case "/update":
			site = updateCustomer(request);
			break;
		case "/delete":
			site = deleteCustomer(request);
			break;
		default:

			break;
		}
		if (site.startsWith("redirect:/")) { // redirect 처리
			String rview = site.substring("redirect:/".length());
			response.sendRedirect(rview);
		} else {
			ctx.getRequestDispatcher("/" + site).forward(request, response);
		}
	}

	public String getList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<Customer> list;

		try {
			list = dao.getList();
			request.setAttribute("customerList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "고객 목록을 정상적으로 가져오지 못했습니다!");
		}
		return "index.jsp";
	}

	public String getView(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int customer_id = Integer.parseInt(request.getParameter("customer_id"));

		try {
			Customer c = dao.getView(customer_id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "고객 목록을 정상적으로 가져오지 못했습니다!");
		}
		return "view.jsp";
	}

	// 게시글 등록
	public String insertCustomer(HttpServletRequest request) {
		Customer c = new Customer();

		try {
			BeanUtils.populate(c, request.getParameterMap());

			// 1. 이미지 파일 서버(c:/Temp/img) 컴퓨터에 저장
			Part part = request.getPart("file"); // 파일에 대한 정보
			String fileName = getFilename(part); // 파일명 얻음

			// 업로드된 파일이 있는지 확인
			if (fileName != null && !fileName.isEmpty()) { // fileName이 null이 아니고 length()도 0이 아니라면
				part.write(fileName); // 서버에 파일 업로드

				// 2. 경로를 포함한 이미지 파일 이름을 Customer 객체에 저장
				c.setImg("/img/" + fileName);
			} else {
				c.setImg(null); // 업로드한 이미지가 없을 경우 null 저장
			}

			dao.insertCustomer(c);

		} catch (Exception e) {
			e.printStackTrace();

			try {
				// 쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 등록되지 않았습니다!", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}

		return "redirect:/index";
	}// 수정할 게시물의 기존 데이터를 가지고 와서 request 객체에 넣어준다.

	public String getViewForEdit(HttpServletRequest request) {
		int customer_id = Integer.parseInt(request.getParameter("customer_id"));

		try {
			Customer c = dao.getView(customer_id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "edit.jsp";
	}

	// 게시글을 수정해준다.
	public String updateCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		String origin_file = request.getParameter("origin_file");

		try {
			BeanUtils.populate(c, request.getParameterMap());

			Part part = request.getPart("file");
			String fileName = getFilename(part);

			if (fileName != null && !fileName.isEmpty()) {
				part.write(fileName);

				c.setImg("/img/" + fileName);
			} else { // 업로드된 파일이 없을 때
				if (origin_file == null || origin_file.equals("")) {
					c.setImg(null);
				} else {
					c.setImg(origin_file);
				}
			}

			dao.updateCustomer(c);

		} catch (Exception e) {
			e.printStackTrace();

			try {
				// 쿼리스트링의 한글깨짐을 방지하기 위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 수정되지 않았습니다!", "UTF-8");
				return "redirect:/view?customer_id=" + c.getCustomer_id() + "&error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}

		return "redirect:/view?customer_id=" + c.getCustomer_id();
	}

	// 게시글을 삭제해준다
	public String deleteCustomer(HttpServletRequest request) {
		int customer_id = Integer.parseInt(request.getParameter("customer_id"));

		try {
			dao.deleteCustomer(customer_id);
		} catch (Exception e) {
			e.printStackTrace();

			try {
				// 쿼리스트링의 한글깨짐을 방지하기 위해+ UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 삭제되지 않았습니다!", "UTF-8");
				return "redirect:/index?error=" + encodeName;
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}

		return "redirect:/index";
	}

	private String getFilename(Part part) {
		String fileName = null;

		String header = part.getHeader("content-disposition");

		System.out.print("Header => " + header);

		int start = header.indexOf("filename=");

		fileName = header.substring(start + 10, header.length() - 1);
		return fileName;
	}

}
