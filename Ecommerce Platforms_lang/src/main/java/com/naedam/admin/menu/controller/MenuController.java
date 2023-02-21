package com.naedam.admin.menu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.menu.model.service.MenuService;
import com.naedam.admin.menu.model.vo.Bottom;
import com.naedam.admin.menu.model.vo.Head;
import com.naedam.admin.menu.model.vo.Menu;
import com.naedam.admin.menu.model.vo.MenuCategory;



@Controller
@RequestMapping("/admin/menu/*")
public class MenuController {

	@Autowired	
	private MenuService menuService;
	
	/**
	 * 메뉴 관리 => 메뉴 관리 DML 프로세스
	 * @param menu
	 * @param head
	 * @param bottom
	 * @param mode
	 * @param part
	 * @return
	 * @throws Exception
	 */
	@PostMapping("menuProcess")
	public String menuProcess(@ModelAttribute("menu") Menu menu, 
							  @ModelAttribute("head") Head head, 
							  @ModelAttribute("bottom") Bottom bottom,
							  @RequestParam("mode") String mode, 
							  @RequestParam("part") String part) throws Exception{
		Map<String, Object> menuMap = new HashMap<>();
		menuMap.put("menu", menu);
		menuMap.put("head", head);
		menuMap.put("bottom", bottom);
		menuMap.put("mode", mode);
		menuMap.put("part", part);
		return menuService.menuProcess(menuMap);
	}
	
	@PostMapping("headProcess")
	public String headProcess(@ModelAttribute("head") Head head,
							  @RequestParam("mode") String mode,
							  @RequestParam(value="image", required = false) MultipartFile headImage,
							  @RequestParam(value="imageStatus", required = false) String imageStatus,
							  HttpServletRequest request) throws Exception{
		String filePath = request.getServletContext().getRealPath("resources/user/images/main/");
		Map<String, Object> headMap = new HashMap<>();
		headMap.put("head", head);
		headMap.put("mode", mode);
		headMap.put("headImage", headImage);
		headMap.put("filePath", filePath);
		headMap.put("imageStatus", imageStatus);
		
		System.out.println("imageStatus >>>" + imageStatus);
		System.out.println("headMap.headImage >>>" + headMap.get("headImage"));
		
		return menuService.headProcess(headMap);
	}
	
	/**
	 * 메뉴 관리 => 메뉴 괸리 리스트 조회
	 * @param menu 리스트 조회
	 * list는 ord = 1, list2 = code != 1
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="menu")
	public String listMenu(Menu menu, Model model) throws Exception{
		System.out.println("menu 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = menuService.getMenuList(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap.get("list2"));
		model.addAttribute("board", resultMap.get("board"));
		return "admin/menu/menu";
	}
	
	/**
	 * 메뉴 관리 => 메뉴 괸리 리스트 조회
	 * list는 ord = 1, list2 = code != 1 and ord = 3
	 * @param menu
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="menu2")
	public String listMenu2(@ModelAttribute("menu") Menu menu, Model model) throws Exception{
		System.out.println("menu2 시작");
		menu.setOrd(menu.getOrd()+1);
		System.out.println("menu 체크 === "+menu);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		Map<String, Object> resultMap = menuService.getMenuList2(map);
		model.addAttribute("menu", menu);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap.get("list2"));			
		return "admin/menu/menuList";
	}	
	
	/**
	 * 메뉴관리 => 메뉴 관리 리스트 조회
	 * @param menu
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="menuList")
	public String menuList(Menu menu, Model model, HttpServletRequest request) throws Exception{
		System.out.println("menuList 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = menuService.getMenuList(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap.get("list2"));
		return "admin/menu/menuList";
	}
	
	/**
	 * iframe tree 리스트 조회
	 * @param model
	 * @param menuCategory
	 * @return
	 * @throws Exception
	 */
	@GetMapping("tree")
	public String tree(Model model, MenuCategory menuCategory) throws Exception{
		System.out.println("menuCategory/tree 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = menuService.getMenuCategoryList(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap.get("list2"));
		model.addAttribute("list3", resultMap.get("list3"));
		return "admin/menu/tree";
	}
	
	/**
	 * 메뉴 관리 => 헤드 관리 리스트 조회
	 * @param head
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="headList")
	public String headList(Head head, Model model) throws Exception{
		System.out.println("head/headList 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = menuService.getHeadList(map);
		model.addAttribute("list", resultMap.get("list"));
		return "admin/menu/head";
	}	
	
	/**
	 * 메뉴 관리 => 하단 관리 리스트 조회
	 * @param model
	 * @param bottom
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="bottomList")
	public String bottomList(Model model, Bottom bottom) throws Exception{
		System.out.println("bottom/bottomList 시작");
		bottom = menuService.getBottom();
		model.addAttribute("bottom", bottom);
		return "admin/menu/bottom";
	}

}

