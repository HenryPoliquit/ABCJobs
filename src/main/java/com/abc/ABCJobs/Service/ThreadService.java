package com.abc.ABCJobs.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.ABCJobs.Entity.Thread;
import com.abc.ABCJobs.Repository.ThreadRepository;

@Service
@Transactional
public class ThreadService {
	@Autowired
	ThreadRepository threadRepo;
	
	public Thread save(Thread thread) {
		
		return threadRepo.save(thread);
	}
	
	public List<Thread> getAllThreads() {
		return threadRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public Thread findThread(Long tId) {
		return threadRepo.getById(tId);
	}
	
	public void deleteThread(long tId) {
		threadRepo.deleteById(tId);
	}
	public Optional<Thread> getThreadInfo(long tId){
		
		return threadRepo.findById(tId);
	}
}
