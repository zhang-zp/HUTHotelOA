package entity;

/**
 * 客户信息表
 */
public class Customer {
    private int rent_id;
    private String people_id;
    private String people_name;
    private String people_sex;
    private int room_id;
    private String enter_time;
    private String leave_time;

    public int getRent_id() {
        return rent_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public String getPeople_id() {
        return people_id;
    }

    public void setPeople_id(String people_id) {
        this.people_id = people_id;
    }

    public String getPeople_name() {
        return people_name;
    }

    public void setPeople_name(String people_name) {
        this.people_name = people_name;
    }

    public String getPeople_sex() {
        return people_sex;
    }

    public void setPeople_sex(String people_sex) {
        this.people_sex = people_sex;
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
}
