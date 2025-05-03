using Newtonsoft.Json;
using System;
using System.IO;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks.Dataflow;
using Enteties_Dto;

namespace DalSearchInTanach
{
    public class data
    {

        
   public static string content()
       {
            try {
                return File.ReadAllText("C:\\לימודים\\שנת י''ד\\C#\\TanachSearch\\tora.txt");
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }

        }

    public static dynamic  ContentByLines()
        {
            try
            {
                var x = File.ReadLines("C:\\לימודים\\שנת י''ד\\C#\\TanachSearch\\tora.txt");
                return x;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }
         public string getTora()
        {
            try
            {
                string Melachim = File.ReadAllText("C:\\לימודים\\שנת י''ד\\C#\\TanachSearch\\Melachim.json");
                return Melachim;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred: " + ex.Message);
                return null;
            }
        }

    }




}
