package ETS.common;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

/***************************************************
 * @FileName : CorsFilter.java
 * @Description: 알 수 없음
 * @Author : 알 수 없음
 * @Version : 2020. 8. 14.
 * @Copyright : ⓒ ADUP. All Right Reserved
 ***************************************************/

public class CorsFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
		response.addHeader("Access-Control-Allow-Origin", "*");
        if (request.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request.getMethod())); {
            // CORS "pre-flight" request
            response.addHeader("Access-Control-Allow-Methods", "GET, POST");
            response.addHeader("Access-Control-Allow-Headers", "Authorization");
            response.addHeader("Access-Control-Max-Age", "1728000");
        }
        filterChain.doFilter(request, response);
	}

}
