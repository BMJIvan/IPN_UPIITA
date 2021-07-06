using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProgramaClase : MonoBehaviour
{
    Vector3 P1, P2;
    public Camera Cam;
    string nombres="";
    static WebCamTexture BackCam;
    float t;
    float[] Z;
    float[] Zpr;
    float[] Zspr;
    float li;
    public GameObject Eje;
    int cont;
    float Zp;
    // Start is called before the first frame update
    void Start()
    {
        WebCamDevice[] devices = WebCamTexture.devices;
        for (int i = 0; i < devices.Length; i++)
        {
            //Debug.Log(devices[i].name);
            nombres = nombres + "" + devices[i].name.ToString();
        }

        if (BackCam == null)
        {
            BackCam = new WebCamTexture(devices[0].name);
            BackCam.requestedHeight = 1960;
            BackCam.requestedWidth = 1080;
            BackCam.requestedFPS = 60;
        }

        GetComponent<Renderer>().material.mainTexture = BackCam;

        if (!BackCam.isPlaying)
        {
            BackCam.Play();
            Input.location.Start();
        }
        cont = 0;
        li = 7;
        Z = new float[(int)li];
        Zpr = new float[(int)li];
        Zspr = new float[(int)li];
    }

    // Update is called once per frame
    void Update()
    {
        t = Time.time;
        if (t <= 3) {
            Input.location.Start();
            Input.compass.enabled=true;
        }
        

        
        P1 = Cam.ViewportToWorldPoint(new Vector3(0f, 0f, Cam.farClipPlane));
        P2 = Cam.ViewportToWorldPoint(new Vector3(1f, 1f, Cam.farClipPlane));
        //Debug.Log(P1.ToString()+" "+P2.ToString());
        transform.localPosition = new Vector3(0, 0, Cam.farClipPlane-10f);
        transform.localScale = new Vector3((P2.x - P1.x) / 10, 1, (P2.y - P1.y) / 10);

        /*if (cont < 3)
        {
            Z[cont] = Input.compass.trueHeading;

            cont++;
            

        }
        if (cont == 3)
        {
            Zp = 0;
            for (int i = 0; i < 3; i++)
            {
                Zp = Zp + Z[i];
            }*/

        for (int i =0; i < li-1; i++)
        {
            Z[i] = Z[i+1];
        }
        Z[(int)li-1] = Input.compass.trueHeading;
        Debug.Log(Z[(int)li - 1]);
        Zp = 0;
        for (int i = 0; i < li; i++)
        {
            Zp = Zp + Z[i];
        }

        for (int i =0; i < li-1; i++)
        {
            Zpr[i] = Zpr[i+1];
        }
        Zpr[(int)li-1] = Zp / li;

        Zp = 0;
        for (int i = 0; i < li; i++)
        {
            Zp = Zp + Zpr[i];
        }


        for (int i = 0; i < li - 1; i++)
        {
            Zspr[i] = Zspr[i + 1];
        }
        Zspr[(int)li-1] = Zp / li;

        Zp = 0;
        for (int i = 0; i < li; i++)
        {
            Zp = Zp + Zspr[i];
        }


        cont++;
        if (cont == 1)
        {
            Eje.transform.eulerAngles = new Vector3(0, 360 - Zp / li, 0);
            cont = 0;
        }
            //cont = 0;
        
        //}
    }
}
