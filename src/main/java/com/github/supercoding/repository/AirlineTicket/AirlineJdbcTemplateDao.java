package com.github.supercoding.repository.AirlineTicket;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

@Repository
public class AirlineJdbcTemplateDao implements AirlineTicketRepository{
  private JdbcTemplate jdbcTemplate;

  public AirlineJdbcTemplateDao(@Qualifier("jdbcTemplate2") JdbcTemplate jdbcTemplate) {
    this.jdbcTemplate = jdbcTemplate;
  }

  static RowMapper<AirlineTicket> airlineTicketRowMapper = (((rs, rowNum) ->
    new AirlineTicket(
          rs.getInt("ticket_id"),
          rs.getString("ticket_type"),
          rs.getNString("departure_loc"),
          rs.getNString("arrival_loc"),
          rs.getDate("departure_at"),
          rs.getDate("return_at"),
          rs.getDouble("tax"),
          rs.getDouble("total_price")
        )
    ));

  static RowMapper<AirlineTicketAndFlightInfo> airlineTicketAndFlightInfoRowMapper
    = (((rs, rowNum) ->
        new AirlineTicketAndFlightInfo(
                rs.getInt("A.ticket_id"),
                rs.getDouble("F.flight_price"),
                rs.getDouble("F.charge"),
                rs.getDouble("A.tax"),
                rs.getDouble("A.total_price")
        )
    ));

  @Override
  public List<AirlineTicket> findAllAirlineTicketsWithPlaceAndTicketType(String likePlace, String ticketType) {
    return jdbcTemplate.query("SELECT * FROM airline_ticket " +
        "WHERE arrival_loc = ? AND ticket_type = ?", airlineTicketRowMapper, likePlace, ticketType);
  }

    @Override
    public List<AirlineTicketAndFlightInfo> findAllAirLineTicketAndFlightInfo(Integer airlineTicketId) {
        return jdbcTemplate.query("SELECT A.ticket_id, A.tax, A.total_price, F.flight_price, F.charge " +
                                  "    FROM airline_ticket A " +
                                  "         INNER JOIN flight F " +
                                  "         ON A.ticket_id = F.ticket_id " +
                                  "     WHERE A.ticket_id = ?", airlineTicketAndFlightInfoRowMapper, airlineTicketId);
    }
}
