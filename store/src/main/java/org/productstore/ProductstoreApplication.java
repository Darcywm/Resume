package org.productstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import tk.mybatis.spring.annotation.MapperScan;


@SpringBootApplication
@EnableCaching//开启缓存
@MapperScan("org.productstore.model.dao")
@EnableAsync
public class ProductstoreApplication {

//    @Override
//    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
//        return builder.sources(BookstoreApplication.class);
//    }


    public static void main(String[] args) {
        SpringApplication.run(ProductstoreApplication.class, args);
    }
}
