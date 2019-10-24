package entity;

public class Expend {
    private  String salary_id;
    private int goods_id;
    private String goods_name;
    private double goods_price;
    private int goods_num;
    private String goods_time;
    private String staff_id;
    private double renish_amount;
    private String renish_reason;
    private String salary_time;

    public String getGoods_time() {
        return goods_time;
    }

    public void setGoods_time(String goods_time) {
        this.goods_time = goods_time;
    }

    public String getSalary_time() {
        return salary_time;
    }

    public void setSalary_time(String salary_time) {
        this.salary_time = salary_time;
    }

    public String getSalary_id() {
        return salary_id;
    }

    public void setSalary_id(String salary_id) {
        this.salary_id = salary_id;
    }
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

    public String getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(String staff_id) {
        this.staff_id = staff_id;
    }

    public double getRenish_amount() {
        return renish_amount;
    }

    public void setRenish_amount(double renish_amount) {
        this.renish_amount = renish_amount;
    }

    public String getRenish_reason() {
        return renish_reason;
    }

    public void setRenish_reason(String renish_reason) {
        this.renish_reason = renish_reason;
    }
}
