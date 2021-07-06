using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class pruebagiros : MonoBehaviour
{

    int NT;
    Touch T0;
    Vector2 V0, P0;
    float vx, vy, px, py, mx, my;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        NT = Input.touchCount;
        if (NT != 0)
        {
            T0 = Input.GetTouch(0);
            P0 = T0.deltaPosition;
            vx = P0.x;
            vy = P0.y;
            if (vx > vy)
            {
                if (vx > 0)
                {
                    transform.RotateAround(transform.position, Vector3.back, 5 * Time.deltaTime);
                }
                else
                {

                }
            }

            Debug.Log(P0);
        }

    }
}