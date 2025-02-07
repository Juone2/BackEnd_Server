package com.github.supercoding.repository.users;

import org.springframework.jdbc.core.RowMapper;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserJdbcTemplateDao implements UserRepository {

  private JdbcTemplate jdbcTemplate;

  public UserJdbcTemplateDao(@Qualifier("jdbcTemplate2") JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  static RowMapper<UserEntity> userEntityRowMapper = ((rs, rowNum) -> {
    return new UserEntity(
        rs.getInt("user_id"),
        rs.getString("user_name"),
        rs.getString("like_travel_place"),
        rs.getString("phone_num"));
  });

  @Override
  public UserEntity findUserById(Integer userId) {
    return jdbcTemplate.queryForObject("SELECT * FROM users WHERE user_id = ?", userEntityRowMapper, userId);
  }
  
  
}
