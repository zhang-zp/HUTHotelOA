package control;

import dao.StaffDao;
import dao.daoImp.StaffDaoImp;
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

        List<StaffInfo> list = null;
        try {
            list = staffDao.findAll();
            req.getSession().setAttribute("staffInfo",list);
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        TODO 登录成功后需把员工号存储在session中用于员工的信息查询和修改

        if(uri.indexOf("allInfo")>=0){
            req.getRequestDispatcher("staff_AllInfo.jsp").forward(req,resp);
        } else if(uri.indexOf("selfInfo")>=0){
//            TODO 拿到员工ID查看个人信息
            int ID = 1001;
            try {
                StaffInfo staffInfo = staffDao.findSelf(ID);
                req.setAttribute("staffInfo",staffInfo);
                req.getRequestDispatcher("staff_SelfInfo.jsp").forward(req,resp);
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
            System.out.println(staffInfo);
            try {
//                TODO 先不执行插入操作
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
                    pw.write("员工号已存在");
                }
            } catch (SQLException e) {
                System.out.println("员工号查重异常");
                e.printStackTrace();
            }
        }else if(uri.indexOf("updateSelfInfo")>=0){

            int ID = 1001;
            try {
                StaffInfo staffInfo = staffDao.findSelf(ID);
                req.setAttribute("updateInfo",staffInfo);
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
//            TODO 向登录表中添加可登录用户
            System.out.println("添加可登录用户");

        }
    }
}
