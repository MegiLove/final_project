package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.ProductDAO;
import com.example.demo.dao.QnaDAO;
import com.example.demo.dao.ReviewDAO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.ContentReviewVO;
import com.example.demo.vo.ListQnaVO;
import com.example.demo.vo.ProductVO;

import lombok.Setter;

@Controller
@Setter
public class ProductController {
	
	@Autowired
	private ProductDAO dao;
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@Autowired
	private QnaDAO qnaDao;
	
	@Autowired
	private CartDAO cartDao;
	
	
	@RequestMapping("/market/listProduct")
	public void listProduct(String category_code,String orderType,Model model,HttpSession session,@RequestParam(defaultValue = "1") int pageNUM){

		if(category_code == null) {
			category_code = (String)session.getAttribute("category_code");
		}
		
		if(orderType == null && session.getAttribute("orderType") != null) {
			orderType = (String)session.getAttribute("orderType");
		}
		
		System.out.println("정렬컬럼:"+orderType);
		System.out.println("pageNUM:"+pageNUM);
		
		int start = (pageNUM-1)*dao.pageSIZE +1;
		int end = start + dao.pageSIZE -1;
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		
		HashMap map = new HashMap();
		map.put("orderType", orderType);
		map.put("category_code", category_code);
		map.put("start", start);
		map.put("end",end);
		System.out.println("category_code:"+category_code);
		
		model.addAttribute("list", dao.listProduct(map));
		model.addAttribute("totalPage", dao.totalPage);
		
		if(category_code != null) {
			session.setAttribute("category_code", category_code);
		}
		
		
		if(orderType != null) {
			session.setAttribute("orderType", orderType);
		}
	}
	
	@RequestMapping("/market/recentProduct")
	public void recentProduct(String orderType,Model model) {
		System.out.println("orderType:"+orderType);
		model.addAttribute("list", dao.recentProduct(orderType));
	}
	
	@RequestMapping("/market/detailProduct")
	public void detailProduct(int product_no,Model model,HttpSession session) {
		String cust_id = (String)session.getAttribute("cust_id");
		ProductVO p = dao.detailProduct(product_no);
		p.setProduct_no(product_no);
		model.addAttribute("p", p);
		System.out.println("p:"+p);
		
		List<ContentReviewVO> reviewList = reviewDao.findAllReview(product_no);
		model.addAttribute("reviewList", reviewList);
		System.out.println("reviewList:"+reviewList);
		
		List<ListQnaVO> qnaList = qnaDao.findAllQna(product_no);
		model.addAttribute("qnaList", qnaList);
		System.out.println("qnaList:"+qnaList);
	}
	
	@RequestMapping(value = "/market/insertCart",method = RequestMethod.POST)
	@ResponseBody
	public String insertCart(@RequestBody String data) {
		String[] arr = data.split(",");
		System.out.println("arr1:"+arr[0]);
		System.out.println("arr2:"+arr[1]);
		System.out.println("arr3:"+arr[2]);
		
		String cust_id = arr[0].substring(12, arr[0].length()-1);
		int product_no = Integer.parseInt(arr[1].substring(14, arr[1].length()-1));
		int product_cnt = Integer.parseInt(arr[2].substring(15,arr[2].length()-2 ));
		System.out.println("cust_id:"+cust_id);
		System.out.println("product_no:"+product_no);
		System.out.println("product_cnt:"+product_cnt);
		int re = 0;
		

		if(cartDao.findByProduct(cust_id,product_no) == 1) {
			re = -1;
		}else {
			CartVO c = new CartVO(cartDao.cartGetNextNo(), product_cnt, cust_id, product_no);
			re = cartDao.insertCart(c);
		}
		
		return re>0?"true":"false";
	}
	
	@RequestMapping("/admin/adminMain")
	@ResponseBody
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(value="/admin/mgr_insertProduct", method = RequestMethod.GET)
	public void insertForm(HttpServletRequest request,Model model, @RequestParam(value = "product_no", defaultValue = "0") int product_no) {
		model.addAttribute("product_no", product_no);
	}
	
