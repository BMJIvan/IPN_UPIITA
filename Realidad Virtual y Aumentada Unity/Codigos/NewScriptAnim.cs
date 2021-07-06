using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewScriptAnim : MonoBehaviour
{

    float E1,E2;
    Animator Anim;

    // Start is called before the first frame update
    void Start()
    {
        Anim = GetComponent<Animator>();   
    }

    // Update is called once per frame
    void Update()
    {
        E1 = Input.GetAxis("Vertical");
        E2 = Input.GetAxis("Horizontal");
        Debug.Log(E1);
        Anim.SetFloat("Avance", E1);
        Anim.SetFloat("Vuelta", E2);
    }
}
