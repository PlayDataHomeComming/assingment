package com.playdata.assignment.servlet.adminservlet;

import com.playdata.assignment.dao.AdminDao;
import com.playdata.assignment.dto.Preview;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Combine1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Preview> previews=new AdminDao().getPreview();
        req.setAttribute("previews",previews);
        req.getRequestDispatcher("modeselect/admin/adminselect/combine1.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/admincombine2?previewId="+req.getParameter("previewId"));

    }
}
