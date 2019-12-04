package DueOh;

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
	private Label description;
	private long start;
	public GUIShapeThreads(String assignment, long time) {
		super("GUI Shape Threads");
		setSize(200, 200);
		setLocation(850, 50);
		setTitle(assignment);
		start = time;
//		setLayout(null);
		
		description = new Label();
//		description.setBounds(50, 50, 50, 50);
		description.setText("Your " + this.getTitle() + "is due in: ");
		add(description);
		
		timeLeft = new Label();
		timeLeft.setTimeLeft(start);
//		timeLeft.setBounds(50, 50, 50, 50);
//		ta.setFont(new Font(Font.MONOSPACED, Font.BOLD, 12));
		add(timeLeft);
		setVisible(true);
		Thread t = new Thread(timeLeft);
		t.start();
		
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	class Label extends JLabel implements Runnable {
		public static final long serialVersionUID = 1;
		private long time;
		public void setTimeLeft(long input) {
			time = input;
		}
		public void run() {
			try {
				while (true) {
					long difference = time - System.currentTimeMillis();
					int days = (int) (difference / 86400000);
					difference %= 86400000;
					int hours = (int) (difference/ 3600000);
					difference %= 3600000;
					int minutes = (int) (difference / 60000);
					difference %= 60000;
					int seconds = (int) (difference / 1000);
					if (days <= 0) {
						setText(hours + " hours " + minutes + " minutes " + seconds + " seconds left.");
						if (hours <= 0) {
							setText(minutes + " minutes " + seconds + " seconds left.");
							if (minutes <= 0) {
								setText(seconds + " seconds left.");
							}
						}
					} else {
						setText(days + " days " + hours + " hours " + minutes + " minutes " + seconds + " seconds left.");
					}
					Thread.sleep(1000);
				}
			} catch (InterruptedException ie) {
				System.out.println("ie: " + ie.getMessage());
			}
		}
	}
}