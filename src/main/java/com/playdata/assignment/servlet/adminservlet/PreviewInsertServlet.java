package com.playdata.assignment.servlet.adminservlet;

import com.playdata.assignment.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PreviewInsertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("modeselect/admin/adminselect/previewinsert.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String movieName=req.getParameter("movieName");
        String movieDate=req.getParameter("movieDate");
        new AdminDao().preInsert(movieName,movieDate);
        resp.sendRedirect("/adminpreviewinsert");

    }
}
