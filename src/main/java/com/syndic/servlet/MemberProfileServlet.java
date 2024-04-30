package com.syndic.servlet;

import com.syndic.beans.Member;
import com.syndic.beans.User;
import com.syndic.connection.Syndic_con;
import com.syndic.dao.MemberProfileDAO;
import com.syndic.dao.MemberProfileDAOImpl;

import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class  MemberProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MemberProfileDAO memberDAO;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("memberprofile.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("test");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String codepostal = request.getParameter("codepostal");
        String phonenumber = request.getParameter("phonenumber");
        String fulladdress = request.getParameter("fulladdress");
        String mail = request.getParameter("mail");
        System.out.println("test" + firstname);

        try {
            Connection connection = Syndic_con.getConnection();
            // connection = Syndic_con.getConnection();
            System.out.println("post");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userId = user.getIdUser();

            memberDAO = new MemberProfileDAOImpl(connection);
            Member member = memberDAO.getMemberByUserId(userId);

            member.setFirstName(firstname);
            System.out.println("upup" + firstname);
            member.setLastName(lastname);
            member.setCodepostal(codepostal);
            member.setPhoneNumber(phonenumber);
            member.setFulladdress(fulladdress);
            member.setMail(mail);
            member.setUserId(userId);

            memberDAO.updateMember(member);
            session.setAttribute("member", member);
            System.out.println("succès " + firstname);
            RequestDispatcher dispatcher = request.getRequestDispatcher("memberprofile.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            System.out.println("echec " + firstname);
            e.printStackTrace();
            System.out.println(e);
            RequestDispatcher dispatcher = request.getRequestDispatcher("memberprofile.jsp");
            dispatcher.forward(request, response);

        }


    }
}
