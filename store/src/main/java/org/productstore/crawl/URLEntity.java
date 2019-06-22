package org.productstore.crawl;

import org.productstore.model.entity.ProductInfo;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class URLEntity {

    public static List<ProductInfo> URLParse(HttpClient httpclient, String url, String category) throws IOException, ParseException {
        List<ProductInfo> getproducts = new ArrayList<ProductInfo>();
        HttpResponse response = HttpUtil.getHtml(httpclient, url);
        int statusCode = response.getStatusLine().getStatusCode();   //获取状态码
        if(statusCode == 200)  //200为正常
        {
            String entity = EntityUtils.toString(response.getEntity(),"utf-8");
            getproducts = ProductParse.getData(httpclient,entity,category);
            EntityUtils.consume(response.getEntity());   //消耗实体类，实体类最后需要消耗
        }
        else
            EntityUtils.consume(response.getEntity());

        return getproducts;
    }
}
