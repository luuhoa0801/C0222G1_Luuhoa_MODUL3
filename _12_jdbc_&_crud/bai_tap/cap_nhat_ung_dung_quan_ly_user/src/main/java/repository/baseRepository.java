package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class baseRepository {
    private static final String URL ="jdbc:mysql://localhost:3306/demo?useSSL=false"; // s?a l?i tên c?a csdl
    private static final String USER ="root";// m?c ??nh c?a mysql
    private static final String PASS ="luuhoa0801";// do cài ??t khi cài ??t mysql
    public static Connection getConnectDB(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection(URL,USER,PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
