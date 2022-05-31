package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    public static Map<Integer,Product > productMap = new LinkedHashMap<>();
    static {
        productMap.put(1,new Product(1,"ip6",1000.0,"có","apple"));
        productMap.put(2,new Product(2,"ip7",2000.0,"có","apple"));
        productMap.put(3,new Product(3,"ip8",3000.0,"có","apple"));
    }

    @Override
    public List<Product> findAll() {
        //repo sẽ kết nối DB
        List<Product> productList = new ArrayList<>(productMap.values());
        return productList;
    }

    @Override
    public Product findById(int id) {
       if (id > 0 && id <= productMap.size()){
           return productMap.get(id);
       }
        return null;
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public void update( Product product) {

    }

    @Override
    public void search(Product product) {

    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product item: productMap.values()) {
            if (item.getName().contains(name)){
                productList.add(item);
            }
        }
        return productList;
    }
}
