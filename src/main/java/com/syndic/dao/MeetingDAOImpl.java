package com.syndic.dao;



import com.syndic.beans.Meeting;
import com.syndic.beans.User;

import java.sql.*;

public class MeetingDAOImpl implements MeetingDAO {

    private final Connection connection;


    public MeetingDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override

    public void addMeeting(Meeting meeting) throws SQLException {
        String query = "INSERT INTO meetings (meeting_date, meeting_time, meeting_topic, meeting_location, " +
                "meeting_type, meeting_residence, meeting_conclusion, meeting_s_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setDate(1, meeting.getMeetingDate());
            preparedStatement.setString(2, meeting.getMeetingTime());
            preparedStatement.setString(3, meeting.getMeetingTopic());
            preparedStatement.setString(4, meeting.getMeetingLocation());
            preparedStatement.setString(5, meeting.getMeetingType());
            preparedStatement.setString(6, meeting.getMeetingResidence());
            preparedStatement.setString(7, meeting.getMeetingConclusion());
            preparedStatement.setInt(8, meeting.getSyndicId());
            preparedStatement.executeUpdate();
        }
    }

    @Override

    public Meeting getMeetingBySyndicId(int syndicId) throws SQLException {
        String query = "SELECT * FROM meetings WHERE syndic_id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, syndicId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int meetingId = resultSet.getInt("meeting_id");
                    Date meetingDate = resultSet.getDate("meeting_date");
                    String meetingTime = resultSet.getString("meeting_time");
                    String meetingTopic = resultSet.getString("meeting_topic");
                    String meetingLocation = resultSet.getString("meeting_location");
                    String meetingType = resultSet.getString("meeting_type");
                    String meetingResidence = resultSet.getString("meeting_residence");
                    String meetingConclusion = resultSet.getString("meeting_conclusion");
                    return new Meeting(meetingId, meetingDate, meetingTime, meetingTopic, meetingLocation,
                            meetingType, meetingResidence, meetingConclusion, syndicId);
                }
            }
        }
        return null; // Retourne null si aucune réunion n'est trouvée avec cet identifiant de syndic.
    }
}
