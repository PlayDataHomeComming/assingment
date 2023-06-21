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

public class Combine2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer previewId=Integer.parseInt( req.getParameter("previewId"));
        System.out.println(previewId);
        List<Cinema> cinemas=new AdminDao().getCinema();
        req.setAttribute("previewId",previewId);
        req.setAttribute("cinemas",cinemas);
        req.getRequestDispatcher("modeselect/admin/adminselect/combine2.jsp").forward(req,resp);
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer cinemaId=Integer.parseInt(req.getParameter("cinemaId"));
        Integer previewId=Integer.parseInt(req.getParameter("previewId"));
        new AdminDao().insertCombinePreview(previewId+"",cinemaId+"");
        resp.sendRedirect("/adminmain");
    }
}
