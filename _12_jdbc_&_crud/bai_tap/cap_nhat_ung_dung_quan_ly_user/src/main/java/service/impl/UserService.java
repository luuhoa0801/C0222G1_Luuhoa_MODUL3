package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAllUser() {
        return userRepository.findAllUser();
    }
    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public void update(int id, User user) {
        userRepository.update(id,user);
    }

    @Override
    public List<User> search(String country) {
        return userRepository.search(country);

    }

    @Override
    public List<User> sort() {
        return userRepository.sort();
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }


}
