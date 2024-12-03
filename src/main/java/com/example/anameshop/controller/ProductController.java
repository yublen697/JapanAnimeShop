package com.example.anameshop.controller;

import com.example.anameshop.model.entity.Product;
import com.example.anameshop.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import java.io.File;
import java.io.FileOutputStream;
import java.util.List;


@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    // 將資料傳到 product
    @GetMapping("/Product")
    public String getAllProduct(Model model) {
        // List<Product> productList = productService.getAllProduct();
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals("appetizer"))
                .toList();

        model.addAttribute("productList", productList);
        return "product";
    }

    // 將資料傳到 order
    @GetMapping("/order")
    public String getAllOrder(Model model) {
        // List<Product> productList = productService.getAllProduct();
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals("appetizer"))
                .toList();

        model.addAttribute("productList", productList);
        return "order";
    }

    // 將資料傳到 product_backend
    @GetMapping("/product_backend")
    public String product_backendPage(Model model) {
        // List<Product> productList = productService.getAllProduct();
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals("appetizer"))
                .toList();

        model.addAttribute("productList", productList);
        return "product_backend";
    }

    // 依照不同 productType 將資料傳到 product
    @GetMapping("/product/productType/{productType}")
    public String productType(Model model, @PathVariable("productType") String productType) {
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals(productType))
                .toList();

        model.addAttribute("productList", productList);
        model.addAttribute("active", productType);
        return "product";
    }

    // 依照不同 productType 將資料傳到 order
    @GetMapping("/order/productType/{productType}")
    public String orderType(Model model, @PathVariable("productType") String productType) {
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals(productType))
                .toList();

        model.addAttribute("productList", productList);
        model.addAttribute("active", productType);
        return "order";
    }

    // 依照不同 productType 將資料傳到 product_backend
    @GetMapping("/product_backend/productType/{productType}")
    public String product_backendType(Model model, @PathVariable("productType") String productType) {
        List<Product> productList = productService.getAllProduct().stream()
                .filter(product -> product.getProductType().equals(productType))
                .toList();

        model.addAttribute("productList", productList);
        model.addAttribute("active", productType);
        return "product_backend";
    }

    // 按下修改按鈕，根據 productId 將資料傳到修改表單
    @GetMapping("/product_backend/{productId}")
    public String getProduct(@PathVariable("productId") Integer productId, Model model) {
        // 顯示所有 product
        List<Product> productList = productService.getAllProduct();
        model.addAttribute("productList", productList);

        // 根據 productId 將資料傳到修改表單
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);

        // 表單 submit 時可以被處理為 PUT 請求
        model.addAttribute("_method", "PUT");
        return "product_backend";
    }

    // 新增 product
    @PostMapping("/product_backend/")
    public String createProduct(@RequestParam("file") MultipartFile productImage,
                             @Validated Product product,
                             Model model) {

        //product.setProductImage(productImage.getOriginalFilename());

        if (!productImage.isEmpty()) {
            // 將圖片存到對應路徑
            File file = new File("src/main/resources/static/img/product/" + product.getProductType(),
                    productImage.getOriginalFilename());
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(productImage.getBytes());
                Thread.sleep(1000);
            } catch (Exception e) {
                e.printStackTrace();
            }
            product.setProductImage(productImage.getOriginalFilename());
        }
        // 調用服務方法新增 product
        productService.createProduct(product);
        List<Product> productList = productService.getAllProduct();
        model.addAttribute("product", null);
        model.addAttribute("productList", productList);
        model.addAttribute("productType", product.getProductType());

        System.out.println("新增成功，ID為：" + product.getProductId());
        model.addAttribute("_method", "PUT");
        return "product_backend";
    }

    // 修改 product
    @PutMapping("/product_backend/{productId}")
    public String updateProduct(@PathVariable("productId") Integer productId,
                              @RequestParam("file") MultipartFile productImage,
                              @ModelAttribute Product product,
                              Model model) {



        // 將圖片存到對應路徑
        File file = new File("src/main/resources/static/img/product/" + product.getProductType(),
                productImage.getOriginalFilename());
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(productImage.getBytes());
            Thread.sleep(1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        product.setProductImage(productImage.getOriginalFilename());

        // 調用服務方法更新 Product
        productService.updateProduct(productId, product);
        List<Product> productList = productService.getAllProduct();
        model.addAttribute("product", product);
        model.addAttribute("productList", productList);
        model.addAttribute("productType", product.getProductType());

        System.out.println("修改成功，ID為：" + productId);
        model.addAttribute("_method", "PUT");
        return "product_backend";
    }

    // 刪除 product
    @DeleteMapping("/product_backend/{productId}")
    public String deleteProduct(@PathVariable("productId") Integer productId, Model model) throws InterruptedException {
        System.out.println("刪除成功，ID為：" + productId);
        productService.deleteProduct(productId);
        List<Product> productList = productService.getAllProduct();
        model.addAttribute("productList", productList);
        Thread.sleep(1300);
        return "product_backend";
    }

}
