using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovCamTou : MonoBehaviour
{

    int NT;
    Touch T0,T1;
    Vector2 V0, P0,Pt;
    float vx, vy, px, py, mx, my,mg,mga,avx,avy;
    float rx, ry, rz;
    bool zoom;

    // Start is called before the first frame update
    void Start()
    {
        zoom = false;
        rx = transform.rotation.eulerAngles.x;
        ry = transform.rotation.eulerAngles.y;
        rz = transform.rotation.eulerAngles.z;
    }

    // Update is called once per frame
    void Update()
    {
        NT = Input.touchCount;
        if (NT == 1)
        {
            T0 = Input.GetTouch(0);
            P0 = T0.deltaPosition;
            vx = P0.x;
            vy = P0.y;
            avx = Mathf.Abs(vx);
            avy = Mathf.Abs(vy);
            if (avx > avy)
            {
                if (vx > 0)
                {
                    //transform.Rotate(new Vector3(0f, Mathf.Abs(vx), 0f) * Time.deltaTime);
                    if (avx > .2f)
                    {
                        ry = ry + avx/20;
                    }
                }
                else
                {
                    //transform.Rotate(new Vector3(0f, -Mathf.Abs(vx), 0f) * Time.deltaTime);
                    if (avx > .2f)
                    {
                        ry = ry -avx/20;
                    }
                }
            }
            else
            {
                if (vy > 0)
                {
                    //transform.Rotate(new Vector3(-Mathf.Abs(vy), 0f, 0f) * Time.deltaTime);
                    if (avy > .2f)
                    {
                        rx = rx - avy/20;
                    }
                }
                else
                {
                    //transform.Rotate(new Vector3(Mathf.Abs(vx), 0f, 0f) * Time.deltaTime);
                    if (avy > .2f)
                    {
                        rx = rx + avy/20;
                    }
                }
            }
            transform.rotation = Quaternion.Euler(rx, ry, rz);
        }
        if (NT == 2)
        {
            T0 = Input.GetTouch(0);
            T1 = Input.GetTouch(1);
            Pt = T0.position - T1.position;
            mg = Pt.magnitude;

            if (zoom == false)
            {
                zoom = true;
            }
            else
            {
                if (mg > mga)
                {
                    transform.Translate(Vector3.forward * (mg - mga) * Time.deltaTime);
                }
                else
                {
                    transform.Translate(Vector3.back * (mga - mg) * Time.deltaTime);
                }
            }
            mga = mg;
        }
        else
        {
            zoom = false;
        }


    }
}