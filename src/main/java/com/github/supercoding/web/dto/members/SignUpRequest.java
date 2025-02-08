package com.github.supercoding.web.dto.members;

public class SignUpRequest {
  private String userId;
  private String email;
  private String password;
  private String userName;
  private String githubName;
  private String major;

  public SignUpRequest(String userId, String email, String password, String userName, String githubName, String major) {
    this.userId = userId;
    this.email = email;
    this.password = password;
    this.userName = userName;
    this.githubName = githubName;
    this.major = major;
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

  public void setPassword(String password) {
    this.password = password;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public void setGithubName(String githubName) {
    this.githubName = githubName;
  }

  public void setMajor(String major) {
    this.major = major;
  }
}
