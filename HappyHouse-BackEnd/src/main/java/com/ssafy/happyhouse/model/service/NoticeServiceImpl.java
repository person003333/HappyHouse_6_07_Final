package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public void registerNotice(NoticeDto notice) throws SQLException {
		noticeMapper.registerNotice(notice);
	}

	@Override
	public List<NoticeDto> listNotice() throws Exception {
		return noticeMapper.listNotice();
	}

	@Override
	@Transactional
	public NoticeDto getNotice(int noticeNo) throws Exception {
		noticeMapper.updateView(noticeNo);
		return noticeMapper.getNotice(noticeNo);
	}

	@Override
	public void updateNotice(NoticeDto notice) throws Exception {
		noticeMapper.updateNotice(notice);
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		noticeMapper.deleteNotice(noticeNo);
	}

	@Override
	public void updateView(int noticeNo) throws Exception {
		noticeMapper.updateView(noticeNo);
	}
}
