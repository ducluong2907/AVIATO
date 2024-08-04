///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package dal;
//
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import model.order.MyOrder;
//
///**
// *
// * @author HP
// */
//public class MyOrderDAO extends DBContext {
//    PreparedStatement st;
//    ResultSet rs;
//    public List<MyOrder> getAll(String id){
//        List<MyOrder> list = new ArrayList<>();
//        String query = "select * from MyOrder where userID = ?";
//        try{
//            st=connection.prepareStatement(query);
//            st.setString(1, id);
//            rs = st.executeQuery();
//            while(rs.next()){
//                MyOrder o = new MyOrder();
//                o.setAmount(rs.getString(4));
//                o.setId(rs.getString(1));
//                o.setOrdate(rs.getString(2));
//                o.setProduct(rs.getString(3));
//                o.setStatus(rs.getString(6));
//                o.setTotalCost(rs.getString(5));
//                o.setUserID(rs.getString(7));
//                list.add(o);
//            }
//        }
//        catch(Exception e){
//            System.out.println(e);
//        }
//        return list;
//    }
//    public List<MyOrder> getAlls(){
//        List<MyOrder> list = new ArrayList<>();
//        String query = "select * from MyOrder where id between 5 and 11";
//        try{
//            st=connection.prepareStatement(query);
//            rs = st.executeQuery();
//            while(rs.next()){
//                MyOrder o = new MyOrder();
//                o.setAmount(rs.getString(4));
//                o.setId(rs.getString(1));
//                o.setOrdate(rs.getString(2));
//                o.setProduct(rs.getString(3));
//                o.setStatus(rs.getString(6));
//                o.setTotalCost(rs.getString(5));
//                o.setUserID(rs.getString(7));
//                list.add(o);
//            }
//        }
//        catch(Exception e){
//            System.out.println(e);
//        }
//        return list;
//    }
//    
//     public MyOrder getOrder(String id){
//        MyOrder o = new MyOrder();
//        String query = "select * from MyOrder where id = ?";
//        try{
//            st=connection.prepareStatement(query);
//            st.setString(1, id);
//            rs = st.executeQuery();
//            while(rs.next()){
//                o = new MyOrder();
//                o.setAmount(rs.getString(4));
//                o.setId(rs.getString(1));
//                o.setOrdate(rs.getString(2));
//                o.setProduct(rs.getString(3));
//                o.setStatus(rs.getString(6));
//                o.setTotalCost(rs.getString(5));
//                o.setUserID(rs.getString(7));
//            }
//        }
//        catch(Exception e){
//            System.out.println(e);
//        }
//        return o;
//    }
//    public List<MyOrder> getAllName(String name){
//        List<MyOrder> list = new ArrayList<>();
//        String query = "select * from MyOrder where Product like '%"+name+"%'";
//        try{
//            st=connection.prepareStatement(query);
//            rs = st.executeQuery();
//            while(rs.next()){
//                MyOrder o = new MyOrder();
//                o.setAmount(rs.getString(4));
//                o.setId(rs.getString(1));
//                o.setOrdate(rs.getString(2));
//                o.setProduct(rs.getString(3));
//                o.setStatus(rs.getString(6));
//                o.setTotalCost(rs.getString(5));
//                o.setUserID(rs.getString(7));
//                list.add(o);
//            }
//        }
//        catch(Exception e){
//            System.out.println(e);
//        }
//        return list;
//    }
//    
//    public int getTotalOrder() {
//        String query = "select count(*) from MyOrder";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return rs.getInt(1);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return 0;
//    }
//    public List<MyOrder> pagingOrders(String id,int index) {
//        List<MyOrder> list = new ArrayList<>();
//        String query = "select * from MyOrder where userID = ? order by id offset ? rows fetch next 6 rows only";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, id);
//            st.setInt(2, (index - 1) * 6);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                MyOrder o = new MyOrder();
//                o.setAmount(rs.getString(4));
//                o.setId(rs.getString(1));
//                o.setOrdate(rs.getString(2));
//                o.setProduct(rs.getString(3));
//                o.setStatus(rs.getString(6));
//                o.setTotalCost(rs.getString(5));
//                o.setUserID(rs.getString(7));
//                list.add(o);
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
//    public void delete(String id){
//        String query = "delete from [myorder] where id = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, id);
//            st.executeUpdate();
//
//        } catch (Exception e) {
//        }
//    }
//    public static void main(String[] args) {
//        MyOrderDAO dao = new MyOrderDAO();
//        List<MyOrder> listO = dao.pagingOrders("12", 1);
//        for (MyOrder myOrder : listO) {
//            System.out.println(myOrder);
//        }
//
//    }
//}
