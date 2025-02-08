package com.github.supercoding.web.dto.members;

import com.github.supercoding.repository.member.Member;

public class SignUpResponse {
    private String userId;
    private String email;
    private String userName;
    private String githubName;
    private String major;

    public SignUpResponse(Member member) {
        this.userId = member.getUserId();
        this.email = member.getEmail();
        this.userName = member.getUserName();
        this.githubName = member.getGithubName();
        this.major = member.getMajor();
    }

    // getters
    public String getUserId() { return userId; }
    public String getEmail() { return email; }
    public String getUserName() { return userName; }
    public String getGithubName() { return githubName; }
    public String getMajor() { return major; }
}