	@RequestMapping(value="/admin/mgr_insertProduct", method = RequestMethod.POST)
	public ModelAndView insertSubmit(HttpServletRequest request , ProductVO p) {
		//requst객체를 통해 업로드할 폴더의 실제경로를 읽어온다
		String path = request.getRealPath("images");
		System.out.println("path:"+path);
		
		//vo에 업로드할 파일이름을 알아온다
		MultipartFile uploadFile = p.getUploadFile();
		MultipartFile uploadFiledetail = p.getUploadFiledetail();
		String fname_detail=uploadFiledetail.getOriginalFilename();
		String fname = uploadFile.getOriginalFilename();
		p.setProduct_img(fname);
		p.setProduct_detail(fname_detail);
		System.out.println(fname_detail);
		try {
			//업로드한 파일의 내용을 받아온다
			//파일을 바이츠타입으로 반환
			byte []data = uploadFile.getBytes();
			byte []data_detail = uploadFiledetail.getBytes();
			
			//서버에 파일을 출력하기 위한 스트림을 생성
			FileOutputStream fos
				= new FileOutputStream(path + "/" + fname);
			FileOutputStream fos_detail
			= new FileOutputStream(path + "/" + fname_detail);

			//서버에 파일을 출력
			fos.write(data);
			fos_detail.write(data_detail);

			fos.close();
			fos_detail.close();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		
		int product_no = dao.product_getNextNo();
		p.setProduct_no(product_no);
		int re = dao.mgr_insertProduct(p);
		ModelAndView mav = new ModelAndView("redirect:/admin/mgr_listProduct");
		if(re != 1) {
			mav.setViewName("/common/error");
			mav.addObject("msg","상품등록에 실패하였습니다.");
		}
		return mav;
	}
	
	@RequestMapping("/admin/mgr_listProduct")
	public void listProduct(Model model,HttpSession session,@RequestParam(defaultValue = "1") int mgr_pageNUM){		
		
		System.out.println("mgr_pageNUM:"+mgr_pageNUM);
		
		int start = (mgr_pageNUM-1)*dao.mgr_pageSIZE +1;
		int end = start + dao.mgr_pageSIZE -1;
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		
		
		HashMap map = new HashMap();
		//map.put("orderColumn", orderColumn);
		map.put("start", start);
		map.put("end",end);
		
		/*
		 * ResultVO r = new ResultVO(); r.setList(dao.listProduct(map));
		 * r.setTotalPage(dao.totalPage);
		 * System.out.println("totalPage:"+dao.totalPage);
		 * 
		 * return r;
		 */
		
		//model.addAttribute("list", dao.listProduct(category_code));
		model.addAttribute("list", dao.mgr_listProduct(map));
		model.addAttribute("mgr_totalPage", dao.mgr_totalPage);
				
//		if(orderColumn != null) {
//			session.setAttribute("orderColumn", orderColumn);
//		}
	}
	
	@RequestMapping("/admin/mgr_detailProduct")
	public ModelAndView mgr_detailProduct(int product_no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("p",dao.mgr_detailProduct(product_no));
		return mav;
	}
	
	@RequestMapping(value="/admin/mgr_updateProduct", method = RequestMethod.GET)
	public void updateForm(Model model, int product_no) {
		model.addAttribute("p",dao.mgr_detailProduct(product_no));
	}
	
	@RequestMapping(value="/admin/mgr_updateProduct", method = RequestMethod.POST)
	public ModelAndView updateSubmit(HttpServletRequest request, ProductVO p) {
		//파일경로
		String path = request.getRealPath("images");
		
		//원래 사진이름을 미리 변수에 담아준다
		String oldFname = p.getProduct_img();
		String oldFname_detail=p.getProduct_detail();
		
		//업로드한 파일의 정보를 받아온다
		MultipartFile uploadFile = p.getUploadFile();
		MultipartFile uploadFiledetail = p.getUploadFiledetail();
		String fname_detail=uploadFiledetail.getOriginalFilename();
		String fname = uploadFile.getOriginalFilename();
		
		try {
			//업로드한 파일을 바이츠타입으로 변환해서 받아온다
			byte []data = uploadFile.getBytes();
			byte []data_detail = uploadFiledetail.getBytes();
			
			//만약, 사진도 수정했다면, 업로드한 파일이 있다면 파일을 복사한다
			if(fname != null && !fname.equals("")) { //업로드한 파일이있나?
				FileOutputStream fos =  new FileOutputStream(path+"/"+fname);
				fos.write(data);
				fos.close();
				p.setProduct_img(fname);
			}
			
			if(fname_detail != null && !fname_detail.equals("")) { //업로드한 파일이있나?
				FileOutputStream fos_detail =  new FileOutputStream(path+"/"+fname_detail);
				fos_detail.write(data_detail);
				fos_detail.close();
				p.setProduct_detail(fname_detail);
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		
		ModelAndView mav = new ModelAndView("redirect:/admin/mgr_listProduct");
		int re = dao.mgr_updateProduct(p);
		if(re != 1) {
			mav.setViewName("/common/error");
			mav.addObject("msg","상품 수정에 실패하였습니다.");
		}else { //수정에성공하고
			if(fname != null && !fname.equals("")) { //사진도 수정을 했다면
				File file = new File(path+"/"+oldFname);
				file.delete(); //원래사진을 삭제한다
			}
		}
		
		return mav;
	}
	
	@RequestMapping("/admin/mgr_deleteProduct")
	public ModelAndView delete(HttpServletRequest request, int product_no) {
		String path = request.getRealPath("images");
		//상품번호를 알면, 지우고자하는 상품의 파일명을 알 수있다
		//지우려고 하는 상품사진이름을 알아오자
		//해당상품을 가지고와서 그것의 fname을 미리 oldFname에 담아주자
		String oldFname = dao.mgr_detailProduct(product_no).getProduct_img();
		String oldFname_detail = dao.mgr_detailProduct(product_no).getProduct_detail();
		
		ModelAndView mav = new ModelAndView("redirect:/admin/mgr_listProduct");
		int re = dao.mgr_deleteProduct(product_no);
		if(re != 1) {
			mav.setViewName("/common/error");
			mav.addObject("msg","상품삭제에 실패하였습니다.");
		}else {
			File file = new File(path+"/"+oldFname);
			File file_detail = new File(path+"/"+oldFname_detail);
			file.delete();
			file_detail.delete();
		}
		return mav;
	}
	
	@RequestMapping(value="/admin/category_sale", method = RequestMethod.GET)
	public void category_sale() {
		
	}
	
	
	@RequestMapping(value="/admin/category_sale", method = RequestMethod.POST)
	@ResponseBody
	public Object category_sale(String category_code) {
		System.out.println(category_code);
		List<ProductVO> list = dao.category_sale(category_code);
		System.out.println(list);

		return list;
	}
	
}
