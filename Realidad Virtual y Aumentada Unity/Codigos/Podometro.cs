using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEngine.UI;

public class Podometro : MonoBehaviour
{
    float az;
    string[] TIEMPO = new string[500];
    string[] TAY = new string[500];
    string[] FPB = new string[500];
    string[] UM = new string[500];
    float c1, c2, c3, c4, c5, c6, c7;
    float in1, in2, in3, in4, ou1, ou2, ou3, ou4, ou5,ou5an;
    float pasosm,pasos;
    public Text texto;
    float tiempo;
    
    // Start is called before the first frame update
    void Start()
    {
        c1 = 0.0009426f;
        c2 = .002828f;
        c3 = .002828f;
        c4 = .0009426f;
        c5 = 2.582f;
        c6 = -2.246f;
        c7 = .657f;
        in4 = 0;
        in3 = 0;
        in2 = 0;
        in1 = 0;
        ou5an = 0;
        ou4 = 0; 
        ou3 = 0;
        ou2 = 0;
        ou1 = 0;
        tiempo = 0;
        texto.fontSize = 35;
        
    }

    // Update is called once per frame
    void Update()
    {
      
        
        in4 = Input.acceleration.y;

        ou4 = (in4 * c1) + (in3 * c2) + (in2 * c3) + (in1 * c4) + (ou3 * c5) + (ou2 * c6) + (ou1 * c7);
        if (ou4 > -.925f || ou4 < -1.075)
        {
            ou5 = 1;
        }
        else
        {
            ou5 = 0;
        }

        if (ou5an == 0 && ou5 == 1)
        {
            pasosm++;
        }

        ou5an = ou5;
        pasos = ((pasosm - (pasosm % 2)) / 2)-1;
        if (pasos < 0)
        {
            pasos = 0;
        }

        if (tiempo < 1)
        {
            tiempo = tiempo + Time.deltaTime;
        }
        else
        {
            texto.text = "Pasos =" + pasos.ToString();
        }
        
        ou1 = ou2;
        ou2 = ou3;
        ou3 = ou4;
        in1 = in2;
        in2 = in3;
        in3 = in4;

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

