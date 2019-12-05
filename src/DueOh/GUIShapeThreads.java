package DueOh;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;


public class GUIShapeThreads extends JFrame {
	public static final long serialVersionUID = 1;
	private Label timeLeft;
	private long start;
	public GUIShapeThreads(String assignment, String classname, long time) {
		super("GUI Shape Threads");
		setSize(400, 200);
		setLocation(850, 50);
		setTitle(assignment);
		this.getContentPane().setBackground(new Color(255, 179, 125));
		start = time;
		
		timeLeft = new Label();
		timeLeft.setTimeLeft(start);
		timeLeft.setBounds(25, 50, 200, 100);
		timeLeft.setHW(assignment);
		timeLeft.setClassname(classname);
		add(timeLeft);
		
		Thread t = new Thread(timeLeft);
		t.start();
		setVisible(true);
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
	}

	class Label extends JLabel implements Runnable {
		public static final long serialVersionUID = 1;
		private long time;
		private String hw;
		private String classname;
		
		public void setTimeLeft(long input) {
			this.time = input;
		}//constructor
		
		public void setHW(String name) {
			this.hw = name;
		}//setHW
		
		public void setClassname(String classname) {
			this.classname = classname;
		}//setClassname
		
		public void run() {
			try {
				while (true) {
					Font labelFont = this.getFont();
					String labelText = this.getText();

					int stringWidth = this.getFontMetrics(labelFont).stringWidth(labelText);
					int componentWidth = this.getWidth();

					// Find out how much the font can grow in width.
					double widthRatio = (double)componentWidth / (double)stringWidth;

					int newFontSize = (int)(labelFont.getSize() * widthRatio);
					int componentHeight = this.getHeight();

					// Pick a new font size so it will not be larger than the height of label.
					int fontSizeToUse = Math.min(newFontSize, componentHeight);

					// Set the label's font size to the newly determined size.
					this.setFont(new Font(labelFont.getName(), Font.PLAIN, fontSizeToUse));
					
					
					long difference = time - System.currentTimeMillis();
					int days = (int) (difference / 86400000);
					difference %= 86400000;
					int hours = (int) (difference/ 3600000);
					difference %= 3600000;
					int minutes = (int) (difference / 60000);
					difference %= 60000;
					int seconds = (int) (difference / 1000);
					if (days <= 0) {
						setText(" Hurry! <" + this.classname + "> <" + this.hw + "> is due in " + hours + " hours " + minutes + " minutes " + seconds + " seconds!");
						if (hours <= 0) {
							setText(" Hurry! <" + this.classname + "> <" + this.hw + "> is due in " + minutes + " minutes " + seconds + " seconds!");
							if (minutes <= 0) {
								setText(" Hurry! <" + this.classname + "> <" + this.hw + "> is due in " + seconds + " seconds!");
							}//if
						}//if
					}//if
					else {
						setText(" Hurry! <" + this.classname + "> <" + this.hw + "> is due in " + days + " days " + hours + " hours " + minutes + " minutes " + seconds + " seconds!");
					}//else
					Thread.sleep(1000);
				}//while
			}//try
			catch (InterruptedException ie) {
				System.out.println("ie: " + ie.getMessage());
			}//catch
		}//run
	}//Label
}//GUIShapeThreads