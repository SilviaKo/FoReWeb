package de.tum.fore.web.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.oauth2.client.resource.OAuth2AccessDeniedException;

public class LoginFilter implements Filter {

	private Logger log = LoggerFactory.getLogger(LoginFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		try {
			chain.doFilter(request, response);
		} catch(Exception e) {
			
			if(e.getCause() instanceof OAuth2AccessDeniedException) {
			
				HttpServletResponse res = (HttpServletResponse)response;
				HttpServletRequest req = (HttpServletRequest)request;
				
				log.debug("Redirecting to login page.");
				
				res.sendRedirect(req.getContextPath() + "/login");
			
			}
			
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
	
}
