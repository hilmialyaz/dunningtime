package com.dunningtime.process.delegate;

import java.io.Serializable;

public class PojoTest implements Serializable{

	private String name;
	private int sayi;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSayi() {
		return sayi;
	}
	public void setSayi(int sayi) {
		this.sayi = sayi;
	}
	
	
}
