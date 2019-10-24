package control;

import dao.RoomDao;
import dao.daoImp.RoomDaoImp;
import entity.RoomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("*.room")
public class RoomControl extends HttpServlet {

        RoomDao rd = new RoomDaoImp();
        PrintWriter pw;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.indexOf("RoomAll")>=0){
            //房间信息
            try {
                List<RoomInfo> list = rd.findAll();
                req.setAttribute("RoomAll",list);
                req.getRequestDispatcher("Room_All.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("RoomPrice")>=0){
            //获取房间类型和价格
            try {
                List<RoomInfo> list = rd.getInfo();
                req.setAttribute("RoomPrice",list);
                req.getRequestDispatcher("Room_Price.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(uri.indexOf("update")>=0){
            //修改房价
            try {
                String type = req.getParameter("type");
                String price = req.getParameter("price");
                double price1 = Double.parseDouble(price);
                //进行修改
                rd.update(type,price1);
                pw.write("msg修改成功");
                //获取修改后的房间类型和价格
                List<RoomInfo> list = rd.getInfo();
                req.setAttribute("RoomPrice",list);
                req.getRequestDispatcher("Room_Price.jsp").forward(req,resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
