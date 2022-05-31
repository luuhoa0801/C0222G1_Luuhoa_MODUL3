package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    // service kết nối gọi repo
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(int id) {
      return productRepository.findById(id);
    }

    @Override
    public Map<String, String> save(Product product) {
        Map<String, String> map = new HashMap<>();
        if (product.getPrice() < 0 ){
            map.put("price","số tiền không thể âm");
        }
        if (map.isEmpty()){
            productRepository.save(product);
        }
        return map;
    }

    @Override
    public void delete(int id) {
    productRepository.delete(id);
    }

    @Override
    public void update( Product product) {
    productRepository.update(product);
    }

    @Override
    public void search(Product product) {

    }

    @Override
    public List<Product> findByName(String name) {
        return productRepository.findByName(name);
    }
}
