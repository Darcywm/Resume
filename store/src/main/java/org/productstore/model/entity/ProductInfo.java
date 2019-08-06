package org.productstore.model.entity;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.*;

@Table(name = "product_info")
public class ProductInfo {
    @Id
    @Column(name = "product_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer productId;

    @Column(name = "product_category_id")
    private Integer productCategoryId;

    @Column(name = "store_id")
    private Integer storeId;

    @Column(name = "name")
    private String name;

    /**
     * 简介
     */
    @Column(name = "outline")
    private String outline;

    /**
     * 商品详情
     */
    @Column(name = "detail")
    private String detail;

    @Column(name = "price")
    private BigDecimal price;

    /**
     * 目录
     */
    @Column(name = "product_num")
    private String productNum;

    /**
     * 市场价\定价
     */
    @Column(name = "market_price")
    private BigDecimal marketPrice;

    /**
     * 会员价格
     */
    @Column(name = "member_price")
    private BigDecimal memberPrice;

    /**
     * 成交量
     */
    @Column(name = "deal_mount")
    private Integer dealMount;

    /**
     * 浏览量
     */
    @Column(name = "look_mount")
    private Integer lookMount;

    @Column(name = "discount")
    private BigDecimal discount;

    /**
     * 版面图片
     */
    @Column(name = "image_url")
    private String imageUrl;

    /**
     * 库存数量
     */
    @Column(name = "store_mount")
    private Integer storeMount;

    /**
     * 库存数量
     */
    @Column(name = " bad_mount")
    private Integer  badMount;

    /**
     * 入库时间
     */
    @Column(name = "store_time")
    private Date storeTime;

    /**
     * 是否上架
     */
    @Column(name = "is_shelf")
    private Integer isShelf;

    /**
     * 备注
     */
    @Column(name = "remark")
    private String remark;

    @Column(name = "invent_Remark")
    private String inventRemark;

    @Transient
    private String categoryName;

    @Transient
    private String storeName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    /**
     * @return product_id
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * @param productId
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * @return product_category_id
     */
    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    /**
     * @param productCategoryId
     */
    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    /**
     * @return store_id
     */
    public Integer getStoreId() {
        return storeId;
    }

    /**
     * @param storeId
     */
    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取简介
     *
     * @return outline - 简介
     */
    public String getOutline() {
        return outline;
    }

    /**
     * 设置简介
     *
     * @param outline 简介
     */
    public void setOutline(String outline) {
        this.outline = outline == null ? null : outline.trim();
    }

    /**
     * 获取商品详情
     *
     * @return detail - 商品详情
     */
    public String getDetail() {
        return detail;
    }

    /**
     * 设置商品详情
     *
     * @param detail 商品详情
     */
    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    /**
     * @return price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    /**
     * 获取市场价\定价
     *
     * @return market_price - 市场价\定价
     */
    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    /**
     * 设置市场价\定价
     *
     * @param marketPrice 市场价\定价
     */
    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    /**
     * 获取会员价格
     *
     * @return member_price - 会员价格
     */
    public BigDecimal getMemberPrice() {
        return memberPrice;
    }

    /**
     * 设置会员价格
     *
     * @param memberPrice 会员价格
     */
    public void setMemberPrice(BigDecimal memberPrice) {
        this.memberPrice = memberPrice;
    }

    /**
     * 获取成交量
     *
     * @return deal_mount - 成交量
     */
    public Integer getDealMount() {
        return dealMount;
    }

    /**
     * 设置成交量
     *
     * @param dealMount 成交量
     */
    public void setDealMount(Integer dealMount) {
        this.dealMount = dealMount;
    }

    /**
     * 获取浏览量
     *
     * @return look_mount - 浏览量
     */
    public Integer getLookMount() {
        return lookMount;
    }

    /**
     * 设置浏览量
     *
     * @param lookMount 浏览量
     */
    public void setLookMount(Integer lookMount) {
        this.lookMount = lookMount;
    }

    /**
     * @return discount
     */
    public BigDecimal getDiscount() {
        return discount;
    }

    /**
     * @param discount
     */
    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    /**
     * 获取版面图片
     *
     * @return image_url - 版面图片
     */
    public String getImageUrl() {
        return imageUrl;
    }

    /**
     * 设置版面图片
     *
     * @param imageUrl 版面图片
     */
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    /**
     * 获取库存数量
     *
     * @return store_mount - 库存数量
     */
    public Integer getStoreMount() {
        return storeMount;
    }

    /**
     * 设置库存数量
     *
     * @param storeMount 库存数量
     */
    public void setStoreMount(Integer storeMount) {
        this.storeMount = storeMount;
    }

    public Integer getBadMount() {
        return badMount;
    }

    public void setBadMount(Integer badMount) {
        this.badMount = badMount;
    }

    /**
     * 获取入库时间
     *
     * @return store_time - 入库时间
     */
    public Date getStoreTime() {
        return storeTime;
    }

    /**
     * 设置入库时间
     *
     * @param storeTime 入库时间
     */
    public void setStoreTime(Date storeTime) {
        this.storeTime = storeTime;
    }

    /**
     * 获取是否上架
     *
     * @return is_shelf - 是否上架
     */
    public Integer getIsShelf() {
        return isShelf;
    }

    /**
     * 设置是否上架
     *
     * @param isShelf 是否上架
     */
    public void setIsShelf(Integer isShelf) {
        this.isShelf = isShelf;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInventRemark() {
        return inventRemark;
    }

    public void setInventRemark(String inventRemark) {
        this.inventRemark = inventRemark;
    }
}