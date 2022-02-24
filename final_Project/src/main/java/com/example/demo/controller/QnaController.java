package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.QnaVO;

import lombok.Setter;

@Controller
@Setter
public class QnaController {

	@Autowired
	private QnaDAO dao;
	
	@RequestMapping("/mypage/listQna")
	public void list(HttpSession session, Model model) {
		CustomerVO member = (CustomerVO)session.getAttribute("member");
		model.addAttribute("list",dao.listQna(member.getCust_id()));
	}
	
	@RequestMapping(value = "/mypage/insertQna", method = RequestMethod.GET)
	public void insert_form(Model model) {
		model.addAttribute("qna_no",dao.getNextNo());
	}
	
	@RequestMapping(value = "/mypage/insertQna", method = RequestMethod.POST)
	public ModelAndView insert_submit(HttpServletRequest request, QnaVO q) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/listQna");
		int qna_no = dao.getNextNo();
		String path = request.getRealPath("images");
		System.out.println("path:"+path);
		q.setQna_img("");
		MultipartFile uploadFile = q.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		//업로드한 파일이 있나?
		if(fname != null && !fname.equals("")) {
			q.setQna_img(fname);
		}
		int re = dao.insertQna(q);
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg","게시글 등록에 실패하였습니다");
		}else {//insert성공했으면
			try {
				byte []data = uploadFile.getBytes();
				if(fname != null && !fname.equals("")) {
					FileOutputStream fos = new FileOutputStream(path+"/"+fname);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
		}
		return mav;
	}
	
	@RequestMapping("/mypage/detailQna")
	public ModelAndView detail(int qna_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("q",dao.detailQna(qna_no));
		return mav;
	}
	
	@RequestMapping(value = "/mypage/updateQna", method = RequestMethod.GET)
	public void update_form(Model model, int qna_no) {
		model.addAttribute("q",dao.detailQna(qna_no));
	}
	
	@RequestMapping(value = "/mypage/updateQna", method = RequestMethod.POST)
	public ModelAndView update_submit(HttpServletRequest request, QnaVO q) {
		//파일경로
		String path = request.getRealPath("images");
		//원래 사진이름을 미리 변수에 담아준다
		String oldFname = q.getQna_img();
		//업로드한 파일의 정보를 받아온다
		MultipartFile uploadFile = q.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		
		try {
			//업로드한 파일을 바이츠타입으로 변환해서 받아온다
			byte []data = uploadFile.getBytes();
			//만약 사진도 수정했다면, 업로드한 파일이 있다면 파일을 복사한다
			if(fname != null && !fname.equals("")) {//업로드한 파일이있나?
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
				fos.close();
				q.setQna_img(fname);
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());	
		}
		ModelAndView mav = new ModelAndView("redirect:/mypage/listQna");
		int re = dao.updateQna(q);
		
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "게시글 수정에 실패하였습니다.");
		}else { //수정에 성공
			if(oldFname != null && !oldFname.equals("")){ //사진도 수정을 했다면
				File file = new File(path +"/"+oldFname);
				file.delete(); //원래사진을 삭제한다
			}
		}
		return mav;
	}
	
	@RequestMapping("/mypage/deleteQna")
	public ModelAndView delete(HttpServletRequest request, int qna_no) {
		String path = request.getRealPath("images");
		//상품번호를 알면, 지우고자하는 상품의 파일명을 알 수 있다
		//지우려고 하는 상품사진이름을 알아오고 그것의 qan_img을 미리 oldFname에 담아준다
		String oldFname = dao.detailQna(qna_no).getQna_img();
		
		ModelAndView mav = new ModelAndView("redirect:/mypage/listQna");
		int re = dao.deleteQna(qna_no);
		if(re != 1) {
			mav.setViewName("error");
			mav.addObject("msg", "게시물 삭제에 실패하였습니다.");
		}else {
			File file = new File(path+"/"+oldFname);
			file.delete();
		}
		return mav;
	}
	
}













