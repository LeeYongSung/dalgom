package com.java.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CORSFilter implements Filter {
	
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;
        response.setHeader("Access-Control-Allow-Origin", "*"); 
        /* 요청을 허용하는 출처. * 이면 모든곳에 공개되어 있음을 의미한다. */
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT"); 
        /* 요청을 허용하는 메서드. 기본값은 GET,POST 라고 보면된다. 이 해더가 없으면 GET과 POST요청만 가능하다. 만약 이해더가 지정이 되어 있으면, 클라이언트에서는 해더 값에 해당하는 메서드일 경우에만 실제 요청을 시도하게 된다. */
        response.setHeader("Access-Control-Max-Age", "3600"); 
        /* 클라이언트에서 preflight 의 요청 결과를 저장할 기간을 지정. 클라이언트에서 preflight 요청의 결과를 저장하고 있을 시간이다. 해당 시간동안은 preflight요청을 다시 하지 않게 된다. */
        response.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept"); 
        /* 요청을 허용하는 해더. */
        chain.doFilter(req, res);
    }

    public void init(FilterConfig filterConfig) {}

    public void destroy() {}

}
