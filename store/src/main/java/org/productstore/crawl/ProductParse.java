package org.productstore.crawl;

import org.productstore.model.entity.ProductInfo;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductParse {
    public static List<ProductInfo> getData(HttpClient httpclient, String html, String category) throws ParseException, IOException {
        List<ProductInfo> datas = new ArrayList<ProductInfo>();
        Document doc = Jsoup.parse(html);
        Elements elements = doc.select("div[id=search_nature_rg]").select("ul[class=bigimg]").select("li");
        int i = 1;
        for (Element element : elements) {

            String imgUrl = element.select("a[class=pic]").select("img").attr("data-original");
            if(StringUtils.isEmpty(imgUrl)){
                imgUrl = element.select("a[class=pic]").select("img").attr("src");
            }
            String productName = element.select("a[class=pic]").select("img").attr("alt");
            String outline = element.select("p[class=name]").select("a").text();
            String detail = element.select("p[class=detail]").text();

            String productRobPrice = element.select("p[class=price]").select("span[class=search_now_price]").text().substring(1);

            String productMarketPrice = element.select("p[class=price]").select("span[class=search_pre_price]").text().substring(1);
            String discount = element.select("p[class=price]").select("span[class=search_discount]").text();

            ProductInfo product = new ProductInfo();
            product.setName(productName);
            product.setImageUrl(imgUrl);
            product.setOutline(outline);
            product.setProductCategoryId(Integer.parseInt(category));
            String substring = discount.substring(
                    (discount.indexOf("(") + 1) < 0 ? 0 : discount.indexOf("(") + 1, discount.indexOf(")") - 1 < 0 ? 0 : discount.indexOf(")") - 1);
            product.setDiscount(BigDecimal.valueOf(
                    Double.valueOf(
                            StringUtils.isEmpty(substring) ? "0" : substring
                    )
                    )
            );
            product.setPrice(BigDecimal.valueOf(Double.valueOf(productRobPrice)));
            product.setMarketPrice(BigDecimal.valueOf(Double.valueOf(productMarketPrice)));
            product.setDetail(detail);
            product.setStoreId(1);
            product.setStoreTime(new Date());
            product.setDealMount(0);
            product.setLookMount(0);
            product.setStoreMount(200);

            datas.add(product);
            if (i++ == 30) {
                break;
            }
        }
        return datas;
    }
}
