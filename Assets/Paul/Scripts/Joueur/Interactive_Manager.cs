using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Interactive_Manager : MonoBehaviour
{

    Animator anim;
    public Camera Camera;

    public Cinemachine.CinemachineVirtualCamera MainFPSCamera;
    public Cinemachine.CinemachineVirtualCamera CameraInventory;
    public bool isInInventory = false;


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
        
        anim.SetFloat("horizontal", Input.GetAxisRaw("Horizontal"));

        if (Input.GetButtonDown("Use")){ 
            RaycastHit hit; 
            Ray ray = Camera.ScreenPointToRay(Input.mousePosition); 
            if (Physics.Raycast (ray, out hit, 100.0f)) {
                if (hit.transform.name == "G18") {
                    anim.SetBool("Taking an object ?", true);
                    StartCoroutine(WaitAnimGrabeObject());
                    Destroy(hit.transform.gameObject);
                }
            }

        }

        if (Input.GetButtonDown("Inventory")){
            if(isInInventory == false){ 
                CameraInventory.Priority = 1001;
                isInInventory = true;
            }
        }


        if (Input.GetButtonDown("Cancel")){ 
            if(isInInventory == true){ 
                isInInventory = false;
                CameraInventory.Priority = 1;
            }
        }


        // VISER AVEC UN PISTOL
        if (Input.GetMouseButtonDown(1))
        anim.SetBool("Aim with pistol ?", true);

        else if (Input.GetMouseButtonUp(1))
        anim.SetBool("Aim with pistol ?", false);









    }


    IEnumerator WaitAnimGrabeObject(){
        yield return new WaitForSeconds(4);
        anim.SetBool("Taking an object ?", false);
    }





}
