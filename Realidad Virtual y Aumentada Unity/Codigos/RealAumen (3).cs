using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class RealAumen : MonoBehaviour
{

    static WebCamTexture BackCam;
    
    string nombres = "";
    float H, W;
    public Camera Cam;
    float FV,B,al;
    
    // Start is called before the first frame update
    void Start()
    {
        
        WebCamDevice[] devices = WebCamTexture.devices;
        for (int i = 0; i < devices.Length; i++)
        {
            
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
        }

        
        H =BackCam.height;
        W = BackCam.width;
        
        al = W / H;
        FV = Cam.fieldOfView;

        B = Mathf.Tan((Mathf.Deg2Rad * FV) / 2) * 100;
        transform.localScale = new Vector3(al * B / 4.5f, 1, B / 4.5f);

    }

    // Update is called once per frame
    public void Update()
    {
        
       

    }
}
