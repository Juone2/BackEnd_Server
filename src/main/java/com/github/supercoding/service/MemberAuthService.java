package com.github.supercoding.service;

import org.springframework.stereotype.Service;

import com.github.supercoding.repository.member.Member;
import com.github.supercoding.repository.member.MemberRepository;
import com.github.supercoding.web.dto.members.SignUpRequest;

@Service
public class MemberAuthService {
  private MemberRepository memberRepository;

  public MemberAuthService(MemberRepository memberRepository) {
    this.memberRepository = memberRepository;
  }

  public Member createMember(SignUpRequest signUpRequest) {
    Member member = new Member(signUpRequest.getUserId(), signUpRequest.getEmail(), signUpRequest.getPassword(), signUpRequest.getUserName(), signUpRequest.getGithubName(), signUpRequest.getMajor());
    return memberRepository.createMember(member);
  }
}
