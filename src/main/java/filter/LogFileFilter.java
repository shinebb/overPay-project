package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter {
	//8차시 로그 기록
	PrintWriter writer;
	
	public void init(FilterConfig config) throws ServletException {
		String filename = config.getInitParameter("filename");
		
		if(filename == null)
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch(IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws java.io.IOException, ServletException {
//		첫 번째 매개변수 ServletRequest 객체는 체인을 따라 전달하는 요청이고, 
//		두 번째 매개변수 ServletResponse 객체는 체인을 따라 전달할 응답
//		세 번째 매개변수 FilterChain 객체는 체인에서 다음 필터를 호출하는 데 사용
//		만약 호출 필터가 체인의 마지막 필터이면 체인의 끝에서 리소스를 호출
		
		writer.println(" 접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		writer.println(" 접근한 URL 경로 : " + getURLPath(request));
		writer.println(" 요청 처리 시작 시각 : " + getCurrentTime());
		
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		writer.println(" 요청 처리 종료 시각 : " + getCurrentTime());
		writer.println(" 요청 처리 소요 시간 : " + (end - start) + "ms ");
		writer.println("==================================================================");
	}
	public void destroy() {
		writer.close();
	}
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
		}
		return currentPath + queryString;
	}
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(calendar.getTime());
	}

}
