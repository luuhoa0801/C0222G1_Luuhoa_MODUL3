package repository;

import model.User;

import java.awt.*;
import java.util.List;

public interface IUserRepository {
    List<User> findAllUser();
    void save( User user);
    void update(int id,User user);
    List<User> search(String country);
     List<User> sort();
     User findById(int id);

}
