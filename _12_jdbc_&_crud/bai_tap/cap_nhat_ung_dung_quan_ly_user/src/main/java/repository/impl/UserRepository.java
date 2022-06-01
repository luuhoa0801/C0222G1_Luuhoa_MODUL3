package repository.impl;

import model.User;
import repository.IUserRepository;
import repository.baseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private final String SELECT_ALL ="SELECT * FROM users";
    private final String SEARCH_BY_COUNTRY ="SELECT * FROM users WHERE country = ?;";
    private final String SORT_BY_NAME ="SELECT * FROM users ORDER BY `name` ASC; ";
    private final String EDIT="update users set `name`= ?,email=?,country=? where id= ?;";
    private final String INSERT_USERS ="INSERT INTO users(`name`,email,country) " + "VALUES (?,?,?);";
    private baseRepository BaseRepository;


    @Override
    public List<User> findAllUser() {
        List<User> list = new ArrayList<>();
        try(Connection connection = BaseRepository.getConnectDB()){
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính c?a b?ng
                String name  = resultSet.getString("name");
                String email  = resultSet.getString("email");
                String country  = resultSet.getString("country");
                User user = new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void save(User user) {
        String query ="INSERT INTO users(`name`,email,country) VALUES (?,?,?);";
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getCountry());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void update(int id,User user) {
        Connection connection= baseRepository.getConnectDB();
        try {
            PreparedStatement ps= connection.prepareStatement(EDIT);
            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getCountry());
            ps.setInt(4,user.getId());
            ps.executeUpdate();  //thêm s?a xóa
//            ps.executeQuery() -> select hi?n th?

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    @Override
    public List<User> search(String country) {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement ps = connection.prepareStatement(SEARCH_BY_COUNTRY);
            ps.setString(1,country);
            ResultSet resultSet = ps.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính c?a b?ng
                String name  = resultSet.getString("name");
                String email  = resultSet.getString("email");
                User user = new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<User> sort() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try{
            PreparedStatement ps = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // colummLable : tên  thuocj tính c?a b?ng
                String name = resultSet.getString("name");
                String email  = resultSet.getString("email");
                String country  = resultSet.getString("country");
                User user = new User(id,name,email,country);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public User findById(int id) {
        String selectById = "SELECT * FROM users WHERE id = ?;";
        Connection connection = baseRepository.getConnectDB();
        User user = null;
        try {
            PreparedStatement ps = connection.prepareStatement(selectById);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            user = new User(id, name, email, country);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;

    }
}
