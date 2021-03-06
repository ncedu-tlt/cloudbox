/*
 * Copyright 2015 zvyagintsev.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ru.ncedu.tlt.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ru.ncedu.tlt.controllers.UserController;
import ru.ncedu.tlt.entity.User;
import ru.ncedu.tlt.filter.FilterSettingsXML;

/**
 *
 * @author zvyagintsev
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @EJB
    UserController ucEjb;

    @EJB
    FilterSettingsXML filtSettings;

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String userPass = request.getParameter("userPass");

        User user = null;
        if (userName != null) {
            if (!"".equals(userName)) {
                user = ucEjb.findUser(userName);
            }
        }

        if (user != null) {
            System.out.println("finded user " + user.toString());
            user.setPass(userPass);
            if (!ucEjb.login(user)) {
                user = null;
            }
        }

        if (user != null) {
            System.out.println("user logged roles: " + user.rolesToString());

            request.getSession().setAttribute("userName", user.getName());
            request.getSession().setAttribute("userId", user.getId());
            request.getSession().setAttribute("logged", true);
            request.getSession().setAttribute("userroles", user.rolesToString());

            response.sendRedirect(filtSettings.getFirstAllowebPage(user));
        } else {
            request.setAttribute("message", "Не удалось авторизоваться");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
