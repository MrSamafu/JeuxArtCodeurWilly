using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IdleToCrouch : MonoBehaviour
{

    public Animator animator;
    float InputX;
    float InputY;


    void Start()
    {
        animator = this.gameObject.GetComponentInChildren<Animator>();
    }

    // Update is called once per frame
    private void Update(){
        InputY = Input.GetAxis("Vertical");
        InputX = Input.GetAxis("Horizontal");

        if (Input.GetButton("Crouch")){

            animator.SetBool("Crouch", true);

        }else{
            animator.SetBool("Crouch", false);
        }


    }
}
