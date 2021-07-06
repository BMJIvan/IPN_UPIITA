using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RayCast : MonoBehaviour
{
    public LayerMask Piramide;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        RaycastHit Hit;

        if (Physics.Raycast(transform.position, transform.TransformDirection(Vector3.forward), out Hit))
        {
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * Hit.distance, Color.yellow);
            Debug.Log("Did Hit");
            Debug.Log(Hit.barycentricCoordinate.x+","+Hit.barycentricCoordinate.y+","+Hit.barycentricCoordinate.z);
        }
        else
        {
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * 1000, Color.white);
            Debug.Log("Did not Hit");
            
        }
    }
}
