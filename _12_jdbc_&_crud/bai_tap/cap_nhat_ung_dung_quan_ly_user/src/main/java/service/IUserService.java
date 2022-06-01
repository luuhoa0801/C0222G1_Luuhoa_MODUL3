package service;

import model.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    List<User> findAllUser();
    void save(User user);
    void update(int id,User user);
    List<User> search (String country);
    List<User> sort();
    User findById(int id);


}
