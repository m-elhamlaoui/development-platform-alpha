package com.syndic.dao;

import com.syndic.beans.Meeting;


import java.sql.SQLException;

public interface MeetingDAO {

    void addMeeting(Meeting meeting) throws SQLException;

    Meeting getMeetingBySyndicId(int SyndicId) throws SQLException;
}
