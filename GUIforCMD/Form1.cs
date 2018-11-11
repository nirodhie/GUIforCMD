using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUIforCMD
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public void Form1_Load(object sender, EventArgs e)
        {
            Splash form2 = new Splash();
            form2.Show();
            label8.Text = RunPowerShellScript("HDDcapacity.ps1");
            form2.progressBar1.Value = 15;
            label1.Text = RunPowerShellScript("GetIP.ps1");
            form2.progressBar1.Value = 30;
            label10.Text = RunPowerShellScript("WindowsInstallDate.ps1");
            form2.progressBar1.Value = 45;
            label12.Text = RunPowerShellScript("upTime.ps1");
            form2.progressBar1.Value = 60;
            label3.Text = RunPowerShellScript("InstalledRAM.ps1");
            form2.progressBar1.Value = 75;
            label13.Text = RunPowerShellScript("battery.ps1");
            form2.progressBar1.Value = 95;
            label6.Text  =  RunPowerShellScript("BasicInfo.ps1");
            //progressbar działa tylko dlatego że w designerze modifiers ustawione są jako public
            form2.Close();

        }

        


        public string RunPowerShellScript(string scriptName)
        {
            Process proces_uruchamiajacy_komende = new Process();
            proces_uruchamiajacy_komende.StartInfo.UseShellExecute = false;
            proces_uruchamiajacy_komende.StartInfo.CreateNoWindow = true;
            proces_uruchamiajacy_komende.StartInfo.RedirectStandardOutput = true;
            proces_uruchamiajacy_komende.StartInfo.FileName = "RunPowershell.bat";
            proces_uruchamiajacy_komende.StartInfo.Arguments = scriptName;
            proces_uruchamiajacy_komende.Start();
            //proces_uruchamiajacy_komende.WaitForExit();
            proces_uruchamiajacy_komende.WaitForExit();

            var wynik = proces_uruchamiajacy_komende.StandardOutput.ReadToEnd();
            
            return wynik.Trim();
        }

        private void Label3_Click(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }
        private void tabPage2_Click(object sender, EventArgs e)
        {
            
        }

        

        private void tabPage4_Click(object sender, EventArgs e)
        {
            
        }

        private void tabPage3_Click(object sender, EventArgs e)
        {
           
        }


        private void label10_Click(object sender, EventArgs e)
        {

        }
    }
}
