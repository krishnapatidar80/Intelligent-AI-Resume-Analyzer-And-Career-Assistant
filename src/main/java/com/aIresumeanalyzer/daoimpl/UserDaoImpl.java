package com.aIresumeanalyzer.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aIresumeanalyzer.dao.UserDao;
import com.aIresumeanalyzer.entity.User;
import com.aIresumeanalyzer.repository.UserRepository;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private UserRepository userRepository;

    /*
     * BCrypt password encoder
     * Passwords will never be stored as plain text.
     */
    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();


    // =========================================================
    // REGISTER NEW USER
    // =========================================================

    @Override
    public boolean addNewUser(User user) {

        try {

            // Check whether email already exists
            User existingUser =
                    userRepository.findByEmail(user.getEmail());

            if (existingUser != null) {
                return false;
            }

            /*
             * Convert plain password into BCrypt hash
             * before saving it into database.
             */
            String hashedPassword =
                    passwordEncoder.encode(user.getPassword());

            user.setPassword(hashedPassword);

            // Save user with hashed password
            userRepository.save(user);

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // LOGIN USER
    // =========================================================

    @Override
    public boolean checkUsercredentials(User user) {

        try {

            // Find registered user using email
            User registeredUser =
                    userRepository.findByEmail(user.getEmail());

            // User not found
            if (registeredUser == null) {
                return false;
            }

            // Passwords cannot be null
            if (user.getPassword() == null
                    || registeredUser.getPassword() == null) {

                return false;
            }

            /*
             * BCrypt matches:
             *
             * entered password
             *          ↓
             * stored BCrypt hash
             *
             * If they match → true
             */
            return passwordEncoder.matches(
                    user.getPassword(),
                    registeredUser.getPassword()
            );

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // GET USER BY EMAIL
    // =========================================================

    @Override
    public User getUserByEmail(String email) {

        return userRepository.findByEmail(email);
    }
}