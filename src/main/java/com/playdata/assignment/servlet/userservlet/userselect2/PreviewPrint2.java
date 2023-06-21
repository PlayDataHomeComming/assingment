package com.playdata.assignment.servlet.userservlet.userselect2;

import com.playdata.assignment.dao.AdminDao;
import com.playdata.assignment.dao.UserDao;
import com.playdata.assignment.dto.Cinema;
import com.playdata.assignment.dto.Preview;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PreviewPrint2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Preview> previews=new UserDao().relatedPreviewPrint(req.getParameter("cinemaId"));
        req.setAttribute("previews",previews);
        req.getRequestDispatcher("modeselect/user/userselect/userselect2/previewprint2.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/chairprint?pcId="+req.getParameter("pcId"));

    }
}
