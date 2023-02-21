package com.naedam.admin.setting.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Partner implements Serializable {

	private static final long serialVersionUID = 1L;
	private int partnerNo;
	private String partnerName;
	private String in_dtm;
	private String partnerImage;
	private int partnerAsc;
	
}
