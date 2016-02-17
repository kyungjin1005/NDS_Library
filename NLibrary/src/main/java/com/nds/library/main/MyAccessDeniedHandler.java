package com.nds.library.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class MyAccessDeniedHandler implements AccessDeniedHandler {

  private String errorPage;

  public void setErrorPage(String errorPage) {
    this.errorPage = errorPage;
  }

  @Override
  public void handle(HttpServletRequest req, HttpServletResponse resp, AccessDeniedException e)
    throws IOException, ServletException {
    //TODO 수행할 비즈니스 로직
    req.getRequestDispatcher(errorPage).forward(req, resp);
  }

}