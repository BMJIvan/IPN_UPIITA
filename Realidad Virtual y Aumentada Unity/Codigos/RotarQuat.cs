using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotarQuat : MonoBehaviour
{

    float ax, ay, az;
    Quaternion qx, qy, qz;
    float t;
    float rx, ry, rz, rw;

    public GameObject pir1, pir2, pir3;
    // Start is called before the first frame update
    void Start()
    {
        Input.gyro.enabled = true;
    }

    // Update is called once per frame
    void Update()
    {
        t = Time.time;
        qx.w = Mathf.Cos(t / 2);
        qx.x = Mathf.Sin(t / 2);
        qx.y = 0; 
        qx.z = 0;

        qy.w = Mathf.Cos(t / 2);
        qy.x = 0;
        qy.y = Mathf.Sin(t / 2);
        qy.z = 0;

        qz.w = Mathf.Cos(t / 2);
        qz.x = 0;
        qz.y = 0;
        qz.z = Mathf.Sin(t / 2);

        rw = Input.gyro.attitude.w;
        rx = Input.gyro.attitude.x;
        ry = Input.gyro.attitude.y;
        rz = Input.gyro.attitude.z;

        qy.w = rw;
        qy.x = rx;
        qy.y = ry;
        qy.z = rz;

        pir1.transform.rotation = qx;
        pir2.transform.rotation = qy;
        pir3.transform.rotation = qz;




    }
}
