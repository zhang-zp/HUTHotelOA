package entity;

public class Statistic {
    private String month;
    private String month1;
    private String month2;
    private String room_price;
    private String goods_price;
    private String salary_price;

    public void setMonth1(String month1) {
        this.month1 = month1;
    }

    public String getMonth2() {
        return month2;
    }



    public void setMonth2(String month2) {
        this.month2 = month2;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getMonth1() {
        return month1;
    }


    public String getRoom_price() {
        return room_price;
    }

    public void setRoom_price(String room_price) {
        this.room_price = room_price;
    }

    public String getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(String goods_price) {
        this.goods_price = goods_price;
    }

    public String getSalary_price() {
        return salary_price;
    }

    public void setSalary_price(String salary_price) {
        this.salary_price = salary_price;
    }
}
