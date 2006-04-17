using System;
using System.Collections;
using System.Data;
using System.Text;
using BD.PPC.Database;
using BD.PPC.Records;
using BD.Common.Records;
using TetramCorp.Database;
using TetramCorp.Utilities;

namespace BD.PPC.Lists
{
	/// <summary>
	/// Description r�sum�e de ListAuteurs.
	/// </summary>
	public class ListAuteurs : ArrayList
	{
		public ListAuteurs() : base()
		{
			ChargeDonn�es(null);
		}

		public ListAuteurs(string[] titreCommencePar) : base()
		{
			ChargeDonn�es(titreCommencePar);
		}
			
		public void ChargeDonn�es(string[] titreCommencePar)
		{
			using(new WaitingCursor())
			using(IDbCommand cmd = BDPPCDatabase.GetCommand())
			{
				StringBuilder SQL = new StringBuilder();
        cmd.Parameters.Clear();
        SQL.Append("SELECT REFPERSONNE, NOMPERSONNE FROM PERSONNES");
				if (titreCommencePar != null && titreCommencePar.Length > 0) 
				{
					SQL.Append("\nWHERE");
					for(int i = 0; i < titreCommencePar.Length; i++)
					{
						SQL.Append((i == 0 ? "" : "\nOR") + "\nUPPERNOMPERSONNE LIKE ?");
						cmd.Parameters.Add(BDPPCDatabase.GetParameter("@P" + i.ToString(), titreCommencePar[i].ToUpper() + "%"));
					}
				}
				SQL.Append("\nORDER BY UPPERNOMPERSONNE");
				cmd.CommandText = SQL.ToString();
				using (IDataReader result = cmd.ExecuteReader())
        using (BaseDataReader<Auteur> dataReader = new BaseDataReader<Auteur>(result))
					if (result != null)
						dataReader.FillList(this);
			}
		}
	}
}