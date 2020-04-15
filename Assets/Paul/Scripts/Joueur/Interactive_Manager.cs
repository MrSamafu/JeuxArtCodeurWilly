using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactive_Manager : MonoBehaviour
{

    Animator anim;
    public Camera Camera;


    void Start(){
        
        //COMPONENTS
        anim = GetComponentInChildren<Animator> ();

        //CURSOR
        Cursor.visible = true;
        Screen.lockCursor = true;

        //INIT PARAMETERS
        anim.SetBool("Have a pistol ?", false);
        anim.SetBool("Aim with pistol ?", false);
        anim.SetBool("Taking an object ?", false);

    }



    void Update(){
        


        if (Input.GetButtonDown("Use")){ 
            RaycastHit hit; 
            Ray ray = Camera.ScreenPointToRay(Input.mousePosition); 
            if (Physics.Raycast (ray,out hit,100.0f)) {
                if (hit.transform.name == "G18") {
                    anim.SetBool("Taking an object ?", true);
                }
            }
        }

        if (anim.GetCurrentAnimatorStateInfo(0).IsName("Taking an object ?")){
            anim.SetBool("Taking an object ?", false);
        }


        // VISER AVEC UN PISTOL
        if (Input.GetMouseButtonDown(1))
        anim.SetBool("Aim with pistol ?", true);

        else if (Input.GetMouseButtonUp(1))
        anim.SetBool("Aim with pistol ?", false);











    }


}
