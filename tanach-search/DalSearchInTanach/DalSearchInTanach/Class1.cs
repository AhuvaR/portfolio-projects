using System;
using System.IO;
using System.Text;

namespace DalSearchInTanach
{
    public class Class1
    {

        public static string firstName = "gckgvh";
       //1.by reading
       public static string content = File.ReadAllText("C:\\לימודים\\שנת י''ד\\C#\\TanachSearch\\Tanach.txt");
        //2.only open
        //string path = @"C:\\לימודים\\שנת י''ד\\C#\\TanachSearch\\Tanach.txt";
        //FileStream fs = File.Open(path, FileMode.Open);
    }
}