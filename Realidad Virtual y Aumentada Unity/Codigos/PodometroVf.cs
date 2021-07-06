using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEngine.UI;

public class PodometroVf : MonoBehaviour
{
    float az;
    float pasos;
    public Text texto;
    float tiempo, Out, SOut;
    float[] C, Int;
    public GameObject Esfera;
    bool MedPas;
    float V, Va;
    float NI;
    // Start is called before the first frame update
    void Start()
    {
        tiempo = 0;
        texto.fontSize = 35;
        C = new float[51];
        Int = new float[51];
        MedPas = false;

        C[0]= -0.035322f;
        C[1]= -0.028995f;
        C[2]= -0.020844f;
        C[3]= -0.012244f;
        C[4]= -0.0046827f;
        C[5]= 0.00047372f;
        C[6]= 0.0022029f;
        C[7]= 0.0f;
        C[8]= -0.0060176f;
        C[9]= -0.015093f;
        C[10]= -0.025906f;
        C[11]= -0.036731f;
        C[12]= -0.045661f;
        C[13]= -0.050869f;
        C[14]= -0.050861f;
        C[15]= -0.044701f;
        C[16]= -0.032172f;
        C[17]= -0.013843f;
        C[18]= 0.0089664f;
        C[19]= 0.034309f;
        C[20]= 0.059829f;
        C[21]= 0.083028f;
        C[22]= 0.10156f;
        C[23]= 0.11352f;
        C[24]= 0.11765f;
        C[25]= 0.11352f;
        C[26]= 0.10156f;
        C[27]= 0.083028f;
        C[28]= 0.059829f;
        C[29]= 0.034309f;
        C[30]= 0.0089664f;
        C[31]= -0.013843f;
        C[32]= -0.032172f;
        C[33]= -0.044701f;
        C[34]= -0.050861f;
        C[35]= -0.050869f;
        C[36]= -0.045661f;
        C[37]= -0.036731f;
        C[38]= -0.025906f;
        C[39]= -0.015093f;
        C[40]= -0.0060176f;
        C[41]= 0.0f;
        C[42]= 0.0022029f;
        C[43]= 0.00047372f;
        C[44]= -0.0046827f;
        C[45]= -0.012244f;
        C[46]= -0.020844f;
        C[47]= -0.028995f;
        C[48]= -0.035323f;
        C[49]= -0.038771f;
        C[50]= -0.038771f;
    }

    // Update is called once per frame
    void Update()
    {
      
        tiempo = tiempo + Time.deltaTime;

        if (tiempo > .02859f)
        {

            tiempo = 0;

            Out = 0;
            for (int i = 0; i < 50; i++)
            {
                Int[(int)(50 - i)] = Int[(int)(49 - i)];
            }
            Int[0] = Input.acceleration.y;
            NI = Input.acceleration.y + 1;
            for (int i = 0; i < 51; i++)
            {
                Out = Out + C[i] * Int[i];
            }

            if (Out > 0.03f&&NI>0)
            {
                SOut = 1;
            }
            else
            {
                if (Out < -0.03&&NI < 0)
                {
                    SOut = -1;
                }
                else
                {
                    SOut = 0;
                }
            }
            Va = V;
            V = SOut;

            if(Va==-1&&V==0)
            {
                MedPas = true;
            }
            if (MedPas == true && Va == 0 && V == 1)
            {
                pasos = pasos + 1;
                MedPas = false;
            }
            Esfera.transform.position = new Vector3(0f, SOut * 2, 4);
        }
       
        texto.text = "Pasos =" + pasos.ToString();
   
        
     
        /* if (contador < 500)
        {
            LLENADO();
        }
        if (contador == 500)
        {
            VACIADO();
            Debug.Log("Vaciado");
        }*/

    }

    /*void LLENADO()
    {
        TIEMPO[contador] = Time.time.ToString();
        TAZ[contador] = az.ToString();
        FPB[contador] = ou4.ToString();
        UM[contador] = ou5.ToString();

    }

    void VACIADO()
    {
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/1.txt", TIEMPO);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/2.txt", TAZ);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/3.txt", FPB);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/4.txt", UM);

    }*/
}

