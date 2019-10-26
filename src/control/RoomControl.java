package control;

import dao.RoomDao;
import dao.daoImp.RoomDaoImp;
import entity.RentRoom;
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
        PrintWriter pw ;
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
                //获取修改后的房间类型和价格
                List<RoomInfo> list = rd.getInfo();
                req.setAttribute("RoomPrice",list);
                pw = resp.getWriter();
                pw.write("msg修改成功");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(uri.indexOf("RoomPreplot")>=0){

        }else if(uri.indexOf("RoomReg")>=0){
            RentRoom rentRoom = new RentRoom();
            rentRoom.setPeople_name(req.getParameter("name"));
            rentRoom.setPeople_id(req.getParameter("ID"));
            rentRoom.setRent_tel(req.getParameter("tel"));
            rentRoom.setRoom_type(req.getParameter("type"));
            rentRoom.setRent_num(Integer.parseInt(req.getParameter("num")));
            rentRoom.setEnter_time(req.getParameter("enter"));
            rentRoom.setLeave_time(req.getParameter("leave"));
            rentRoom.setRent_status("已入住");
            try {
                //添加开房信息
                rd.addRoom(rentRoom);
                pw = resp.getWriter();
                pw.write("msg开房成功");
            } catch (SQLException e) {
//                pw = resp.getWriter();
//                pw.write("msg信息不完整，请补全信息");
                e.printStackTrace();
            }

        }
    }
}
