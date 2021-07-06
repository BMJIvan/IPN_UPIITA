using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RealAumen : MonoBehaviour
{

    static WebCamTexture BackCam;
    public Text Tex1, Tex2;
    public Slider Slid1;
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
        }

        
        H =BackCam.height;
        W = BackCam.width;
        Tex1.text = H.ToString();
        Tex2.text = W.ToString();
        Tex2.text = Screen.width.ToString();
        al = W / H;
        FV = Cam.fieldOfView;
       

    }

    // Update is called once per frame
    public void Update()
    {
        MovPan();
        B = Mathf.Tan((Mathf.Deg2Rad*FV)/2) * Slid1.value*100;
        transform.localScale = new Vector3(al*B/5,1,B/5);

    }

    void MovPan()
    {
        transform.localPosition = new Vector3(0, 0, Slid1.value*100);
    }
}
