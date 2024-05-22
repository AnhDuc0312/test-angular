package com.hrms.sys.services.remote;

import com.hrms.sys.dtos.RemoteDTO;
import com.hrms.sys.models.Remote;

import java.util.List;
import java.util.Map;

public interface IRemoteService {
    public List<Remote> getAllRemotes() throws Exception;

    public Remote getRemoteById(long id) throws Exception;

    public Remote createRemote(String username ,RemoteDTO remoteDTO) throws Exception;

    public Remote updateRemote(long id, RemoteDTO remoteDTO) throws Exception;

    public void deleteRemote(long id) throws Exception;

    public void approveRemote(long id) throws Exception;

    public void rejectRemote(long id) throws Exception;

    List<Remote> getRemoteByUserId(long userId) throws Exception;

    Map<String, Long> getRemoteStatisticsForToday() throws Exception;
}
