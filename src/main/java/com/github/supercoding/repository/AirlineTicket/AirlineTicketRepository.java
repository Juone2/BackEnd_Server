package com.github.supercoding.repository.AirlineTicket;

import java.util.List;

public interface AirlineTicketRepository {
  List<AirlineTicket> findAllAirlineTicketsWithPlaceAndTicketType(String place, String ticketType);

  List<AirlineTicketAndFlightInfo> findAllAirLineTicketAndFlightInfo(Integer airlineTicketId);
}
