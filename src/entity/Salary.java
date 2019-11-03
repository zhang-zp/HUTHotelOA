package entity;

/**
 * 工资表
 */
public class Salary {
    private String salary_id;
    private  String salary_time;
    private String staff_id;
    private double renish_amount;
    private String renish_reason;

    public String getSalary_id() {
        return salary_id;
    }

    public void setSalary_id(String salary_id) {
        this.salary_id = salary_id;
    }


    public String getSalary_time() {
        return salary_time;
    }

    public void setSalary_time(String salary_time) {
        this.salary_time = salary_time;
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
