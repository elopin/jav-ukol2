/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ukol3.connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ukol3.beans.UserBean;

/**
 * Třída reprezentující vrstvu pro přístup k databázi pomocí 
 * předem připravených SQL dotazů.
 * 
 * @author Lukáš Janáček
 */
public class DataRepository {
    
    private ConnectionProvider connection;
    private Statement statement;
    
    private final String ID = "id";
    private final String NAME = "name";
    private final String SURNAME = "surname";
    private final String YEAR = "year";
    
    private PreparedStatement addUser;
    private PreparedStatement deleteUser;
    private PreparedStatement getUserById;
    private PreparedStatement updateUser;
    
    /**
     * Vytvoří třídu pro práci s daty v databázi pomocí přípravených
     * SQL dotazů.
     */
    public DataRepository() {
        this.connection = new ConnectionProvider();
        
        try {
            statement = connection.getConnection().createStatement();
            addUser = connection.getConnection().prepareStatement("INSERT INTO janacek_ukol3_user (name, surname, year) VALUES(?, ?, ?)");
            deleteUser = connection.getConnection().prepareStatement("DELETE FROM janacek_ukol3_user WHERE id = ?");
            getUserById = connection.getConnection().prepareStatement("SELECT id, name, surname, year FROM janacek_ukol3_user WHERE id = ?");
            updateUser = connection.getConnection().prepareStatement("UPDATE janacek_ukol3_user SET name = ?, surname = ?, year = ? WHERE id = ?");
        } catch (SQLException ex) {
            Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Přidá nového uživatele.
     * @param user 
     */
    public void addUser(UserBean user) {
        if(user != null) {
            try {
                addUser.setString(1, user.getName());
                addUser.setString(2, user.getSurname());
                addUser.setInt(3, user.getYear());
                addUser.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    /**
     * Vrátí všechny uložené uživatele.
     * @return 
     */
    public List<UserBean> getUsers() {
        List<UserBean> users = null;
        try {
            ResultSet result = statement.executeQuery("SELECT id, name, surname, year FROM janacek_ukol3_user");
            while(result.next()) {
                UserBean user = new UserBean();
                user.setId(result.getLong(ID));
                user.setName(result.getString(NAME));
                user.setSurname(result.getString(SURNAME));
                user.setYear(result.getInt(YEAR));
                
                if(users == null ){
                    users = new ArrayList<>();
                }
                
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return users;
    }
    
    /**
     * Odstraní uživatele podle id.
     * @param id 
     */
    public void deleteUser(Long id) {
        if(id != null) {
            try {
                deleteUser.setLong(1, id);
                deleteUser.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    /**
     * Vyhledá a vrátí uživatele podle id.
     * @param id
     * @return 
     */
    public UserBean getUserById(Long id) {
        UserBean user = null;
        if(id != null) {
            try {
                getUserById.setLong(1, id);
                ResultSet result = getUserById.executeQuery();
                if(result.next()) {
                    user = new UserBean();
                    user.setId(result.getLong(ID));
                    user.setName(result.getString(NAME));
                    user.setSurname(result.getString(SURNAME));
                    user.setYear(result.getInt(YEAR));
                }
                
            } catch (SQLException ex) {
                Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }
    
    /**
     * Aktualizuje data uzivatele.
     * @param user 
     */
    public void updateUser(UserBean user) {
        if(user != null) {
            try {
                updateUser.setString(1, user.getName());
                updateUser.setString(2, user.getSurname());
                updateUser.setInt(3, user.getYear());
                updateUser.setLong(4, user.getId());
                updateUser.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(DataRepository.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
