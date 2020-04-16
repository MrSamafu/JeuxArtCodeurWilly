using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Motion_Animator : MonoBehaviour
{

    public Animator anim;


    void Update()
    {
        
        anim.SetFloat("horizontal", Input.GetAxis("Horizontal"));
        anim.SetFloat("vertical", Input.GetAxis("Vertical"));

    }
}
