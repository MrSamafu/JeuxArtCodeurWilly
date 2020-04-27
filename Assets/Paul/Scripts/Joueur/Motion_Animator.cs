using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Motion_Animator : MonoBehaviour
{

    Animator animator;
    float InputX;
    float InputY;

    void Start()
    {
        animator = this.gameObject.GetComponentInChildren<Animator>();
    }

    void Update()
    {
        
        InputY = Input.GetAxis("Vertical");
        InputX = Input.GetAxis("Horizontal");
        animator.SetFloat("InputX", InputX);
        animator.SetFloat("InputY", InputY);

    }
}
