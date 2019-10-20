package entity;

/**
 * 分发表
 */
public class Distribute {
    private int goods_id;
    private String goods_name;
    private double goods_price;
    private int goods_num;
    private String distri_time;
    private String distri_paath;

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

    public double getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(double goods_price) {
        this.goods_price = goods_price;
    }

    public int getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(int goods_num) {
        this.goods_num = goods_num;
    }

    public String getDistri_time() {
        return distri_time;
    }

    public void setDistri_time(String distri_time) {
        this.distri_time = distri_time;
    }

    public String getDistri_paath() {
        return distri_paath;
    }

    public void setDistri_paath(String distri_paath) {
        this.distri_paath = distri_paath;
    }
}
