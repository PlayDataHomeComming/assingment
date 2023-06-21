package com.playdata.assignment.servlet.adminservlet;

import com.playdata.assignment.dao.AdminDao;
import com.playdata.assignment.dto.Cinema;
import com.playdata.assignment.dto.Preview;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CinemaInsertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cinema> cinemas = new AdminDao().cinemaList();
        req.setAttribute("cinemas", cinemas);
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
