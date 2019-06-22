package org.productstore;

import org.productstore.model.service.IProductCateService;
import org.productstore.model.dao.GlobalParameterMapper;
import org.productstore.model.entity.ProductCategory;
import org.productstore.model.entity.GlobalParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.ServletContext;
import java.util.List;

@Component
public class InitWebInfoCommandLineRunner implements CommandLineRunner {

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private IProductCateService productCateService;

    @Autowired
    private GlobalParameterMapper globalParameterMapper;



    @Override
    public void run(String... args){
        List<ProductCategory> productCategories = productCateService.getCategoryList();
        List<GlobalParameter> globalParameters = globalParameterMapper.selectByExample(new Example(GlobalParameter.class));

        servletContext.setAttribute("productCategories", productCategories);
        if(globalParameters!=null && globalParameters.size() != 0){
            servletContext.setAttribute("globalParameter", globalParameters.get(0));
        }
    }
}
