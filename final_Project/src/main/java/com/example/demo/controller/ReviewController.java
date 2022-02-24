package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ReviewDAO;
import com.example.demo.vo.ContentReviewVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.ListReviewVO;
import com.example.demo.vo.ReviewVO;

import lombok.Setter;

@Controller
@Setter
public class ReviewController {
	
	@Autowired
	private ReviewDAO dao;
	
	@RequestMapping("/mypage/listReviewWrite")
	public void listReviewWrite(HttpSession session,Model model){
		String cust_id = (String)session.getAttribute("cust_id");
		model.addAttribute("list", dao.listReviewWrite(cust_id));
	}
	
	@RequestMapping("/mypage/listReviewComplete")
	public void listReviewComplete(HttpSession session,Model model) {
		//String cust_id = "pagy1218";
		String cust_id = (String)session.getAttribute("cust_id");
		model.addAttribute("list", dao.listReviewComplete(cust_id));
	}
	
	@RequestMapping("/mypage/deleteReview/{review_no}")
	public ModelAndView deleteReview(HttpServletRequest request,@PathVariable int review_no) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/listReviewComplete");
		String oldFname = dao.contentReview(review_no).getReview_img();
		System.out.println("oldFname:"+oldFname);
		
		int re = dao.deleteReview(review_no);
		if(re != 1) {
			mav.setViewName("/common/error");
			mav.addObject("msg", "상품후기 삭제에 실패하였습니다.");
		}else {
			String path = request.getRealPath("images");
			System.out.println("path:"+path);
			File file = new File(path + "/" + oldFname);
			file.delete();
		}
		return mav;
	}
	
	@RequestMapping(value = "/mypage/updateReview",method = RequestMethod.GET)
	public void updateReview_form(int review_no,Model model) {
		model.addAttribute("c", dao.contentReview(review_no));
		model.addAttribute("r", dao.findByNo(review_no));
		System.out.println("r:"+dao.findByNo(review_no));
	}
	
	@RequestMapping(value = "/mypage/updateReview",method = RequestMethod.POST)
	public ModelAndView updateReview_submit(HttpServletRequest request,ReviewVO r) {
		ModelAndView mav = new ModelAndView("redirect:/mypage/listReviewComplete");
		String path = request.getRealPath("images");
		System.out.println("path:"+path);
		
		MultipartFile uploadFile = r.getUploadFile();
		String review_img = uploadFile.getOriginalFilename();
		
		if(review_img != null && !review_img.equals("")) {
			r.setReview_img(review_img);
		}
		
		int re = dao.updateReview(r);
		if(re != 1) {
			mav.setViewName("/common/error");
			mav.addObject("msg", "상품후기 등록에 실패하였습니다.");
		}else {
			try {
				byte[] data = uploadFile.getBytes();
				if(review_img != null && !review_img.equals("")) {
					FileOutputStream fos = new FileOutputStream(path + "/" + review_img);
					fos.write(data);
					fos.close();
				}
			}catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
		}
		return mav;
	}
	
	@RequestMapping("/mypage/contentReview")
	public void contentReview(int review_no,Model model) {
		ContentReviewVO c = dao.contentReview(review_no);
		c.setReview_no(review_no);
		model.addAttribute("c", c);
	}
}
