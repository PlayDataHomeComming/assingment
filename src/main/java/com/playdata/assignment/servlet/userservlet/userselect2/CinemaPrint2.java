package com.playdata.assignment.servlet.userservlet.userselect2;

import com.playdata.assignment.dao.AdminDao;
import com.playdata.assignment.dto.Cinema;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CinemaPrint2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cinema> cinemas=new AdminDao().getCinema();
        req.setAttribute("cinemas",cinemas);
        req.getRequestDispatcher("modeselect/user/userselect/userselect2/cinemaprint2.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("/userselect2previewprint?cinemaId="+req.getParameter("cinemaId"));
    }
}
