package entity;

/**
 * 开房信息表
 */
public class RentRoom {
    private String rent_id;
    private String room_id;
    private String room_price;
    private String people_name;
    private String people_id;
    private String room_type;
    private int rent_num;
    private String enter_time;
    private String leave_time;
    private String rent_status;
    private String rent_tel;

    public String getRent_id() {
        return rent_id;
    }

    public void setRent_id(String rent_id) {
        this.rent_id = rent_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getRoom_price() {
        return room_price;
    }

    public void setRoom_price(String room_price) {
        this.room_price = room_price;
    }

    public String getPeople_name() {
        return people_name;
    }

    public void setPeople_name(String people_name) {
        this.people_name = people_name;
    }

    public String getPeople_id() {
        return people_id;
    }

    public void setPeople_id(String people_id) {
        this.people_id = people_id;
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

    public String getRent_status() {
        return rent_status;
    }

    public void setRent_status(String rent_status) {
        this.rent_status = rent_status;
    }

    public String getRent_tel() {
        return rent_tel;
    }

    public void setRent_tel(String rent_tel) {
        this.rent_tel = rent_tel;
    }
}
