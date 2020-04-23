using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IdleToCrouch : MonoBehaviour
{

    public Animator animator;
    float InputX;
    public float InputY;

    void Start()
    {
        animator = this.gameObject.GetComponentInChildren<Animator>();
    }

    // Update is called once per frame
    void Update(){
        InputY = Input.GetAxis("Vertical");
        InputX = Input.GetAxis("Horizontal");
        animator.SetFloat("InputX", InputX);
        animator.SetFloat("InputY", InputY);
    }
}
