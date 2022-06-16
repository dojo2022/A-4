package model.childcare;

import java.io.Serializable;

public class ChildcareQuestLabel implements Serializable {

	private int childcare_quest_label_id;
	private String content_label;

	public int getChildcare_quest_label_id() {
		return childcare_quest_label_id;
	}
	public void setChildcare_quest_label_id(int childcare_quest_label_id) {
		this.childcare_quest_label_id = childcare_quest_label_id;
	}
	public String getContent_label() {
		return content_label;
	}
	public void setContent_label(String content_label) {
		this.content_label = content_label;
	}
}
