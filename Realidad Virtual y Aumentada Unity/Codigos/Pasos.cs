using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;

public class Pasos : MonoBehaviour
{
    public GameObject cubo;
    float ax, ay, az;
    string[] TIEMPO = new string[500];
    string[] TAX = new string[500];
    string[] TAY = new string[500];
    string[] TAZ = new string[500];

    int contador = -1;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        contador++;
        ax = Input.acceleration.x;
        ay = Input.acceleration.y;
        az = Input.acceleration.z;
        cubo.transform.position = new Vector3(ax, ay+1, -az);
        if (contador < 500)
        {
            LLENADO();
        }
        if (contador == 500)
        {
            VACIADO();
            Debug.Log("Vaciado");
        }
      
    }

    void LLENADO()
    {
        TIEMPO[contador] = Time.time.ToString();
        TAX[contador] = ax.ToString();
        TAY[contador] = ay.ToString();
        TAZ[contador] = az.ToString();
    }

    void VACIADO()
    {
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/1.txt",TIEMPO);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/2.txt", TAX);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/3.txt", TAY);
        File.WriteAllLines("C:/Users/xmax1946/Desktop/semestre 8/Realidad virtual/Practica podometro/4.txt", TAZ);

    }
}

