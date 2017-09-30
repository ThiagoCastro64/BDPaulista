import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

import Dao.BuscarJogosDao;
	
	
public class BuscarJogos extends JFrame {

	private JButton btVoltar;
	private JButton btBuscar;
	private JLabel lblData;
	private JTable tabJogos;
	private JPanel painelTabela;
	private JPanel painelDeBotoes;
	private JPanel painelprincipal;
	private JTextField textoData;
    private JPanel painelTopo;
    private JFrame menu;

    
    
	public BuscarJogos(JFrame menu) {
		
		this.menu = menu;
		
		//instancia

		
		EventoVoltar voltar = new EventoVoltar(menu, this);
		EventoBotaoBuscar Buscar = new EventoBotaoBuscar();
		textoData = new JTextField(30);
		btVoltar = new JButton("voltar");
		tabJogos = new JTable();
		painelTabela = new JPanel(new GridLayout(2,2));
		painelprincipal= new JPanel(new BorderLayout());
		painelDeBotoes = new JPanel();
		painelTopo= new JPanel();
		lblData = new JLabel("Insira a data aqui");
		btBuscar = new JButton("Buscar");
		//conecta
		painelTopo.add(lblData);
		painelTopo.add(textoData);
		painelTopo.add(btBuscar);
		painelTabela.add(tabJogos);
		painelDeBotoes.add(btVoltar);
		btBuscar.addActionListener(Buscar);
		btVoltar.addActionListener(voltar);
		painelprincipal.add(painelTopo,BorderLayout.NORTH);
		painelprincipal.add(painelTabela,BorderLayout.CENTER);
		painelprincipal.add(painelDeBotoes,BorderLayout.SOUTH);
		
		
		
		//exibe a tela
		setContentPane(painelprincipal);
		setSize(800, 300);
		setVisible(true);
	}
	
	public class EventoBotaoBuscar implements ActionListener{
	public void actionPerformed(ActionEvent e) {
		
		BuscarJogosDao Busc= new BuscarJogosDao();
		
	}
	}
	
	
	}


