import controller.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCustomer",urlPatterns = "")
public class ServletCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Customer[] customer = new Customer[5];
        customer[0] = new Customer("Mai Van Hoan","1983-08-20","Ha Noi","img/h1.jpg");
        customer[1] = new Customer("Nguyen Van Nam","1983-08-20","Bac Ninh","img/h1.jpg");
        customer[2] = new Customer("Luu Hoa","1005-01-08","Quang Nam","img/h1.jpg");
        customer[3] = new Customer("Nguyen Van Hai","1995-01-01","Da Nang","img/h1.jpg");
        customer[4] = new Customer("Dang Thi Linh","1999-08-05","HCM","img/h1.jpg");

        request.setAttribute("listCustomer",customer);
        request.getRequestDispatcher("list_customer.jsp").forward(request,response);
    }
}
