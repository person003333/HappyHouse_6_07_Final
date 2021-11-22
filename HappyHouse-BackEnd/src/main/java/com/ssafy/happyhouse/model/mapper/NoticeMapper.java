package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeMapper {
	
	void registerNotice(NoticeDto notice) throws SQLException;

	List<NoticeDto> listNotice() throws Exception;
	
	List<NoticeDto> notice() throws Exception;

	NoticeDto getNotice(int noticeNo) throws Exception;

	void updateNotice(NoticeDto notice) throws Exception;

	void deleteNotice(int noticeNo) throws Exception;

	void updateView(int noticeNo)throws Exception;
}
