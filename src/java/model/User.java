package model;

public class User  {

    private int id;
    private String name;
    private String pass;
    private String fullname;
    private String avatar;
    private String address;
    private String dob;
    private boolean gender;
    private String email;
    private String phone;
    private Role role;
    private int ustatusId;

    public User() {
    }

    public User(String fullname, String address, boolean gender, String email, String phone, int ustatusId) {
        this.fullname = fullname;
        this.address = address;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.ustatusId = ustatusId;
    }
    
    public User(int id, String name, String pass, String fullname, String avatar, String address, String dob, boolean gender, String email, String phone, Role role, int ustatusId) {
        this.id = id;
        this.name = name;
        this.pass = pass;
        this.fullname = fullname;
        this.avatar = avatar;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.ustatusId = ustatusId;
    }
 public User( String name, String pass, String fullname, String avatar, String address, String dob, boolean gender, String email, String phone, Role role, int ustatusId) {
        
        this.name = name;
        this.pass = pass;
        this.fullname = fullname;
        this.avatar = avatar;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.ustatusId = ustatusId;
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getUstatusId() {
        return ustatusId;
    }

    public void setUstatusId(int ustatusId) {
        this.ustatusId = ustatusId;
    }

}
