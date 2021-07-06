using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Programa : MonoBehaviour
{
    public Text Text1, Text2, Text3;
    float M, t;
    Vector3 G;
    Quaternion Q0;
    public GameObject Cam;
    float anx, any;
    float Paso = 0.1f;
    float px, py, pz;
    // Start is called before the first frame update
    void Start()
    {
        Input.gyro.enabled = true;
        Input.location.Start();
        Input.compass.enabled = true;
    }

    // Update is called once per frame
    void Update()
    {
        t = Time.time;
        if (t <= 2)
        {
            Input.location.Start();
            Input.compass.enabled = true;
        }

        Q0 = Input.gyro.attitude;
        G = Q0.eulerAngles;
        M = Input.compass.trueHeading;

        Text1.text = Q0.ToString();
        Text2.text = G.ToString();
        Text3.text = M.ToString();

        anx = 0;
        any = M-90;

        Paso = Mathf.Abs(G.x * .02f);

        px = Cam.transform.position.x;
        py = Cam.transform.position.y;
        pz = Cam.transform.position.z;
        
        Cam.transform.position = new Vector3(px + (Mathf.Sin(Mathf.Deg2Rad * (any))) * (Mathf.Cos(Mathf.Deg2Rad * anx)) * Paso, 0f, pz + ((Mathf.Cos(Mathf.Deg2Rad * (anx)))) * ((Mathf.Cos(Mathf.Deg2Rad * (any)))) * Paso);
    }
}
