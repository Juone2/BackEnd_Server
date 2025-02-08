package com.github.supercoding.repository.member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberAuthJdbcDao implements MemberRepository{
  private JdbcTemplate template;

  public MemberAuthJdbcDao(@Qualifier("jdbcTemplate2") JdbcTemplate jdbcTemplate) {
    this.template = jdbcTemplate;
  }
  
  @Override
  public Member createMember(Member member) {
    template.update("INSERT INTO members(user_id, email, password, username, github_name, major) VALUES (?, ?, ?, ?, ?, ?)",
    member.getUserId(), member.getEmail(), member.getPassword(), member.getUserName(), member.getGithubName(), member.getMajor());

    return member;
  } 
}
