package com.playdata.assignment.servlet.userservlet.userselect1;

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

public class CinemaPrint extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cinema> cinemas=new UserDao().relatedCinemaPrint(req.getParameter("previewId")+"");
        req.setAttribute("cinemas",cinemas);
        req.getRequestDispatcher("/modeselect/user/userselect/userselect1/cinemaprint.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/chairprint?pcId="+req.getParameter("pcId"));
    }
}
