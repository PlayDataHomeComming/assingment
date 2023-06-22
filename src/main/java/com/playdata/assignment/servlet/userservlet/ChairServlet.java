package com.playdata.assignment.servlet.userservlet;

import com.playdata.assignment.dao.UserDao;
import com.playdata.assignment.dto.Chair;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ChairServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Chair> chairs = new UserDao().getChair(req.getParameter("pcId"));
        if((req.getParameter("chairId"))==null) {req.setAttribute("chairId","원하는&nbsp;좌석을&nbsp;클릭해주세요");}

        else {req.setAttribute("chairId",req.getParameter("chairId"));}
        req.setAttribute("pcId",req.getParameter("pcId"));
        req.setAttribute("chairs",chairs);
        req.setAttribute("error",req.getParameter("error")+"");
        req.getRequestDispatcher("modeselect/user/userselect/chair.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         int check=new UserDao().changeStatusAndPersonInsert(req.getParameter("id")+"",req.getParameter("name")+"",req.getParameter("phoneNum")+"");
            if(check==1){
            resp.sendRedirect("/chairprint?pcId="+req.getParameter("pcId")+"&error=1");
        } else if (check==2) {
            resp.sendRedirect("/chairprint?pcId="+req.getParameter("pcId")+"&error=2");
        } else {
            resp.sendRedirect("/usermain");
        }

    }
}