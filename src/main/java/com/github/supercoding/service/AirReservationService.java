package com.github.supercoding.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.supercoding.repository.AirlineTicket.AirlineTicket;
import com.github.supercoding.repository.AirlineTicket.AirlineTicketAndFlightInfo;
import com.github.supercoding.repository.AirlineTicket.AirlineTicketRepository;
import com.github.supercoding.repository.passenger.Passenger;
import com.github.supercoding.repository.passenger.PassengerRepository;
import com.github.supercoding.repository.reservations.Reservation;
import com.github.supercoding.repository.reservations.ReservationRepository;
import com.github.supercoding.repository.users.UserEntity;
import com.github.supercoding.repository.users.UserRepository;
import com.github.supercoding.web.dto.airline.ReservationRequest;
import com.github.supercoding.web.dto.airline.ReservationResult;
import com.github.supercoding.web.dto.airline.Ticket;

@Service
public class AirReservationService {

  private UserRepository userRepository;
  private AirlineTicketRepository airlineTicketRepository;
  private PassengerRepository passengerRepository;
  private ReservationRepository reservationRepository;

  public AirReservationService(UserRepository userRepository, AirlineTicketRepository airlineTicketRepository, PassengerRepository passengerRepository, ReservationRepository reservationRepository) {
    this.userRepository = userRepository;
    this.airlineTicketRepository = airlineTicketRepository;
    this.passengerRepository = passengerRepository;
    this.reservationRepository = reservationRepository;
  }

  // 조회 작업이므로 트랜잭션 필요 X
  public List<Ticket> findUserFavoritePlaceTickets(Integer userId, String ticketType) {
    // 필요한 Repository : UserRepository, airlineTicketRepository
    // 1. 유저를 userId 로 가져와서, 선호하는 여행지 도출
    // 2. 선호하는 여행지와 ticketType으로 AirlineTIcket table 질의 해서 필요한 AirlineTicket
    // 3. 이 둘의 정보를 조합해서 Ticket DTO를 만든다.

    UserEntity userEntity = userRepository.findUserById(userId);
    String likePlace = userEntity.getLikeTravelPlace();

    List<AirlineTicket> airlineTickets 
        = airlineTicketRepository.findAllAirlineTicketsWithPlaceAndTicketType(likePlace, ticketType);
      
    List<Ticket> tickets = airlineTickets.stream().map(Ticket::new).collect(Collectors.toList());
    return tickets;
  }

  @Transactional(transactionManager = "tm2")
  public ReservationResult makeReservation(ReservationRequest reservationRequest) {
        // 1. Reservation Repository, Passenger Repository, Join table ( flight/airline_ticket ),
            
        // 0. userId,airline_ticke_id
        Integer userId = reservationRequest.getUserId();
        Integer airlineTicketId = reservationRequest.getAirlineTicketId();

        // 1. Passenger ID
        Passenger passenger = passengerRepository.findPassengerByUserId(userId);
        Integer passengerId = passenger.getPassengerId();

        // 2. price 등의 정보 불러오기
        List<AirlineTicketAndFlightInfo> airlineTicketAndFlightInfos
                = airlineTicketRepository.findAllAirLineTicketAndFlightInfo(airlineTicketId);

        // 3. reservation 생성
        Reservation reservation = new Reservation(passengerId, airlineTicketId);
        Boolean isSuccess = reservationRepository.saveReservation(reservation);

        // TODO: ReservationResult DTO 만들기
        List<Integer> prices = airlineTicketAndFlightInfos.stream().map(AirlineTicketAndFlightInfo::getPrice).collect(Collectors.toList());
        List<Integer> charges = airlineTicketAndFlightInfos.stream().map(AirlineTicketAndFlightInfo::getCharge).collect(Collectors.toList());
        Integer tax = airlineTicketAndFlightInfos.stream().map(AirlineTicketAndFlightInfo::getTax).findFirst().get();
        Integer totalPrice = airlineTicketAndFlightInfos.stream().map(AirlineTicketAndFlightInfo::getTotalPrice).findFirst().get();

        return new ReservationResult(prices, charges, tax, totalPrice, isSuccess);
  }
}
