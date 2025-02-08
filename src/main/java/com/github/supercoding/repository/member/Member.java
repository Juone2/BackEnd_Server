package com.github.supercoding.repository.member;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "members")
public class Member {

  @Id
  private Integer memberId;
  private String userId;
  private String email;
  private String password;
  private String userName;
  private String githubName;
  private String major;


  public Member(String userId, String email, String password, String userName, String githubName, String major) {
    this.userId = userId;
    this.email = email;
    this.password = password;
    this.userName = userName;
    this.githubName = githubName;
    this.major = major;
  }

  public Integer getMemberId() {
    return memberId;
  }

  public void setMemberId(Integer memberId) {
    this.memberId = memberId;
}

  public String getUserId() {
    return userId;
  }

  public String getEmail() {
    return email;
  }

  public String getPassword() {
    return password;
  }

  public String getUserName() {
    return userName;
  }

  public String getGithubName() {
    return githubName;
  }

  public String getMajor() {
    return major;
  }
}