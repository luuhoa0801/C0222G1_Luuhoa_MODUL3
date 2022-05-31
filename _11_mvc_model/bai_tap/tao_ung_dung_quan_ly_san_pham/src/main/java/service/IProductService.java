package service;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
    List<Product> findAll();
    Product findById(int id);
    Map<String,String> save(Product product);
    void delete(int id);
    void update( Product product);
    void search(Product product);
    List<Product> findByName(String name);

}
