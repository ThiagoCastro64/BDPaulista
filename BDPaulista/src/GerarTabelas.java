import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

import Dao.GerarTabelasDao;
public class GerarTabelas extends JFrame {

private JButton btGerarTabela;
private JButton btVoltar;
private JLabel lblGrupoA;
private JLabel lblGrupoB;
private JLabel lblGrupoC;
private JLabel lblGrupoD;
private JTable tabGrupoA;
private JTable tabGrupoB;
private JTable tabGrupoC;
private JTable tabGrupoD;
private JPanel painelprincipal;
private JPanel painelTabela;	
private JPanel painelDeBotoes;
private JFrame menu;
public GerarTabelas(JFrame menu){
	this.menu = menu;
	//instanciando

	EventoBotaoGerarTabelas GerarTabelas = new EventoBotaoGerarTabelas();
	EventoVoltar voltar = new EventoVoltar(menu, this);
	btGerarTabela = new JButton("Gerar tabela");
	btVoltar = new JButton("voltar");
	lblGrupoA = new JLabel("Grupo A");
	lblGrupoB = new JLabel("Grupo B");
	lblGrupoC = new JLabel("Grupo C");
	lblGrupoD = new JLabel("Grupo D");
	tabGrupoA = new JTable();
	tabGrupoB = new JTable();
	tabGrupoC = new JTable();
	tabGrupoD = new JTable();
	painelTabela = new JPanel(new GridLayout(2,3));
	painelprincipal = new JPanel(new BorderLayout());
	painelDeBotoes = new JPanel();
	
	//conectando
	
	painelTabela.add(lblGrupoA);
	painelTabela.add(tabGrupoA);
	painelTabela.add(lblGrupoB);
	painelTabela.add(tabGrupoB);
	painelTabela.add(lblGrupoC);
	painelTabela.add(tabGrupoC);
	painelTabela.add(lblGrupoD);
	painelTabela.add(tabGrupoD);
	
	painelDeBotoes.add(btGerarTabela);
	painelDeBotoes.add(btVoltar);
	btVoltar.addActionListener(voltar);
	btGerarTabela.addActionListener(GerarTabelas);
	painelprincipal.add(painelDeBotoes,BorderLayout.SOUTH);
	
	painelprincipal.add(painelTabela,BorderLayout.CENTER);
	
	//exibe a tela
	setContentPane(painelprincipal);
	setSize(800, 300);
	setVisible(true);
}
public class EventoBotaoGerarTabelas implements ActionListener {
	
	public void actionPerformed(ActionEvent e) {
		GerarTabelasDao GerarTabelas= new GerarTabelasDao();
	}
}

}
