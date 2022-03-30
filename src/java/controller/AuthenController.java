/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import entites.Account;
import entites.Customer;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.AccountFacade;
import sessions.CustomerFacade;

/**
 *
 * @author SE151117 - Nguyen Trong Tin
 */
public class AuthenController extends HttpServlet {

    @EJB
    private CustomerFacade cf;

    @EJB
    private AccountFacade af;

    
    
    
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getAttribute("action").toString();
        switch (action) {
            case "loginPage":
            case "registerPage":
                request.getRequestDispatcher(App.LAYOUT).forward(request, response);
                break;
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
    }

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
        processRequest(request, response);
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

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        Account user = af.getAccount(userName, password);
        if (user == null) {
            request.setAttribute("userName", userName);
            request.setAttribute("message", "Wrong username or password");
            request.setAttribute("action", "loginPage");
        } else {
            request.getSession().setAttribute("user", user);
            String uri = (String) request.getSession().getAttribute("uri");
            if (uri != null) {
                String array[] = uri.split("/");
                request.setAttribute("controller", array[array.length - 2]);
                request.setAttribute("action", array[array.length - 1].replace(".do", ""));
            } else {
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
        }
        request.setAttribute("userName", userName);
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);

    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName"),
                email = request.getParameter("email"),
                password = request.getParameter("password"),
                passwordConfirm = request.getParameter("passwordConfirm"),
                username = request.getParameter("userName"),
                phone = request.getParameter("phone"),
                address = request.getParameter("address"),
                message = "";
        request.setAttribute("fullName", fullName);
        request.setAttribute("email", email);
        request.setAttribute("userName", username);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);

        boolean checkEmail = af.isEmailExist(email);
        boolean checkUsername = af.isUsernameExist(username);
        boolean checkPhone = af.isPhoneExist(phone);
        int size = af.count();
        if (!checkEmail && !checkPhone && !checkUsername) {
            if (password.equals(passwordConfirm)) {
                Account user = new Account(size + 1, fullName, address, phone, email, username, password, true, "ROLE_CUSTOMER");
                request.setAttribute("user", user);
                af.create(user);
                Customer customer = new Customer(user.getId(), "normal", address);
                cf.create(customer);
                user.setCustomer(customer);
                af.edit(user);
                request.getSession().setAttribute("user", user);
            }
            String uri = (String) request.getSession().getAttribute("uri");
            if (uri != null) {
                String array[] = uri.split("/");
                request.setAttribute("controller", array[array.length - 2]);
                request.setAttribute("action", array[array.length - 1].replace(".do", ""));
            } else {
                request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
        } else {
            if (checkEmail) {
                message += "Email already exist<br/>";
            }
            if (checkUsername) {
                message += "Username already exist<br/>";
            }
            if (checkPhone) {
                message += "Phone number already exist";
            }
            request.setAttribute("message", message);
            request.setAttribute("action", "registerPage");
        }
        request.getRequestDispatcher(App.LAYOUT).forward(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}





