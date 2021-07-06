using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Principal : MonoBehaviour
{
    RaycastHit Hit;
    Ray RayoVector;
    Vector3 Origen, Director, Q1;
    public Text Tex1;
    public Camera Cam;
    Quaternion q0, q1, q2;
    float Sx, Sy;
    float Svx, Svy;
    Touch T0;
    float Nt;
    float Px, Py;
    float Xp, Yp;
    float FV;
    float foco;
    float An1, An2;
    float Ppx, Ppz;
    
    // Start is called before the first frame update
    void Start()
    {
        Sx = Screen.width;
        Sy = Screen.height;

        FV = Cam.fieldOfView;

        foco = (Sy / 2) / (Mathf.Tan(Mathf.Deg2Rad * (FV / 2)));

        
        Director = new Vector3(0f, 0f, 100f);
    }

    // Update is called once per frame
    void Update()
    {
        Nt = Input.touchCount;
        if (Nt == 1)
        {
            T0 = Input.GetTouch(0);
            Px = T0.position.x;
            Py = T0.position.y;
            //Tex1.text = "X= " + (Px - Sx / 2).ToString();
            //Tex2.text = "Y= " + (Py - Sy / 2).ToString();

            Xp = Px - Sx / 2;
            Yp = Py - Sy / 2;

            An1 = Mathf.Atan((Xp / foco)) * Mathf.Rad2Deg;
            An2 = Mathf.Atan((Yp / foco)) * Mathf.Rad2Deg;

            q1 = new Quaternion(Mathf.Sin(Mathf.Deg2Rad * (-An2/2)), 0f, 0f, Mathf.Cos(Mathf.Deg2Rad * (-An2/2)));
            q2 = new Quaternion(0f, Mathf.Sin(Mathf.Deg2Rad * An1/2), 0f, Mathf.Cos(Mathf.Deg2Rad * An1/2));


            //Tex1.text = "An1 = " + An1.ToString();
            //Tex2.text = "An2 = " + An2.ToString();

            Ppx = Cam.transform.position.x;
            Ppz = Cam.transform.position.z;

            Origen = new Vector3(Ppx, 0f, Ppz);
            Director = new Vector3(0f, 0f, 100f);
            q0 = Cam.transform.rotation;
            Q1 = q0 * q1 * q2 * Director;

            Q1 = new Vector3(Q1.x + Ppx, Q1.y, Q1.z + Ppz);

            RayoVector = new Ray(Origen, Q1);
            Physics.Raycast(RayoVector, out Hit);
            Tex1.text = Hit.collider.tag;

        }
        else
        {
            Tex1.text = "";
            //Tex2.text = "";
            //Tex3.text = "";
        }


       // RayoVector = new Ray(Origen, Q1);
        //Physics.Raycast(RayoVector, out Hit);
        //Debug.Log(Physics.Raycast(RayoVector, out Hit));
        //Debug.Log(foco);
        
        //Luz.transform.position = Hit.point;
        
       // Debug.DrawRay(Origen, Director,Color.red);
        

    }
}
