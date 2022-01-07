package org.conan.mapper;

import java.util.List;

import org.conan.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno); //첨부파일 삭제
	public List<BoardAttachVO> getOldFiles(); //오래된 첨부파일 삭제하기위해
}
