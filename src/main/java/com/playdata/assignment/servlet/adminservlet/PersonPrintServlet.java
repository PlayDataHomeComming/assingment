package com.playdata.assignment.servlet.adminservlet;

import com.playdata.assignment.dao.AdminDao;
import com.playdata.assignment.dto.Person;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PersonPrintServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Person> people=new AdminDao().printPerson();
        req.setAttribute("people",people);
        req.getRequestDispatcher("modeselect/admin/adminselect/personprint.jsp").forward(req,resp);
    }


}
