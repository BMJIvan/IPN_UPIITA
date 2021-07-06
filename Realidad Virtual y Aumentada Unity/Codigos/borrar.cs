using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class borrar : MonoBehaviour
{
    public GameObject cubo;
    float rx, ry, rz;
    float arx, ary, arz;
    bool cambio;
    Quaternion Q;
    // Start is called before the first frame update
    void Start()
    {
        //Debug.Log(transform.rotation.eulerAngles);
        //transform.Rotate(-90, 0, 0);
        //       transform.Rotate(0, 0, -90);
        //transform.Rotate(45, 30, 15,Space.World);
        Q = new Quaternion(0,0,0,1);
    }

    // Update is called once per frame
    void Update()
    {

        //transform.rotation.SetEulerAngles(Mathf.Deg2Rad*20, Mathf.Deg2Rad * 30, Mathf.Deg2Rad * 40);
        //Quaternion.Euler(20, 30, 40);
        //transform.Rotate(30, 0, 15);
        rx = cubo.transform.rotation.eulerAngles.x;
        ry = cubo.transform.rotation.eulerAngles.y;
        rz = cubo.transform.rotation.eulerAngles.z;


        if (arx == rx && ary == ry && arz == rz)
        { cambio = false; }
        else
        {
            cambio = true;
        }

        Debug.Log(transform.rotation.x.ToString()+","+ cubo.transform.rotation.y.ToString()+","+ cubo.transform.rotation.z.ToString()+","+ cubo.transform.rotation.w.ToString());



        if (cambio)
        {
            transform.rotation = cubo.transform.rotation;
        }

       // transform.rotation = new Quaternion(.2147f,.1888f,.3977f,.8718f);
        
        arx = rx;
        ary = ry;
        arz = rz;
    }
}
