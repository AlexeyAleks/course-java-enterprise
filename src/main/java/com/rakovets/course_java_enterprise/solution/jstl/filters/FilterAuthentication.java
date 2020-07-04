package com.rakovets.course_java_enterprise.solution.jstl.filters;

import com.rakovets.course_java_enterprise.solution.jstl.service.authentication.ServiceAuthentication;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter(urlPatterns = "/authentication")
public class FilterAuthentication implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        String login = servletRequest.getParameter("login");
        String password = servletRequest.getParameter("password");
        boolean resultCheck = ServiceAuthentication.getInstance().checkNameAndPassword(login, password);
        if (resultCheck) {
            servletRequest.getRequestDispatcher("/authentication")
                    .forward(servletRequest,servletResponse);
        } else {
            servletRequest.getRequestDispatcher("/WEB-INF/jsp/authentication/formAuthenticationFailure.jsp")
                    .forward(servletRequest,servletResponse);
        }
    }
}
