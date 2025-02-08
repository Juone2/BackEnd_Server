package com.github.supercoding.web.controller;

import java.net.URI;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.supercoding.repository.member.Member;
import com.github.supercoding.service.MemberAuthService;
import com.github.supercoding.web.dto.members.SignUpRequest;

@RestController
@RequestMapping("/api/members")
public class MemberAuthController {
  private MemberAuthService memberAuthService;

  public MemberAuthController(MemberAuthService memberAuthService) {
    this.memberAuthService = memberAuthService;
  }

  @PostMapping("/signup")
  public ResponseEntity<Member> signUp(@RequestBody SignUpRequest signUpRequest) {
    Member createdMember = memberAuthService.createMember(signUpRequest);
    return ResponseEntity.created(URI.create("/api/members/" + createdMember.getUserId())).body(createdMember);
  }
}
