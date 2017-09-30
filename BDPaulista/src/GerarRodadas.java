import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

import Dao.BuscarJogosDao;
import Dao.GerarRodadasDao;

public class GerarRodadas extends JFrame {
private JButton btGerarRodadas;
private JButton btVoltar;
private JTable tabRodadas;
private JPanel painelTabela;
private JPanel painelDeBotoes;
private JPanel painelPrincipal;
private JFrame menu;



public GerarRodadas(JFrame menu) {
	this.menu = menu;
	//instancia
	
	EventoGerarRodadas GeraRodadas = new EventoGerarRodadas();
	EventoVoltar voltar = new EventoVoltar(menu, this);
	btGerarRodadas = new JButton("Gerar rodada");
	btVoltar = new JButton("voltar");
	tabRodadas = new JTable();
	painelTabela = new JPanel(new GridLayout(2,2));
	painelPrincipal= new JPanel(new BorderLayout());
	painelDeBotoes = new JPanel();
	//conecta
	painelTabela.add(tabRodadas);
	painelDeBotoes.add( btGerarRodadas);
	painelDeBotoes.add(btVoltar);
	btVoltar.addActionListener(voltar);
	btGerarRodadas.addActionListener(GeraRodadas);
	painelPrincipal.add(painelTabela,BorderLayout.CENTER);
	painelPrincipal.add(painelDeBotoes,BorderLayout.SOUTH);
	
	
	
	//exibe a tela
	setContentPane(painelPrincipal);
	setSize(800, 300);
	setVisible(true);
}
public class EventoGerarRodadas implements ActionListener{
	public void actionPerformed(ActionEvent e) {
		
		GerarRodadasDao GeraRodadas= new GerarRodadasDao();
		
	}
	}
}
