package org.productstore.common.pojo;

import java.util.List;

public class Bar {


    private List<String> productNames;

    private List<Integer> sales;

    public List<String> getProductNames() {
        return productNames;
    }

    public void setProductNames(List<String> productNames) {
        this.productNames = productNames;
    }

    public List<Integer> getSales() {
        return sales;
    }

    public void setSales(List<Integer> sales) {
        this.sales = sales;
    }
}
