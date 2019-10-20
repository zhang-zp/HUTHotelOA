package entity;

/**
 * 开房信息表
 */
public class RentRoom {
    private int rent_id;
    private int room_id;
    private String room_type;
    private String enter_time;
    private String leave_time;
    private String status;//订单状态，完成、未完成
    private int rent_num;
    private double room_price;

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

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRent_num() {
        return rent_num;
    }

    public void setRent_num(int rent_num) {
        this.rent_num = rent_num;
    }

    public double getRoom_price() {
        return room_price;
    }

    public void setRoom_price(double room_price) {
        this.room_price = room_price;
    }
}
