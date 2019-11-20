package entity;

/**
 * 登录表
 */
public class Login {
    private int staff_id;
    private String pasword;

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public String getPassword() {
        return pasword;
    }

    public void setPassword(String pasword) {
        this.pasword = pasword;
    }
}
