import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

public class Menu extends JFrame implements ActionListener{
	public JPanel painelMenu;
	private JButton buscaJogos;
	
	private JButton geraTabelas;
	private JButton geraRodadas;

	public Menu() {
		
		
		// instancia
		painelMenu = new JPanel();
		buscaJogos = new JButton("Buscar jogos");
		
		geraTabelas = new JButton("Gerar tabelas");
	
		geraRodadas = new JButton("Gerar Rodadas");

		// conecta
		painelMenu.add(buscaJogos);
		
		buscaJogos.addActionListener(this);
		painelMenu.add(geraTabelas);
		geraTabelas.addActionListener(this);
		painelMenu.add(geraRodadas);
		geraRodadas.addActionListener(this);
		
		
		
		
		setContentPane(painelMenu);
		setSize(800, 300);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		pack();

	}
	public void actionPerformed(ActionEvent e) {
		this.setVisible(false);
		if(e.getSource() == geraRodadas){
		GerarRodadas  gerRodadas = new GerarRodadas(this);		
		}else if (e.getSource()== geraTabelas){
			GerarTabelas  gerarTab = new GerarTabelas(this);	
		}else if(e.getSource()== buscaJogos){
			BuscarJogos  buscjogos = new BuscarJogos(this);
		}
}
	

	public static void main(String[] args) {
		Menu menu= new Menu();
		

	}

}