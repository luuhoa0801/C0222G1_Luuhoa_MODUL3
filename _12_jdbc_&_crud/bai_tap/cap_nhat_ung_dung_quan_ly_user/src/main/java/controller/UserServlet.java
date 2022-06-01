package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UserServlet",urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
        action="";
    }
        switch (action){
        case "add":
            // tr? v? m?t form thêm m?i
            save(request,response);
            break;
        case "sort":
            sort(request,response);
            break;
        case "edit":
            updateUser(request,response);
            break;
        case "search":
            searchByCountry(request,response);
            break;
        default:
    }
}

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = userService.findById(id);
        user.setName(name);
        user.setEmail(email);
        user.setCountry(country);
        userService.update(id,user);
        request.setAttribute("user", user);
        request.setAttribute("mess", "update thành công");
        try {
            List<User> userList= userService.findAllUser();
            request.setAttribute("userList",userList);
            request.getRequestDispatcher("view/user/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "add":
                // tr? v? m?t form thêm m?i
                showFormCreate(request,response);
                break;
            case "sort":
                break;
            case "edit":
                showEditUser(request,response);
                break;
            case "search":
                searchByCountry(request,response);
                break;
            default:
                ListUser(request,response);
        }
    }

    private void showEditUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        request.setAttribute("user", user);
        try {
            request.getRequestDispatcher("view/user/edit.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void sort(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.sort();
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("view/user/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        if (country == null){
            country = "";
        }
        List<User> userList = userService.search(country);
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("view/user/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/user/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void ListUser(HttpServletRequest request, HttpServletResponse response) {
       List<User> userList= userService.findAllUser();
       request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("view/user/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name =request.getParameter("name");
        String email =request.getParameter("email");
        String country =request.getParameter("country");
        User user = new User(name,email,country);
        userService.save(user);
        request.setAttribute("mess", "Them moi thanh cong");
        ListUser(request,response);

    }
}
