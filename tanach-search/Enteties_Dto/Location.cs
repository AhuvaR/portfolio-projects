using System.Security.Cryptography.X509Certificates;

namespace Enteties_Dto
{
    public class Location
    {
        public string sefer { get; set; }
        public string parasha { get; set; }
        public string perek { get; set; }
        public string pasuk { get; set; }

        public Location(string sefer, string parasha, string perek, string pasuk)
        {
            this.sefer = sefer;
            this.parasha = parasha;
            this.perek = perek;
            this.pasuk = pasuk;

        }
    }
}