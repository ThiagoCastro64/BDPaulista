package Dao;

import java.sql.SQLException;

import Model.Jogos;
import Model.Times;


public interface IAtividadeDao {
	public Jogos consultaJogos() throws SQLException;
}
