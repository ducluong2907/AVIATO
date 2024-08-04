///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package dal;
//
//import controller.*;
//import java.sql.Date;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import model.Category;
//import model.Course;
//
///**
// *
// * @author jicon
// */
//public class CourseDBContext extends DBContext {
//
//    public ArrayList<Course> searchCourse(int sort,int[] cid, Date begin, Date end, int feature, String name, int pageIndex, int pageSize) {
//        //page size is  number of element in page
//        ArrayList<Course> courses = new ArrayList<>();
//        try {
//            String sql = "  SELECT * FROM\n"
//                    + "                        (SELECT Courses.CourseId, thumnaiURL,title, Courses.featured, Category.Categoryid, Category.value, tagline, "; // last element in pageindex
//            switch (sort) {
//                case 0:
//                    sql += " ROW_NUMBER() OVER (ORDER BY Courses.createdate DESC) ";
//                    break;
//                case 1:
//                    sql += " ROW_NUMBER() OVER (ORDER BY Courses.createdate ASC) ";
//                    break;
//                case 2:
//                    sql += " ROW_NUMBER() OVER (ORDER BY Courses.title ASC) ";
//                    break;
//                case 3:
//                    sql += " ROW_NUMBER() OVER (ORDER BY Courses.title DESC) ";
//                    break;
//                default:
//                    break;
//            }
//            sql += " as row_index \n"
//                    + "FROM Courses \n"
//                    + " inner join Status on Status.Sid = Courses.statusid \n"
//                    + " inner join Category on Category.Categoryid = Courses.Categoryid\n"
//                    + " where statusid =1 ";
//            if (cid != null) {
//                sql += " and Category.Categoryid in (";
//                for (int i = 0; i < cid.length; i++) {
//                    sql += cid[i] + ",";
//                }
//                if (sql.endsWith(",")) {
//                    sql = sql.substring(0, sql.length() - 1);
//                }
//                sql += ")";
//            }
//
//            HashMap<Integer, Object[]> parameters = new HashMap<>();
//            int paramIndex = 0;
//            if (begin != null) {
//                sql += " And Courses.createdate >= ? ";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = Date.class.getTypeName();
//                param[1] = begin;
//                parameters.put(paramIndex, param);
//            }
//            if (end != null) {
//                sql += " And Courses.createdate <= ? ";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = Date.class.getTypeName();
//                param[1] = end;
//                parameters.put(paramIndex, param);
//            }
//            if (feature != 0) {
//                sql += " And featured =? ";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = Integer.class.getTypeName();
//                param[1] = feature;
//                parameters.put(paramIndex, param);
//            }
//            if (name != null) {
//                sql += " And Courses.title like ?  ";
//                paramIndex++;
//                Object[] param = new Object[2];
//                param[0] = String.class.getTypeName();
//                param[1] = name;
//                parameters.put(paramIndex, param);
//            }
//
//            sql += " ) tbl\n"
//                    + "WHERE row_index >= (? -1)*? + 1\n"
//                    + "AND row_index <= ? *?   ";
//            // dấu hỏi số 1 của where row_index >= ....
//            paramIndex++;
//            Object[] param = new Object[2];
//            param[0] = Integer.class.getTypeName();
//            param[1] = pageIndex; 
//            parameters.put(paramIndex, param);
//            // dấu hỏi số 2 của where row_index >= ....
//            paramIndex++;
//            param = new Object[2];
//            param[0] = Integer.class.getTypeName();
//            param[1] = pageSize; 
//            parameters.put(paramIndex, param);
//            // dấu hỏi số 3 của where row_index >= ....
//            paramIndex++;
//            param = new Object[2];
//            param[0] = Integer.class.getTypeName();
//            param[1] = pageSize; 
//            parameters.put(paramIndex, param);
//            // dấu hỏi số 4 của where row_index >= ....
//            paramIndex++;
//            param = new Object[2];
//            param[0] = Integer.class.getTypeName();
//            param[1] = pageIndex; 
//            parameters.put(paramIndex, param);
//            PreparedStatement stm = connection.prepareStatement(sql); 
//             for (Map.Entry<Integer, Object[]> entry : parameters.entrySet()) {
//                Integer index = entry.getKey();
//                Object[] value = entry.getValue();
//                String type = value[0].toString();
//                if(type.equals(Integer.class.getName()))
//                {
//                    stm.setInt(index, Integer.parseInt(value[1].toString()));
//                }
//                else if (type.equals(String.class.getName()))
//                {
//                    stm.setString(index, "%"+value[1].toString()+"%");
//                }
//                else if (type.equals(Date.class.getName())){
//                    stm.setDate(index, Date.valueOf(value[1].toString()) );
//                }
//            }
//            
////            
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Course c = new Course();
//                c.setCourseId(rs.getInt(1));
//                c.setThumnailURL(rs.getString(2));
//                c.setTitle(rs.getString(3));
//                c.setFeature(rs.getBoolean(4));
//                Category ca = new Category();
//                ca.setCategoryID(rs.getInt(5));
//                ca.setValue(rs.getString(6));
//                c.setCategory(ca);
//                c.setTagLine(rs.getString(7));
//                courses.add(c);
//
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return courses;
//    }
//
//   
//    
//    
//    public int coutCouse(int[] cid, Date begin, Date end, int feature, String name){
//        
//    }
//}
