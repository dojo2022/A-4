package filter;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LoginFilter implements Filter {

  @Override
  public void destroy() {

  }

  @Override
  public void doFilter(
    ServletRequest req,
    ServletResponse resp,
    FilterChain filterChain)
    throws IOException, ServletException {

    filterChain.doFilter(req, resp);
  }

  @Override
  public void init(FilterConfig filterConfig)
  throws ServletException {

  }

}