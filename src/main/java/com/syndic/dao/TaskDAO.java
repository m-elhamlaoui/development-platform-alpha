package com.syndic.dao;

import com.syndic.beans.Task;

import java.util.List;

public interface TaskDAO {
    List<Task> getAllTasks();
    boolean insertTask(Task task);
    boolean updateTask(Task task);
    boolean deleteTask(int taskId);
}
