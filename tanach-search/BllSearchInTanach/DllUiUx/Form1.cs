using BllSearchInTanach;
using Newtonsoft.Json;
using System.Text.Json.Serialization;
using DalSearchInTanach;

namespace DllUiUx
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            searchAword d = new searchAword();
            List<int> u = d.searchDesiredWord("ад");
            label1.Text = JsonConvert.SerializeObject(u);
        }

        private void button2_Click(object sender, EventArgs e)
        {

         //   label2.Text =JsonConvert.(data.content);

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}