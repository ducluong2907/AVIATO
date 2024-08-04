package admin.controll.user;

import dal.ControllUser;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author phung
 */
public class AddUser extends HttpServlet {

     private static final char[] SOURCE_CHARACTERS = {'À', 'Á', 'Â', 'Ã', 'È', 'É',
            'Ê', 'Ì', 'Í', 'Ò', 'Ó', 'Ô', 'Õ', 'Ù', 'Ú', 'Ý', 'à', 'á', 'â',
            'ã', 'è', 'é', 'ê', 'ì', 'í', 'ò', 'ó', 'ô', 'õ', 'ù', 'ú', 'ý',
            'Ă', 'ă', 'Đ', 'đ', 'Ĩ', 'ĩ', 'Ũ', 'ũ', 'Ơ', 'ơ', 'Ư', 'ư', 'Ạ',
            'ạ', 'Ả', 'ả', 'Ấ', 'ấ', 'Ầ', 'ầ', 'Ẩ', 'ẩ', 'Ẫ', 'ẫ', 'Ậ', 'ậ',
            'Ắ', 'ắ', 'Ằ', 'ằ', 'Ẳ', 'ẳ', 'Ẵ', 'ẵ', 'Ặ', 'ặ', 'Ẹ', 'ẹ', 'Ẻ',
            'ẻ', 'Ẽ', 'ẽ', 'Ế', 'ế', 'Ề', 'ề', 'Ể', 'ể', 'Ễ', 'ễ', 'Ệ', 'ệ',
            'Ỉ', 'ỉ', 'Ị', 'ị', 'Ọ', 'ọ', 'Ỏ', 'ỏ', 'Ố', 'ố', 'Ồ', 'ồ', 'Ổ',
            'ổ', 'Ỗ', 'ỗ', 'Ộ', 'ộ', 'Ớ', 'ớ', 'Ờ', 'ờ', 'Ở', 'ở', 'Ỡ', 'ỡ',
            'Ợ', 'ợ', 'Ụ', 'ụ', 'Ủ', 'ủ', 'Ứ', 'ứ', 'Ừ', 'ừ', 'Ử', 'ử', 'Ữ',
            'ữ', 'Ự', 'ự',};

    private static final char[] DESTINATION_CHARACTERS = {'A', 'A', 'A', 'A', 'E',
            'E', 'E', 'I', 'I', 'O', 'O', 'O', 'O', 'U', 'U', 'Y', 'a', 'a',
            'a', 'a', 'e', 'e', 'e', 'i', 'i', 'o', 'o', 'o', 'o', 'u', 'u',
            'y', 'A', 'a', 'D', 'd', 'I', 'i', 'U', 'u', 'O', 'o', 'U', 'u',
            'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A',
            'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'A', 'a', 'E', 'e',
            'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E', 'e', 'E',
            'e', 'I', 'i', 'I', 'i', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o',
            'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O', 'o', 'O',
            'o', 'O', 'o', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u', 'U', 'u',
            'U', 'u', 'U', 'u',};

    public static char removeAccent(char ch) {
        int index = Arrays.binarySearch(SOURCE_CHARACTERS, ch);
        if (index >= 0) {
            ch = DESTINATION_CHARACTERS[index];
        }
        return ch;
    }
    public static String removeAccent(String str) {
        StringBuilder sb = new StringBuilder(str);
        for (int i = 0; i < sb.length(); i++) {
            sb.setCharAt(i, removeAccent(sb.charAt(i)));
        }
        return sb.toString();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

//    boolean checkDate(String x) {
//        try {
//            Date now = new Date();
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//            Date cp = df.parse(x);
//            if (now.compareTo(cp) > 0) {
//                return true;
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return false;
//    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("utf-8");
//        ControllUser d = new ControllUser();
//        String username = request.getParameter("username");
//        if (d.checkUser(username)) {
//            String err = "Sorry..username have exist!!Try a gain with another username";
//            request.setAttribute("message", err);
//            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
//        } else {
//            String fullname = request.getParameter("fullname");
//            String address = request.getParameter("address");
//            String email = request.getParameter("email");
//            String phone = request.getParameter("phone");
//            String dob = request.getParameter("dob");
//            String gender = request.getParameter("gender");
//            String role = request.getParameter("role");
//            String status = request.getParameter("status");
//            String passSendUser = d.getRandom();
//            int Role = Integer.parseInt(role);
//            int Status = Integer.parseInt(status);
//            int Gender = Integer.parseInt(gender);
//            Role r = new Role(Role, "");
//            if (Gender == 1) {
//                User x = new User(1, username, passSendUser, fullname, "avatar-default-icon.png", address, dob, true, email, phone, r, Status);
//                d.addUser(x);
//                d.sendEmail(x, x.getName(), passSendUser);
//            } else {
//                User x = new User(1, username, passSendUser, fullname, "avatar-default-icon.png", address, dob, false, email, phone, r, Status);
//                d.addUser(x);
//                d.sendEmail(x, x.getName(), passSendUser);
//            }
//            String message = "Add Successfull";
//            request.setAttribute("message", message);
//            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
//        }
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        ControllUser d = new ControllUser();
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        //validate username
        if (checkString(username, "[a-zA-Z0-9 ]{9,20}", "Enter username again") == null) {
            String err = "Enter username again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //check username valid
        if (d.checkUser(username)) {
            String err = "Sorry..username have exist!!Try a gain with another username";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //validate fullname
        if (checkString(removeAccent(fullname).trim(), "[a-zA-Z ]+", "Enter fullname again") == null) {
            String err = "Enter fullname again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //validate address
        if (checkString(removeAccent(address).trim(), "[a-zA-Z0-9 ]*", "Enter address again") == null) {
            String err = "Enter address again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //validate email
        if (checkString(email, "^[A-Za-z0-9+_.-]+@(.+)$", "Enter address again") == null) {
            String err = "Enter email again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //validate phone
        if (checkString(phone, "(\\+[0-9]{1,2})?[0-9]{8,11}", "Enter address again") == null) {
            String err = "Enter phonenumber again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        //checkdate
        if (checkDate(dob)==true) {
            String err = "Enter date  of birth again";
            request.setAttribute("message", err);
            request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
        }
        String passSendUser = d.getRandom();
        int Role = Integer.parseInt(role);
        int Status = Integer.parseInt(status);
        int Gender = Integer.parseInt(gender);
        Role r = new Role(Role, "");
        if (Gender == 1) {
            User x = new User(1, username, passSendUser, fullname, "avatar-default-icon.png", address, dob, true, email, phone, r, Status);
            d.addUser(x);
            d.sendEmail(x, x.getName(), passSendUser);
        } else {
            User x = new User(1, username, passSendUser, fullname, "avatar-default-icon.png", address, dob, false, email, phone, r, Status);
            d.addUser(x);
            d.sendEmail(x, x.getName(), passSendUser);
        }
        String message = "Add Successfull";
        request.setAttribute("message", message);
        request.getRequestDispatcher("admin/controll_User/addUser.jsp").forward(request, response);
    }

//    public static String removeAccent(String s) {
//
//        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
//        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
//        return pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replace("đ", "");
//
//    }

    boolean checkDate(String x) {
        try {
            Date now = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date cp = df.parse(x);
            if (cp.compareTo(now) >= 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public String checkString(String value, String regex, String message) {
        if (!value.matches(regex)) {
//            throw new Exception(message);
            return null;
        }
        return value;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
