using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PrincipalGps : MonoBehaviour
    
{
    float Loi, Lai;
    float Lof, Laf, t;
    float dLo, dLa;
    float x, z, R, mag, esc;
    public GameObject L1;
    // Start is called before the first frame update
    void Start()
    {
        R = 6371000f;
        Lai = 19.511452f;//19.516090
        Loi =-99.126562f;//-99.13031//-99.126467
        Input.location.Start();
    }

    // Update is called once per frame
    void Update()
    {

        t = Time.time;
        if (t <= 3) { Input.location.Start(); }
        Lof = Input.location.lastData.longitude;
        Laf = Input.location.lastData.latitude;
        dLo = Mathf.Deg2Rad*(Lof - Loi);
        dLa = Mathf.Deg2Rad*(Laf - Lai);
        x = R * dLo*Mathf.Cos(Mathf.Deg2Rad*Laf);
        z = R * dLa;
        mag = Mathf.Sqrt((x * x) + (z * z));

        L1.transform.position = new Vector3(x+25, 2.3f, z-0);
        //L1.transform.position = new Vector3(x -50, 1f, z - 12);

    }
}
