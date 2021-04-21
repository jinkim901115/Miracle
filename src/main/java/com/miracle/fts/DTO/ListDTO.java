package com.miracle.fts.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListDTO {
	private int suid;
	private String sname;
	private String saddr;
	private String scomt;
	private String sopinfo;
	private double slat;
	private double slng;
	private String spic;
	private String sthn;
	private int uid;
	private int muid;
	private String mname;
	private String mpics;
	private int mbest;
	private String cnt;
	private String search = "";
	
	public ListDTO() {
		super();
	}

	public ListDTO(int suid, String sname, String saddr, String scomt, String sopinfo, double slat, double slng,
			String spic, String sthn, int uid, int muid, String mname, String mpics, int mbest, String cnt,
			String search) {
		super();
		this.suid = suid;
		this.sname = sname;
		this.saddr = saddr;
		this.scomt = scomt;
		this.sopinfo = sopinfo;
		this.slat = slat;
		this.slng = slng;
		this.spic = spic;
		this.sthn = sthn;
		this.uid = uid;
		this.muid = muid;
		this.mname = mname;
		this.mpics = mpics;
		this.mbest = mbest;
		this.cnt = cnt;
		this.search = search;
	}


	
	

	
	
	

	
	
}
