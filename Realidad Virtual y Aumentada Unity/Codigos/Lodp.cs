using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Lodp : MonoBehaviour
{
    public GameObject CRANEO;
    float px, py, pz;
    int cont,rep;

    // Start is called before the first frame update
    void Start()
    {
        px = 2.5f;
        py = 4.5f;
        pz = -30.5f;
        cont = 0;
        rep = 0;
        for (float i = 0; i < 21f; i++)
        {
            for (float k = 0; k <= 2; k++)
            {
                for (float j = 0; j <= 2; j++)
                {

                    
                    if (rep == 27)
                    {
                        rep = 0;
                        cont++;
                    }
                    rep++;
                    Instantiate(CRANEO, new Vector3(pz + (i * 2.5f) + (cont * 1.7f), py - j, px - k * 2), Quaternion.Euler(-90f, 180f, 0.0f));
                    
                }
            }
        }
    }

// Update is called once per frame
void Update()
    {
        
    }
}
