package control;

import dao.StaffDao;
import dao.daoImp.StaffDaoImp;
import entity.Login;
import entity.StaffInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.staff")
public class StaffControl extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();
        StaffDao staffDao = new StaffDaoImp();
        PrintWriter pw = resp.getWriter();

        List<StaffInfo> list;
        try {
            list = staffDao.findAll();
            req.getSession().setAttribute("staffInfo",list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Login loginInfo = (Login) req.getSession().getAttribute("loginInfo");
        int ID = loginInfo.getStaff_id();

        if(uri.indexOf("allInfo")>=0){
            req.getRequestDispatcher("staff_AllInfo.jsp").forward(req,resp);
        } else if(uri.indexOf("selfInfo")>=0){
            try {
                StaffInfo staffInfo = staffDao.findSelf(ID);
                req.setAttribute("staffInfo",staffInfo);
                req.getRequestDispatcher("staff_UpdateSelfInfo.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(uri.indexOf("staffAdd")>=0){
            StaffInfo staffInfo = new StaffInfo();
            staffInfo.setStaff_name(req.getParameter("staff_name"));
            staffInfo.setStaff_sex(req.getParameter("sex"));
            staffInfo.setDept_name(req.getParameter("department"));
            staffInfo.setEntry_time(req.getParameter("entryTime"));
            staffInfo.setStaff_id(Integer.parseInt(req.getParameter("staff_id")));
            staffInfo.setStaff_num(req.getParameter("staff_num"));
            staffInfo.setStaff_job(req.getParameter("staff_job"));
            staffInfo.setStaff_age(Integer.parseInt(req.getParameter("staff_age")));
            staffInfo.setStaff_tel(req.getParameter("staff_tel"));
//            新增员工默认在职
            staffInfo.setStaff_status("在职");
            System.out.println(staffInfo);
            try {
                staffDao.staffAdd(staffInfo);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(uri.indexOf("checkID")>=0){
            resp.getWriter().write("nice");
            System.out.println("身份证号验证");
        } else if(uri.indexOf("checkTell")>=0){
            System.out.println("电话号码验证");
            resp.getWriter().write("nice");
        }else if(uri.indexOf("CheckStaff_id")>=0){
            int staff_id = Integer.parseInt(req.getParameter("staff_id"));
            try {
                if(!staffDao.checkStaff_id(staff_id)){
                    System.out.println("工号已存在");
                    pw.write("工号已存在");
                }
            } catch (SQLException e) {
                System.out.println("员工号查重异常");
                e.printStackTrace();
            }
        }else if(uri.indexOf("updateSelfInfo")>=0){
//从登录用户session里面拿到ID值
//            req.getSession().getAttribute("");
            StaffInfo staffInfo = new StaffInfo();
            staffInfo.setStaff_id(ID);
            staffInfo.setStaff_name(req.getParameter("staff_name"));
            staffInfo.setStaff_tel(req.getParameter("staff_tel"));
            staffInfo.setStaff_num(req.getParameter("staff_num"));
            staffInfo.setStaff_age(Integer.parseInt(req.getParameter("staff_age")));
            try {
                staffDao.updateStaffInfo(staffInfo);
                StaffInfo staffInfo1 = staffDao.findSelf(ID);
                req.setAttribute("staffInfo",staffInfo1);
                req.getRequestDispatcher("staff_UpdateSelfInfo.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(uri.indexOf("staffDelete")>=0){
            try {
                staffDao.deleteStaff(Integer.parseInt(req.getParameter("staff_id")));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(uri.indexOf("loginStaffAdd")>=0){
            System.out.println("添加可登录用户");
            String staff_id = req.getParameter("loginStaffAddID");
//            密码默认在工号前面添加p
            String password = "p"+staff_id;
            System.out.println(staff_id);
            Login login = new Login();
            login.setStaff_id(Integer.parseInt(staff_id));
            login.setPassword(password);
            try {
                staffDao.loginAdd(login);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
