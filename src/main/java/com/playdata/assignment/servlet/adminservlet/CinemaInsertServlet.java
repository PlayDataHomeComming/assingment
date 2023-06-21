package com.playdata.assignment.servlet.adminservlet;

import com.playdata.assignment.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CinemaInsertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/modeselect/admin/adminselect/cinemainsert.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cinemaName=req.getParameter("cinemaName");
        String moviePlace=req.getParameter("moviePlace");
        String chairNum=req.getParameter("chairNum");
        new AdminDao().cinInsert(cinemaName,moviePlace,chairNum);
        resp.sendRedirect("/admincinemainsert");


    }
}
