using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RealAumen : MonoBehaviour
{

    static WebCamTexture BackCam;
    public Text Tex1;
    string nombres = "";
    
    // Start is called before the first frame update
    void Start()
    {
        
        
        if (BackCam == null)
        {
            BackCam = new WebCamTexture();
        }

        GetComponent<Renderer>().material.mainTexture = BackCam;

        if (!BackCam.isPlaying)
        {
            BackCam.Play();
        }

        WebCamDevice[] devices = WebCamTexture.devices;
        for (int i = 0; i<devices.Length; i++)
        {
            //Debug.Log(devices[i].name);
            nombres = nombres + "" + devices[i].name.ToString();
        }

        Tex1.text =nombres;
    }

    // Update is called once per frame
    void Update()
    {
       
    }
}
