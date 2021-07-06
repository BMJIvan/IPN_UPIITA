using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovCamGir : MonoBehaviour
{
    float rx, ry, rz,rix,riy,riz,rixn,riyn,rizn;
    
    void Start()
    {
        Input.gyro.enabled=true;
        rx = transform.rotation.eulerAngles.x;
        ry = transform.rotation.eulerAngles.y;
        rz = transform.rotation.eulerAngles.z;
        rix = Input.gyro.attitude.x;
        riy = Input.gyro.attitude.y;
        riz = Input.gyro.attitude.z;
    }

    void Update()
    {
        //print(Mathf.Round(Input.acceleration.x*100)+","+ Mathf.Round(Input.acceleration.y*100)+","+ Mathf.Round(Input.acceleration.z*100));
        //print(Mathf.Round(Input.gyro.userAcceleration.x)*100+","+Mathf.Round(Input.gyro.userAcceleration.y)*100+","+Mathf.Round(Input.gyro.userAcceleration.z)*100);
        //print(Mathf.Round(Input.gyro.rotationRate.x* 100) +","+Mathf.Round(Input.gyro.rotationRateUnbiased.x* 100)+","+ Mathf.Round(Input.gyro.userAcceleration.x*100));
        //print(Mathf.Round(Input.gyro.attitude.x*100)+","+Mathf.Round(Input.gyro.attitude.y*100)+","+Mathf.Round(Input.gyro.attitude.z*100)+","+Mathf.Round(Input.gyro.attitude.w*100));
        rixn = Input.gyro.attitude.x;
        riyn = Input.gyro.attitude.y;
        rizn = Input.gyro.attitude.z;

        //transform.rotation = Quaternion.Euler(rx-(riyn-riy)*180,ry,rz+((rixn-rix)*180));//mantner objeto al rotar
        transform.rotation = Quaternion.Euler(rx + (rizn - riz) * 180, ry + (rixn - rix) * 180, rz);//mover camara 
        //transform.rotation = Quaternion.Euler(rx + (rizn - riz) * 180, ry + (rixn - rix) * 180, rz*(riyn-riy)*180);//mover camara 3 ejes 
    }
}
