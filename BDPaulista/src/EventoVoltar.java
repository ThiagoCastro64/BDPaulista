import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;

public class EventoVoltar implements ActionListener {

	private JFrame JanelaQueTemQueVoltar;
	private JFrame JanelaQueTemQueFechar;

	public EventoVoltar(JFrame JanelaQueTemQueVoltar, JFrame JanelaQueTemQueFechar) {
		this.JanelaQueTemQueVoltar = JanelaQueTemQueVoltar;
		this.JanelaQueTemQueFechar = JanelaQueTemQueFechar;
	}
	
	public void actionPerformed(ActionEvent e) {
		JanelaQueTemQueVoltar.setVisible(true);		
		JanelaQueTemQueFechar.dispose();
	}
}
