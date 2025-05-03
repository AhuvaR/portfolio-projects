using DalSearchInTanach;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Enteties_Dto;
using DalSearchInTanach;
using Newtonsoft.Json;
using System.Reflection.PortableExecutable;

namespace BllSearchInTanach
{

    public class searchAword
    {



        public List<Location> searchADesiredWord(string str)
        {

            List<Location> result = new List<Location>();
            string chumash = "בראשית";
            string parasha = "בראשית";
            string perek = "א";
            string pasuk = "א";
            string tora = data.content();


            int c = 0;

            for (int i = 0; i < tora.Length; i++)
            {

                if (tora is string && i < tora.Length && tora[i] == '$')
                {
                    string startMarker = "^";
                    string endMarker = "~";
                    int startIndex = i + 4;
                    //endMarker,- startIndex 
                    int endIndex = tora.IndexOf(endMarker, i);
                    if (startIndex != -1 && endIndex != -1)
                    {
                        chumash = tora.Substring(startIndex, endIndex - startIndex);
                    }

                }

                else if (tora is string && i < tora.Length && tora[i] == '^')
                {
                    int startIndex = i;
                    int endIndex = data.content().IndexOf("\r", i);
                    if (startIndex != -1 && endIndex != -1)
                    {
                        parasha = data.content().Substring(startIndex + 1, endIndex - startIndex - 1);
                    }
                }
                else if (tora is string && i < tora.Length && tora[i] == '~')
                {

                    int startIndex = i;
                    int endIndex = tora.IndexOf("\r", i);
                    if (startIndex != -1 && endIndex != -1)
                    {
                        perek = tora.Substring(startIndex + 1, endIndex - startIndex - 1);
                    }

                }
                else if (tora is string && i < tora.Length && tora[i] == '!')
                {

                    int startIndex = i;
                    int endIndex = tora.IndexOf("}", i);
                    if (startIndex != -1 && endIndex != -1)
                    {
                        pasuk = tora.Substring(startIndex + 1, endIndex - startIndex - 1);
                    }

                }
                else if (tora[i] == str[0])
                {
                    int y = 0;
                    for (y = 0; y < str.Length && str[y] == tora[i + y]; y++) ;
                    if (y == str.Length)
                    {
                        Location a = new Location(chumash, parasha, perek, pasuk);
                        result.Add(a);
                    }

                }

            }
            return result;


        }

        public List<string> searchInMelachim(string word)
        {
            data d = new data();
            string toratxt = d.getTora();
            // navi tora = new();
            Navi tora = JsonConvert.DeserializeObject<Navi>(toratxt);

            List<string> resultList = new List<string>();
            //' string[] tr=

            if (tora != null && tora.melachim != null)
            {
                foreach (List<string> innerList in tora.melachim)
                {
                    foreach (string item in innerList)
                    {
                        // Here, you can perform your search logic based on the 'word' parameter
                        // For example:
                        if (item.Contains(word))
                        {
                            resultList.Add(item); // If 'word' is found in 'item', add it to the result list
                        }
                    }
                }

                return resultList;
            }// Return the list of strings containing the 'word'
            else { return null; }
        }

        public List<string> pasukLeHazmanot(string chatan,string calah) {

            List<string> result = new List<string>();
            var x = data.ContentByLines();
            bool found = false;
            int c = 0;
            bool firstCH = false;
            bool firstCA = false;
            string checkNotEquel="";
            foreach (var line in x)
            {
                if((line as  string).Contains(chatan) && (line as string).Contains(calah))
                { 
                    result.Add(line);
                    found = true;

                }
            }

            if(!found) {
                foreach (var line in x)
                {
                    firstCH = false;
                    firstCA=false;
                    string[] words = line.Split(' ');
                    foreach (string word in words)
                    {
                        if (word != "") { 
                        if (word[0] == chatan[0] && !firstCH)
                        {
                                checkNotEquel = word;
                                firstCH = true;
                        }
                        if (word[0] == calah[0] && checkNotEquel!=word)
                        {
                                firstCA = true;
                            }
                       
                        }

                    }
                    if (firstCA && firstCH)
                    {
                        result.Add(line);
                    }
                } 
            }


            return result;
        }
        /*
        public List<string> next()
        {

            List<string> result = new List<string>();
            var x = data.ContentByLines();
            bool found = false;
            int c = 0;
            bool firstCH = false;
            bool firstCA = false;
            string checkNotEquel = "";
            foreach (var line in x)
            {
                if ((line as string).Contains(chatan) && (line as string).Contains(calah))
                {
                    for(int i=0;i<line.)
                    {

                    }

                }
            }

            if (!found)
            {
                foreach (var line in x)
                {
                    firstCH = false;
                    firstCA = false;
                    string[] words = line.Split(' ');
                    foreach (string word in words)
                    {
                        if (word != "")
                        {
                            if (word[0] == chatan[0] && !firstCH)
                            {
                                checkNotEquel = word;
                                firstCH = true;
                            }
                            if (word[0] == calah[0] && checkNotEquel != word)
                            {
                                firstCA = true;
                            }

                        }

                    }
                    if (firstCA && firstCH)
                    {
                        result.Add(line);
                    }
                }
            }


            return result;
        }
        */

    }
}
