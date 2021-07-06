using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovCamGT : MonoBehaviour
{
    public GameObject camara;
    Quaternion q, qc;
    float vx0,vx1;
    int NT;
    Touch T0, T1;
    float px, py, pz;
    float mg, mga;
    bool zoom;
    float anx, any;
    float va, vr;
    int cont;
    void Start()
    {
        Input.gyro.enabled = true;
        zoom = true;
    }

    void Update()
    {
        
        qc = new Quaternion(0f, 0f, Mathf.Sin(Mathf.Deg2Rad * 90), Mathf.Cos(Mathf.Deg2Rad * 90));
        camara.transform.rotation = (Input.gyro.attitude) * qc;
        camara.transform.Rotate(90, 180, 0f, Space.World);

        anx = camara.transform.eulerAngles.x;
        any = camara.transform.eulerAngles.y;

        px = camara.transform.position.x;
        py = camara.transform.position.y;
        pz = camara.transform.position.z;
      
        NT = Input.touchCount;
        if (NT == 2)
        {
            T0 = Input.GetTouch(0);
            T1 = Input.GetTouch(1);
            vx0 = T0.deltaPosition.y;
            vx1 = T1.deltaPosition.y;

            px = camara.transform.position.x;
            py = camara.transform.position.y;
            pz = camara.transform.position.z;

            if ((vx0 > 5 && vx1 > 5) || (vx0 < -5 && vx1 < -5))
            {
                camara.transform.position = new Vector3(px, py + ((vx0 + vx1) / 120), pz);
            }
            else
            {
                mg = (T0.position - T1.position).magnitude;
                if (zoom == false)
                {
                    cont++;
                    if (cont == 4)
                    {
                        zoom = true;
                    }
                }
                else
                {
                    
                    if (mg > mga)
                    {                       
                        va = (mg - mga) * Time.deltaTime;
                       camara.transform.position = new Vector3(px + (Mathf.Sin(Mathf.Deg2Rad * (any)))*(Mathf.Cos(Mathf.Deg2Rad*anx)) * va, py + ((Mathf.Sin(Mathf.Deg2Rad * (-anx)))) * va, pz + ((Mathf.Cos(Mathf.Deg2Rad * (anx)))) * ((Mathf.Cos(Mathf.Deg2Rad * (any)))) * va);

                    }
                    else
                    {
                        vr = (mg-mga) * Time.deltaTime;
                       camara.transform.position = new Vector3(px + (Mathf.Sin(Mathf.Deg2Rad * (any)))*(Mathf.Cos(Mathf.Deg2Rad*anx)) * vr, py + ((Mathf.Sin(Mathf.Deg2Rad * (-anx)))) * vr, pz + ((Mathf.Cos(Mathf.Deg2Rad * (anx)))) * ((Mathf.Cos(Mathf.Deg2Rad * (any)))) * vr);
                    }
                }
                mga = mg;

            }
        }
        else
        {
            zoom = false;
            cont = 0;
        }
    }
}
