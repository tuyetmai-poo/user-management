package com.codegym.dao;

import com.codegym.model.User;
import java.sql.SQLException;
import java.util.List;

/**
 * Interface định nghĩa các phương thức thao tác dữ liệu (DAO) cho đối tượng User.
 */
public interface IUserDAO {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> selectUsersByCountryAndSort(String country, String sortOrder);
}
