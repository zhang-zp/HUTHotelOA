package entity;

/**
 * 采购表
 */
public class Purchase {
    private int goods_id;
    private String goods_name;
    private double goods_prices;
    private int goods_num;
    private String goods_time;

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public double getGoods_prices() {
        return goods_prices;
    }

    public void setGoods_prices(double goods_prices) {
        this.goods_prices = goods_prices;
    }

    public int getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(int goods_num) {
        this.goods_num = goods_num;
    }

    public String getGoods_time() {
        return goods_time;
    }

    public void setGoods_time(String goods_time) {
        this.goods_time = goods_time;
    }
}