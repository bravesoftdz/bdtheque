using System;
using System.Text;
using System.Data;
using System.Data.SqlServerCe;
using System.IO;

namespace BD.PPC.Database
{
	public class BDPPCDatabase
	{
		private static BDPPCDatabase FDBConnection; // = null;

#if (DEBUG)
		public static BDPPCDatabase DebugDBConnection()
		{
			if (FDBConnection == null) 
			{
				FileInfo fi = new FileInfo(DatabaseName);
				if (fi.Exists) fi.Delete();
			}
			return DBConnection;
		}
#endif
		
		public static BDPPCDatabase DBConnection
		{
			get
			{ 
				if (FDBConnection == null) 
				{
					FDBConnection = new BDPPCDatabase();
					FDBConnection.ConnectToDatabase();
				}
				return FDBConnection; 
			}
		}

		static string DatabaseName = @"\My documents\BD.PPC\BD.sdf";
		public IDbConnection Connection;

		public BDPPCDatabase()
		{
		}

		public void ConnectToDatabase()
		{
			FileInfo fi = new FileInfo(DatabaseName);
			if (!fi.Exists) 
			{
				fi.Directory.Create();
				(new SqlCeEngine("Data Source=" + DatabaseName)).CreateDatabase();
			}
			Connection = new SqlCeConnection("Data source=" + DatabaseName);
			Connection.Open();
		}

		public static IDataParameter GetParameter(string nomParamètre, object value)
		{
			return new SqlCeParameter(nomParamètre, value);
		}

		public static IDbCommand GetCommand()
		{
			return DBConnection.Connection.CreateCommand(); 
		}

	}

}
