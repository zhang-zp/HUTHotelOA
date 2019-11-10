package entity;

public class Detail {
    private int rent_id; // 客房订单id
    private int room_id;//房间号
    private String enter_time;//入住时间
    private String leave_time;//退房时间
    private String room_price;//房间价格
    private String room_type;//房间类型
    private int rent_num;//房间人数
    private String rent_status;

    private int goods_id;//商品id
    private String goods_name;//商品名
    private double goods_price;//商品价格
    private int goods_num;//商品数量
    private String goods_time;//采购时间

    private  String salary_id;//工资支出id
    private String staff_id;//员工id
    private double renish_amount;//工资数
    private String renish_reason;//工资原因
    private String salary_time;//发放工资时间


    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getEnter_time() {
        return enter_time;
    }

    public void setEnter_time(String enter_time) {
        this.enter_time = enter_time;
    }

    public String getLeave_time() {
        return leave_time;
    }

    public void setLeave_time(String leave_time) {
        this.leave_time = leave_time;
    }

    public String getRoom_price() {
        return room_price;
    }

    public void setRoom_price(String room_price) {
        this.room_price = room_price;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public int getRent_num() {
        return rent_num;
    }

    public void setRent_num(int rent_num) {
        this.rent_num = rent_num;
    }

    public String getRent_status() {
        return rent_status;
    }

    public void setRent_status(String rent_status) {
        this.rent_status = rent_status;
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

    public String getGoods_time() {
        return goods_time;
    }

    public void setGoods_time(String goods_time) {
        this.goods_time = goods_time;
    }

    public String getSalary_id() {
        return salary_id;
    }

    public void setSalary_id(String salary_id) {
        this.salary_id = salary_id;
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

    public String getSalary_time() {
        return salary_time;
    }

    public void setSalary_time(String salary_time) {
        this.salary_time = salary_time;
    }
}
