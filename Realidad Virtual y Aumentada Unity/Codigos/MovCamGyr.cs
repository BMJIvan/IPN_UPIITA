using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovCamGyr : MonoBehaviour
{

    Quaternion q, qc;
    public GameObject camara;

    void Start()
    {
        Input.gyro.enabled = true;   
    }
    void Update()
    {

        qc = new Quaternion(0f, 0f, Mathf.Sin(Mathf.Deg2Rad * 90), Mathf.Cos(Mathf.Deg2Rad * 90));
        camara.transform.rotation = (Input.gyro.attitude)*qc;
        camara.transform.Rotate(90, 180, 0f, Space.World);
    }
}