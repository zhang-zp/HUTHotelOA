package entity;

/**
 * 房间信息表
 */
public class RoomInfo {
    private int room_id;
    private String room_type;
    private double room_price;
    private int room_num;
    private String room_des;
    private String room_status;
    private int room_floor;

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

    public double getRoom_price() {
        return room_price;
    }

    public void setRoom_price(double room_price) {
        this.room_price = room_price;
    }

    public int getRoom_num() {
        return room_num;
    }

    public void setRoom_num(int room_num) {
        this.room_num = room_num;
    }

    public String getRoom_dse() {
        return room_des;
    }

    public void setRoom_dse(String room_dse) {
        this.room_des = room_dse;
    }

    public String getRoom_status() {
        return room_status;
    }

    public void setRoom_status(String room_status) {
        this.room_status = room_status;
    }

    public int getRoom_floor() {
        return room_floor;
    }

    public void setRoom_floor(int room_floor) {
        this.room_floor = room_floor;
    }
}
